# Install Operating system and dependencies
FROM ubuntu:20.04 AS builder

ENV DEBIAN_FRONTEND noninteractive
ARG ENV
RUN apt-get update
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
RUN apt-get clean

#RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
RUN git clone --depth 1 --branch 3.35.3 https://github.com/flutter/flutter.git /usr/local/flutter

# Set Flutter environment path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Run flutter doctor
RUN flutter doctor -v
#RUN flutter channel stable
#RUN flutter upgrade

# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter clean
RUN flutter pub get
RUN flutter build web --dart-define-from-file=${ENV}

# Stage 2 - Create the run-time image
FROM nginx:1.23-alpine AS runner
ARG NGINX_FILE
COPY server/${NGINX_FILE}  /etc/nginx/conf.d
#COPY server/keys/certificate.crt /etc/nginx/certs/certificate.crt
#COPY server/keys/private.key /etc/nginx/keys/private.key

# COPY package.json /usr/share/nginx/html
COPY --from=builder /app/build/web /usr/share/nginx/html


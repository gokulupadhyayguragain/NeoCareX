import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmailSentWidget extends StatelessWidget {
  const EmailSentWidget({
    super.key,
    required this.emailEditingControllere,
    required this.makeEmailTrue,
    required this.isRecovery,
  });
  final bool isRecovery;

  final Function makeEmailTrue;
  final TextEditingController emailEditingControllere;
  final emailContent = "Please check your email address";

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    ;

    return isMobile
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/tick.png', // replace with your image file name and extension
                width: 90, // set the width of the image
                height: 90, // set the height of the image
              ),
              const SizedBox(height: 10),
              Text(
                "Email Sent",
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(fontSize: 21),
              ),
              const SizedBox(height: 10),
              Text(
                emailContent,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  isRecovery
                      ? context.goNamed('login')
                      : context.goNamed('login');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color(0xff24488E),
                ),
                child: Text(
                  isRecovery ? 'Go to Login page' : 'Go to Profile page',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  makeEmailTrue();
                },
                child: const Text('Didn\'t get any email?'),
              ),
              const SizedBox(height: 55),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Card(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(height: 40),
                        Image.asset(
                          'assets/images/tick.png', // replace with your image file name and extension
                          width: 90, // set the width of the image
                          height: 90, // set the height of the image
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Email Sent",
                          style: Theme.of(
                            context,
                          ).textTheme.labelLarge!.copyWith(fontSize: 21),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          emailContent,
                          textAlign: TextAlign.center,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            isRecovery
                                ? context.goNamed('login')
                                : context.goNamed('login');
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: const Color(0xff24488E),
                          ),
                          child: Text(
                            isRecovery
                                ? 'Go to Login page'
                                : 'Go to Profile page',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            makeEmailTrue();
                          },
                          child: const Text('Didn\'t get any email?'),
                        ),
                        const SizedBox(height: 55),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}

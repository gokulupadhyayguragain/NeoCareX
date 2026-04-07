class UserResourceModel {
  UserProfileResource? resource;

  UserResourceModel({this.resource});

  factory UserResourceModel.fromJson(Map<String, dynamic> json) {
    return UserResourceModel(
      resource: json['resource'] != null
          ? UserProfileResource.fromJson(json['resource'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'resource': resource?.toJson()};
  }
}

class UserProfileResource {
  List<UserProfileAddress>? addresses;
  String? email;
  UserProfileName? name;
  String? photo;
  UserProfileOrganization? organization;
  String? resourceType;
  String? id;
  List<Identifier>? identifier;
  String? phoneNumber;
  List<dynamic>? phoneNumbers;
  bool? deactivated;
  List<dynamic>? extension; // Replace with appropriate type if needed

  UserProfileResource({
    this.addresses,
    this.email,
    this.name,
    this.photo,
    this.organization,
    this.resourceType,
    this.id,
    this.identifier,
    this.phoneNumber,
    this.phoneNumbers,
    this.deactivated,
    this.extension,
  });

  factory UserProfileResource.fromJson(Map<String, dynamic> json) {
    return UserProfileResource(
      addresses: json['addresses'] != null
          ? (json['addresses'] as List)
                .map((a) => UserProfileAddress.fromJson(a))
                .toList()
          : null,
      email: json['email'],
      name: json['name'] != null
          ? UserProfileName.fromJson(json['name'])
          : null,
      photo: json['photo'],
      organization: json['organization'] != null
          ? UserProfileOrganization.fromJson(json['organization'])
          : null,
      resourceType: json['resourceType'],
      id: json['id'],
      identifier: json['identifier'] != null
          ? (json['identifier'] as List)
                .map((i) => Identifier.fromJson(i))
                .toList()
          : null,
      phoneNumber: json['phoneNumber'],
      phoneNumbers: json['phoneNumbers'],
      deactivated: json['deactivated'],
      extension: json['extension'],
    );
  }
  UserProfileResource copyWith({
    List<UserProfileAddress>? addresses,
    String? email,
    UserProfileName? name,
    String? photo,
    UserProfileOrganization? organization,
    String? resourceType,
    String? id,
    List<Identifier>? identifier,
    String? phoneNumber,
    List<dynamic>? phoneNumbers,
    bool? deactivated,
    List<dynamic>? extension,
  }) {
    return UserProfileResource(
      addresses: addresses ?? this.addresses,
      email: email ?? this.email,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      organization: organization ?? this.organization,
      resourceType: resourceType ?? this.resourceType,
      id: id ?? this.id,
      identifier: identifier ?? this.identifier,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      phoneNumbers: phoneNumbers ?? this.phoneNumbers,
      deactivated: deactivated ?? this.deactivated,
      extension: extension ?? this.extension,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addresses': addresses?.map((a) => a.toJson()).toList(),
      'email': email,
      'name': name?.toJson(),
      'photo': photo,
      'organization': organization?.toJson(),
      'resourceType': resourceType,
      'id': id,
      'identifier': identifier?.map((i) => i.toJson()).toList(),
      'phoneNumber': phoneNumber,
      'phoneNumbers': phoneNumbers,
      'deactivated': deactivated,
      'extension': extension,
    };
  }
}

class UserProfileAddress {
  String? type;
  String? region;
  String? country;
  String? locality;
  String? postalCode;
  String? streetAddress;

  UserProfileAddress({
    this.type,
    this.region,
    this.country,
    this.locality,
    this.postalCode,
    this.streetAddress,
  });

  factory UserProfileAddress.fromJson(Map<String, dynamic> json) {
    return UserProfileAddress(
      type: json['type'],
      region: json['region'],
      country: json['country'],
      locality: json['locality'],
      postalCode: json['postalCode'],
      streetAddress: json['streetAddress'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'region': region,
      'country': country,
      'locality': locality,
      'postalCode': postalCode,
      'streetAddress': streetAddress,
    };
  }
}

class Identifier {
  String? value;
  String? system;

  Identifier({this.value, this.system});

  factory Identifier.fromJson(Map<String, dynamic> json) {
    return Identifier(value: json['value'], system: json['system']);
  }

  Map<String, dynamic> toJson() {
    return {'value': value, 'system': system};
  }
}

class UserProfileName {
  String? formatted;
  String givenName;
  String familyName;

  UserProfileName({
    this.formatted,
    required this.givenName,
    required this.familyName,
  });

  factory UserProfileName.fromJson(Map<String, dynamic> json) {
    return UserProfileName(
      formatted: json['formatted'],
      givenName: json['givenName'] ?? '',
      familyName: json['familyName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'formatted': formatted,
      'givenName': givenName,
      'familyName': familyName,
    };
  }
}

class UserProfileOrganization {
  String? reference;

  UserProfileOrganization({this.reference});

  factory UserProfileOrganization.fromJson(Map<String, dynamic> json) {
    return UserProfileOrganization(reference: json['reference']);
  }

  Map<String, dynamic> toJson() {
    return {'reference': reference};
  }
}

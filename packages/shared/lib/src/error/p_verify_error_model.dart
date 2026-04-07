// To parse this JSON data, do
//
//     final pVerifyError = pVerifyErrorFromJson(jsonString);

import 'dart:convert';

PVerifyError pVerifyErrorFromJson(String str) => PVerifyError.fromJson(json.decode(str));

String pVerifyErrorToJson(PVerifyError data) => json.encode(data.toJson());

class PVerifyError {
    final List<String> errors;

    PVerifyError({
        required this.errors,
    });

    factory PVerifyError.fromJson(Map<String, dynamic> json) => PVerifyError(
        errors: List<String>.from(json["errors"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "errors": List<dynamic>.from(errors.map((x) => x)),
    };
}

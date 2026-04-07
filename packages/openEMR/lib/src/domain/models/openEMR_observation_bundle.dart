class ObservationBundle {
  ObservationBundle({this.fullUrl, this.resource});

  factory ObservationBundle.fromJson(Map<String, dynamic> json) {
    return ObservationBundle(
      fullUrl: json['fullUrl'] as String?,
      resource: json['resource'] != null
          ? Observation.fromJson(json['resource'] as Map<String, dynamic>)
          : null,
    );
  }
  final String? fullUrl;
  final Observation? resource;

  Map<String, dynamic> toJson() {
    return {
      'fullUrl': fullUrl,
      'resource': resource?.toJson(),
    };
  }
}

class Observation {
  final String? id;
  final Meta? meta;
  final String? resourceType;
  final String? status;
  final List<Category>? category;
  final Code? code;
  final Subject? subject;
  final String? effectiveDateTime;
  final ValueQuantity? valueQuantity;
  final List<Component>? component;
  final List<HasMember>? hasMember;

  Observation({
    this.id,
    this.meta,
    this.resourceType,
    this.status,
    this.category,
    this.code,
    this.subject,
    this.effectiveDateTime,
    this.valueQuantity,
    this.component,
    this.hasMember,
  });

  factory Observation.fromJson(Map<String, dynamic> json) => Observation(
        id: json['id'],
        meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
        resourceType: json['resourceType'],
        status: json['status'],
        category: (json['category'] as List?)
            ?.map((e) => Category.fromJson(e))
            .toList(),
        code: json['code'] != null ? Code.fromJson(json['code']) : null,
        subject:
            json['subject'] != null ? Subject.fromJson(json['subject']) : null,
        effectiveDateTime: json['effectiveDateTime'],
        valueQuantity: json['valueQuantity'] != null
            ? ValueQuantity.fromJson(json['valueQuantity'])
            : null,
        component: (json['component'] as List?)
            ?.map((e) => Component.fromJson(e))
            .toList(),
        hasMember: (json['hasMember'] as List?)
            ?.map((e) => HasMember.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'meta': meta?.toJson(),
        'resourceType': resourceType,
        'status': status,
        'category': category?.map((e) => e.toJson()).toList(),
        'code': code?.toJson(),
        'subject': subject?.toJson(),
        'effectiveDateTime': effectiveDateTime,
        'valueQuantity': valueQuantity?.toJson(),
        'component': component?.map((e) => e.toJson()).toList(),
        'hasMember': hasMember?.map((e) => e.toJson()).toList(),
      };
}

class HasMember {
  HasMember({this.reference, this.type, this.display});

  factory HasMember.fromJson(Map<String, dynamic> json) {
    return HasMember(
      reference: json['reference'] as String?,
      type: json['type'] as String?,
      display: json['display'] as String?,
    );
  }
  final String? reference;
  final String? type;
  final String? display;

  Map<String, dynamic> toJson() {
    return {
      'reference': reference,
      'type': type,
      if (display != null) 'display': display,
    };
  }
}

class Meta {
  final String? versionId;
  final String? lastUpdated;

  Meta({this.versionId, this.lastUpdated});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        versionId: json['versionId'],
        lastUpdated: json['lastUpdated'],
      );

  Map<String, dynamic> toJson() => {
        'versionId': versionId,
        'lastUpdated': lastUpdated,
      };
}

class Category {
  final List<Coding>? coding;

  Category({this.coding});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        coding:
            (json['coding'] as List?)?.map((e) => Coding.fromJson(e)).toList(),
      );

  Map<String, dynamic> toJson() => {
        'coding': coding?.map((e) => e.toJson()).toList(),
      };
}

class Code {
  final List<Coding>? coding;
  final String? text;

  Code({this.coding, this.text});

  factory Code.fromJson(Map<String, dynamic> json) => Code(
        coding:
            (json['coding'] as List?)?.map((e) => Coding.fromJson(e)).toList(),
        text: json['text'],
      );

  Map<String, dynamic> toJson() => {
        'coding': coding?.map((e) => e.toJson()).toList(),
        if (text != null) 'text': text,
      };
}

class Coding {
  final String? system;
  final String? code;
  final String? display;

  Coding({this.system, this.code, this.display});

  factory Coding.fromJson(Map<String, dynamic> json) => Coding(
        system: json['system'],
        code: json['code'],
        display: json['display'],
      );

  Map<String, dynamic> toJson() => {
        'system': system,
        'code': code,
        'display': display,
      };
}

class Subject {
  final String? reference;
  final String? type;

  Subject({this.reference, this.type});

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        reference: json['reference'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
        'reference': reference,
        'type': type,
      };
}

class ValueQuantity {
  final double? value;
  final String? unit;
  final String? system;
  final String? code;

  ValueQuantity({this.value, this.unit, this.system, this.code});

  factory ValueQuantity.fromJson(Map<String, dynamic> json) => ValueQuantity(
        value: (json['value'] as num?)?.toDouble(),
        unit: json['unit'],
        system: json['system'],
        code: json['code'],
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'unit': unit,
        'system': system,
        'code': code,
      };
}

class Component {
  final Code? code;
  final ValueQuantity? valueQuantity;

  Component({this.code, this.valueQuantity});

  factory Component.fromJson(Map<String, dynamic> json) => Component(
        code: json['code'] != null ? Code.fromJson(json['code']) : null,
        valueQuantity: json['valueQuantity'] != null
            ? ValueQuantity.fromJson(json['valueQuantity'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'code': code?.toJson(),
        'valueQuantity': valueQuantity?.toJson(),
      };
}

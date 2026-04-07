class Observation {
  List<Category>? category;
  Meta? meta;
  String? resourceType;
  List<Component>? component;
  ValueWrapper? value;
  String? status;
  Effective? effective;
  String? id;
  Code? code;
  Device? device;

  Observation({
    this.category,
    this.meta,
    this.resourceType,
    this.component,
    this.value,
    this.status,
    this.effective,
    this.id,
    this.code,
    this.device,
  });

  factory Observation.fromJson(Map<String, dynamic> json) {
    return Observation(
      category: (json['category'] as List?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] != null ? Meta.fromJson(json['meta'] as Map<String, dynamic>) : null,
      resourceType: json['resourceType'] as String?,
      component: (json['component'] as List?)
          ?.map((e) => Component.fromJson(e as Map<String, dynamic>))
          .toList(),
      value: json['value'] != null
          ? ValueWrapper.fromJson(json['value'] as Map<String, dynamic>)
          : null,
      status: json['status'] as String?,
      effective: json['effective'] != null
          ? Effective.fromJson(json['effective'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      code: json['code'] != null ? Code.fromJson(json['code'] as Map<String, dynamic>) : null,
      device: json['device'] != null ? Device.fromJson(json['device'] as Map<String, dynamic>) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category?.map((e) => e.toJson()).toList(),
      'meta': meta?.toJson(),
      'resourceType': resourceType,
      'component': component?.map((e) => e.toJson()).toList(),
      'value': value?.toJson(),
      'status': status,
      'effective': effective?.toJson(),
      'id': id,
      'code': code?.toJson(),
      'device': device?.toJson(),
    };
  }

  double? getBloodSugarValue() {
    try {
      return value?.quantity?.value?.toDouble();
    } catch (e) {
      return null;
    }
  }

  double? getSystolicValue() {
    try {
      if (component != null && component!.length > 0) {
        return component![0].value?.quantity?.value?.toDouble();
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  double? getDiastolicValue() {
    try {
      if (component != null && component!.length > 1) {
        return component![1].value?.quantity?.value?.toDouble();
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  double? getPulseValue() {
    try {
      return value?.quantity?.value?.toDouble();
    } catch (e) {
      return null;
    }
  }

  String? getFormattedLastUpdated() {
    return meta?.lastUpdated;
  }
}

class Meta {
  String? versionId;
  String? lastUpdated;
  String? createdAt;

  Meta({this.versionId, this.lastUpdated, this.createdAt});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      versionId: json['versionId'] as String?,
      lastUpdated: json['lastUpdated'] as String?,
      createdAt: json['createdAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'versionId': versionId,
    'lastUpdated': lastUpdated,
    'createdAt': createdAt,
  };
}

class Category {
  List<Coding>? coding;

  Category({this.coding});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      coding: (json['coding'] as List?)
          ?.map((e) => Coding.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'coding': coding?.map((e) => e.toJson()).toList(),
  };
}

class Coding {
  String? code;
  String? system;
  String? display;

  Coding({this.code, this.system, this.display});

  factory Coding.fromJson(Map<String, dynamic> json) {
    return Coding(
      code: json['code'] as String?,
      system: json['system'] as String?,
      display: json['display'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'code': code,
    'system': system,
    'display': display,
  };
}

class Component {
  Code? code;
  ValueWrapper? value;

  Component({this.code, this.value});

  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
      code: json['code'] != null ? Code.fromJson(json['code'] as Map<String, dynamic>) : null,
      value: json['value'] != null
          ? ValueWrapper.fromJson(json['value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'code': code?.toJson(),
    'value': value?.toJson(),
  };
}

class ValueWrapper {
  Quantity? quantity;

  ValueWrapper({this.quantity});

  factory ValueWrapper.fromJson(Map<String, dynamic> json) {
    return ValueWrapper(
      quantity: json['Quantity'] != null
          ? Quantity.fromJson(json['Quantity'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {'Quantity': quantity?.toJson()};
}

class Quantity {
  String? code;
  String? unit;
  num? value;
  String? system;

  Quantity({this.code, this.unit, this.value, this.system});

  factory Quantity.fromJson(Map<String, dynamic> json) {
    return Quantity(
      code: json['code'] as String?,
      unit: json['unit'] as String?,
      value: json['value'] as num?,
      system: json['system'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'code': code,
    'unit': unit,
    'value': value,
    'system': system,
  };
}

class Effective {
  String? dateTime;

  Effective({this.dateTime});

  factory Effective.fromJson(Map<String, dynamic> json) {
    return Effective(dateTime: json['dateTime'] as String?);
  }

  Map<String, dynamic> toJson() => {'dateTime': dateTime};
}

class Code {
  List<Coding>? coding;

  Code({this.coding});

  factory Code.fromJson(Map<String, dynamic> json) {
    return Code(
      coding: (json['coding'] as List?)
          ?.map((e) => Coding.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'coding': coding?.map((e) => e.toJson()).toList(),
  };
}

class Device {
  String? id;
  String? resourceType;
  String? reference;

  Device({this.id, this.resourceType, this.reference});

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'] as String?,
      resourceType: json['resourceType'] as String?,
      reference: json['reference'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'resourceType': resourceType,
    'reference': reference,
  };
}
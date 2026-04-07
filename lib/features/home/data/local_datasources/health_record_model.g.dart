// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_record_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HealthRecordModelAdapter extends TypeAdapter<HealthRecordModel> {
  @override
  final int typeId = 0;

  @override
  HealthRecordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HealthRecordModel(
      id: fields[0] as String,
      timestamp: fields[1] as DateTime,
      systolic: fields[2] as int,
      diastolic: fields[3] as int,
      pulse: fields[4] as int,
      weight: fields[5] as double,
      hypertensionStage: fields[6] as String,
      bloodSugar: fields[7] as double,
      spo2: fields[8] as double,
    );
  }

  @override
  void write(BinaryWriter writer, HealthRecordModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.timestamp)
      ..writeByte(2)
      ..write(obj.systolic)
      ..writeByte(3)
      ..write(obj.diastolic)
      ..writeByte(4)
      ..write(obj.pulse)
      ..writeByte(5)
      ..write(obj.weight)
      ..writeByte(6)
      ..write(obj.hypertensionStage)
      ..writeByte(7)
      ..write(obj.bloodSugar)
      ..writeByte(8)
      ..write(obj.spo2);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HealthRecordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

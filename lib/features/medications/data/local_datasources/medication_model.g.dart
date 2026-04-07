// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicationModelAdapter extends TypeAdapter<MedicationModel> {
  @override
  final int typeId = 1;

  @override
  MedicationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicationModel(
      id: fields[0] as String,
      name: fields[1] as String,
      dosage: fields[2] as String,
      frequency: fields[3] as String,
      times: (fields[4] as List).cast<TimeOfDayModel>(),
      startDate: fields[5] as DateTime,
      endDate: fields[6] as DateTime?,
      notes: fields[7] as String?,
      isActive: fields[8] as bool,
      prescribedBy: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MedicationModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.dosage)
      ..writeByte(3)
      ..write(obj.frequency)
      ..writeByte(4)
      ..write(obj.times)
      ..writeByte(5)
      ..write(obj.startDate)
      ..writeByte(6)
      ..write(obj.endDate)
      ..writeByte(7)
      ..write(obj.notes)
      ..writeByte(8)
      ..write(obj.isActive)
      ..writeByte(9)
      ..write(obj.prescribedBy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TimeOfDayModelAdapter extends TypeAdapter<TimeOfDayModel> {
  @override
  final int typeId = 2;

  @override
  TimeOfDayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeOfDayModel(
      hour: fields[0] as int,
      minute: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TimeOfDayModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hour)
      ..writeByte(1)
      ..write(obj.minute);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeOfDayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

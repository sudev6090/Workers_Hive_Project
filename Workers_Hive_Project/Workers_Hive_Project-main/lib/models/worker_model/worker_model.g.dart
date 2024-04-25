// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkerModelAdapter extends TypeAdapter<WorkerModel> {
  @override
  final int typeId = 1;

  @override
  WorkerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkerModel(
      image: fields[0] as String,
      name: fields[1] as String,
      job: fields[2] as String,
      place: fields[3] as String,
      phone: fields[4] as String,
      fees: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WorkerModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.job)
      ..writeByte(3)
      ..write(obj.place)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.fees);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

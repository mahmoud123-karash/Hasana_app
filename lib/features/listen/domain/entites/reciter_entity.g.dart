// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reciter_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReciterEntityAdapter extends TypeAdapter<ReciterEntity> {
  @override
  final int typeId = 0;

  @override
  ReciterEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReciterEntity(
      id: fields[0] as int,
      name: fields[1] as String,
      style: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReciterEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.style);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReciterEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

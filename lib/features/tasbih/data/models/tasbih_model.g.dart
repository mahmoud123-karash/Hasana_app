// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasbih_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasbihModelAdapter extends TypeAdapter<TasbihModel> {
  @override
  final int typeId = 1;

  @override
  TasbihModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TasbihModel(
      fields[1] as String?,
      fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TasbihModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasbihModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

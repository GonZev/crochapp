// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pattern_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PatternModelAdapter extends TypeAdapter<PatternModel> {
  @override
  final int typeId = 0;

  @override
  PatternModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PatternModel(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PatternModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PatternModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

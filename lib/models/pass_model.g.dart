// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pass_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PassDataAdapter extends TypeAdapter<PassData> {
  @override
  final int typeId = 0;

  @override
  PassData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PassData(
      title: fields[0] as String,
      username: fields[1] as String,
      password: fields[2] as String,
      email: fields[3] as String,
      addDetails: fields[4] as String,
      lastUpdate: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PassData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.addDetails)
      ..writeByte(5)
      ..write(obj.lastUpdate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PassDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JokeAdapter extends TypeAdapter<Joke> {
  @override
  final int typeId = 0;

  @override
  Joke read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Joke(
      id: fields[0] as String,
      value: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Joke obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JokeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

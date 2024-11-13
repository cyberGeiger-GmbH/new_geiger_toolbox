// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_perference.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserPerferenceAdapter extends TypeAdapter<UserPerference> {
  @override
  final int typeId = 1;

  @override
  UserPerference read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserPerference(
      termsAndConditions: fields[0] as bool,
      initialScan: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, UserPerference obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.termsAndConditions)
      ..writeByte(1)
      ..write(obj.initialScan);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPerferenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_feed.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsFeedAdapter extends TypeAdapter<NewsFeed> {
  @override
  final int typeId = 0;

  @override
  NewsFeed read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsFeed(
      news: fields[0] as News,
    );
  }

  @override
  void write(BinaryWriter writer, NewsFeed obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.news);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsFeedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

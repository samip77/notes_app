// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_note.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalNoteAdapter extends TypeAdapter<_$_LocalNote> {
  @override
  final int typeId = 0;

  @override
  _$_LocalNote read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_LocalNote(
      id: fields[1] as String,
      title: fields[2] as String,
      content: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_LocalNote obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalNoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocalNote _$$_LocalNoteFromJson(Map<String, dynamic> json) => _$_LocalNote(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$_LocalNoteToJson(_$_LocalNote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
    };

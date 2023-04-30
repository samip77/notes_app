// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/domain/features/notes/models/note.dart';

part 'local_note.g.dart';
part 'local_note.freezed.dart';

@freezed
class LocalNote extends HiveObject with _$LocalNote {
  LocalNote._();

  @HiveType(typeId: 0)
  factory LocalNote({
    @HiveField(1) required String id,
    @HiveField(2) required String title,
    @HiveField(3) required String content,
  }) = _LocalNote;

  factory LocalNote.fromJson(Map<String, dynamic> json) =>
      _$LocalNoteFromJson(json);

  static LocalNote fromNote(Note note) =>
      LocalNote(id: note.id, title: note.title, content: note.content);

  Note toNote() => Note(id: id, title: title, content: content);

  static const String hiveBoxName = 'local_notes';
}

// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../../../../domain/features/notes/models/note.dart';

part 'remote_note.freezed.dart';
part 'remote_note.g.dart';

@freezed
class RemoteNote with _$RemoteNote {
  RemoteNote._();

  factory RemoteNote({
    required String id,
    required String title,
    required String content,
  }) = _RemoteNote;

  factory RemoteNote.fromJson(Map<String, dynamic> json) =>
      _$RemoteNoteFromJson(json);

  Note get toNote => Note(
        id: id,
        title: title,
        content: content,
      );

  static RemoteNote fromNote(Note note) => RemoteNote(
        id: note.id,
        title: note.title,
        content: note.content,
      );
}

// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import 'note.dart';

part 'note_dto.freezed.dart';

@freezed
class NoteDto with _$NoteDto {
  NoteDto._();

  factory NoteDto({
    required String title,
    required String content,
  }) = _NoteDto;

  Note get toNote {
    final id = const Uuid().v1();
    return Note(id: id, title: title, content: content);
  }
}

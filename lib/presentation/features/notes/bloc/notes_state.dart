// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../../../domain/exceptions/app_exception.dart';
import '../../../../domain/features/notes/models/note.dart';

part 'notes_state.freezed.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState({
    @Default(<Note>[]) final List<Note> notes,
    required NotesStatus status,
    final AppException? exception,
  }) = _NoteState;
}

enum NotesStatus {
  loading,
  loaded,
  deleting,
  deleted,
  error,
}

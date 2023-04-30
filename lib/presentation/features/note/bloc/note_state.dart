// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../../../domain/exceptions/app_exception.dart';
import '../../../../domain/features/notes/models/note.dart';
part 'note_state.freezed.dart';

@freezed
class NoteState with _$NoteState {
  NoteState._();

  factory NoteState({
    required final NoteStatus status,
    final Note? note,
    final String? message,
    final AppException? exception,
  }) = _NoteState;

  static NoteState initial() => NoteState(
        status: NoteStatus.initial,
        note: null,
        message: null,
        exception: null,
      );

  NoteState loading() => copyWith(
        status: NoteStatus.loading,
        message: null,
        exception: null,
      );

  NoteState loaded(Note note) => copyWith(
        status: NoteStatus.loaded,
        note: note,
        message: null,
        exception: null,
      );

  NoteState saving() => copyWith(
        status: NoteStatus.saving,
        message: null,
        exception: null,
      );

  NoteState saved() => copyWith(
        status: NoteStatus.saved,
        message: 'Note saved successfully',
        exception: null,
      );

  NoteState updating() => copyWith(
        status: NoteStatus.updating,
        message: null,
        exception: null,
      );

  NoteState updated() => copyWith(
        status: NoteStatus.updated,
        message: 'Note updated successfully',
        exception: null,
      );

  NoteState error(AppException exception) => copyWith(
        status: NoteStatus.error,
        message: null,
        exception: exception,
      );
}

enum NoteStatus {
  initial,
  loading,
  loaded,
  saving,
  saved,
  updating,
  updated,
  error,
}

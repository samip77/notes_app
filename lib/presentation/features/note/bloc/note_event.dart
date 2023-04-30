// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_app/domain/features/notes/models/note_dto.dart';

import '../../../../domain/features/notes/models/note.dart';

part 'note_event.freezed.dart';

@freezed
class NoteEvent with _$NoteEvent {
  const factory NoteEvent.load(String id) = Load;
  const factory NoteEvent.add(NoteDto note) = Add;
  const factory NoteEvent.update(Note note) = Update;
}

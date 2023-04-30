// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_app/data/features/notes/remote_notes/models/remote_note.dart';

part 'get_note_response.freezed.dart';
part 'get_note_response.g.dart';

@freezed
class GetNoteResponse with _$GetNoteResponse {
  const factory GetNoteResponse({
    required RemoteNote data,
  }) = _GetNoteResponse;

  factory GetNoteResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNoteResponseFromJson(json);
}

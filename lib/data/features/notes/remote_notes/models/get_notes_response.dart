// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notes_app/data/features/notes/remote_notes/models/remote_note.dart';

part 'get_notes_response.freezed.dart';
part 'get_notes_response.g.dart';

@freezed
class GetNotesResponse with _$GetNotesResponse {
  const factory GetNotesResponse({
    required List<RemoteNote> data,
  }) = _GetNotesResponse;

  factory GetNotesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNotesResponseFromJson(json);
}

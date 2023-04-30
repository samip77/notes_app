// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetNotesResponse _$$_GetNotesResponseFromJson(Map<String, dynamic> json) =>
    _$_GetNotesResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => RemoteNote.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GetNotesResponseToJson(_$_GetNotesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

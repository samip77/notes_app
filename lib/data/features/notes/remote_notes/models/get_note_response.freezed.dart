// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_note_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetNoteResponse _$GetNoteResponseFromJson(Map<String, dynamic> json) {
  return _GetNoteResponse.fromJson(json);
}

/// @nodoc
mixin _$GetNoteResponse {
  RemoteNote get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetNoteResponseCopyWith<GetNoteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetNoteResponseCopyWith<$Res> {
  factory $GetNoteResponseCopyWith(
          GetNoteResponse value, $Res Function(GetNoteResponse) then) =
      _$GetNoteResponseCopyWithImpl<$Res, GetNoteResponse>;
  @useResult
  $Res call({RemoteNote data});

  $RemoteNoteCopyWith<$Res> get data;
}

/// @nodoc
class _$GetNoteResponseCopyWithImpl<$Res, $Val extends GetNoteResponse>
    implements $GetNoteResponseCopyWith<$Res> {
  _$GetNoteResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RemoteNote,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RemoteNoteCopyWith<$Res> get data {
    return $RemoteNoteCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GetNoteResponseCopyWith<$Res>
    implements $GetNoteResponseCopyWith<$Res> {
  factory _$$_GetNoteResponseCopyWith(
          _$_GetNoteResponse value, $Res Function(_$_GetNoteResponse) then) =
      __$$_GetNoteResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RemoteNote data});

  @override
  $RemoteNoteCopyWith<$Res> get data;
}

/// @nodoc
class __$$_GetNoteResponseCopyWithImpl<$Res>
    extends _$GetNoteResponseCopyWithImpl<$Res, _$_GetNoteResponse>
    implements _$$_GetNoteResponseCopyWith<$Res> {
  __$$_GetNoteResponseCopyWithImpl(
      _$_GetNoteResponse _value, $Res Function(_$_GetNoteResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_GetNoteResponse(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RemoteNote,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetNoteResponse implements _GetNoteResponse {
  const _$_GetNoteResponse({required this.data});

  factory _$_GetNoteResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetNoteResponseFromJson(json);

  @override
  final RemoteNote data;

  @override
  String toString() {
    return 'GetNoteResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetNoteResponse &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetNoteResponseCopyWith<_$_GetNoteResponse> get copyWith =>
      __$$_GetNoteResponseCopyWithImpl<_$_GetNoteResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetNoteResponseToJson(
      this,
    );
  }
}

abstract class _GetNoteResponse implements GetNoteResponse {
  const factory _GetNoteResponse({required final RemoteNote data}) =
      _$_GetNoteResponse;

  factory _GetNoteResponse.fromJson(Map<String, dynamic> json) =
      _$_GetNoteResponse.fromJson;

  @override
  RemoteNote get data;
  @override
  @JsonKey(ignore: true)
  _$$_GetNoteResponseCopyWith<_$_GetNoteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

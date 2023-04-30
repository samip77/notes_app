// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_notes_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetNotesResponse _$GetNotesResponseFromJson(Map<String, dynamic> json) {
  return _GetNotesResponse.fromJson(json);
}

/// @nodoc
mixin _$GetNotesResponse {
  List<RemoteNote> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetNotesResponseCopyWith<GetNotesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetNotesResponseCopyWith<$Res> {
  factory $GetNotesResponseCopyWith(
          GetNotesResponse value, $Res Function(GetNotesResponse) then) =
      _$GetNotesResponseCopyWithImpl<$Res, GetNotesResponse>;
  @useResult
  $Res call({List<RemoteNote> data});
}

/// @nodoc
class _$GetNotesResponseCopyWithImpl<$Res, $Val extends GetNotesResponse>
    implements $GetNotesResponseCopyWith<$Res> {
  _$GetNotesResponseCopyWithImpl(this._value, this._then);

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
              as List<RemoteNote>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetNotesResponseCopyWith<$Res>
    implements $GetNotesResponseCopyWith<$Res> {
  factory _$$_GetNotesResponseCopyWith(
          _$_GetNotesResponse value, $Res Function(_$_GetNotesResponse) then) =
      __$$_GetNotesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RemoteNote> data});
}

/// @nodoc
class __$$_GetNotesResponseCopyWithImpl<$Res>
    extends _$GetNotesResponseCopyWithImpl<$Res, _$_GetNotesResponse>
    implements _$$_GetNotesResponseCopyWith<$Res> {
  __$$_GetNotesResponseCopyWithImpl(
      _$_GetNotesResponse _value, $Res Function(_$_GetNotesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_GetNotesResponse(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RemoteNote>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetNotesResponse implements _GetNotesResponse {
  const _$_GetNotesResponse({required final List<RemoteNote> data})
      : _data = data;

  factory _$_GetNotesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetNotesResponseFromJson(json);

  final List<RemoteNote> _data;
  @override
  List<RemoteNote> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'GetNotesResponse(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetNotesResponse &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetNotesResponseCopyWith<_$_GetNotesResponse> get copyWith =>
      __$$_GetNotesResponseCopyWithImpl<_$_GetNotesResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetNotesResponseToJson(
      this,
    );
  }
}

abstract class _GetNotesResponse implements GetNotesResponse {
  const factory _GetNotesResponse({required final List<RemoteNote> data}) =
      _$_GetNotesResponse;

  factory _GetNotesResponse.fromJson(Map<String, dynamic> json) =
      _$_GetNotesResponse.fromJson;

  @override
  List<RemoteNote> get data;
  @override
  @JsonKey(ignore: true)
  _$$_GetNotesResponseCopyWith<_$_GetNotesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RemoteNote _$RemoteNoteFromJson(Map<String, dynamic> json) {
  return _RemoteNote.fromJson(json);
}

/// @nodoc
mixin _$RemoteNote {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteNoteCopyWith<RemoteNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteNoteCopyWith<$Res> {
  factory $RemoteNoteCopyWith(
          RemoteNote value, $Res Function(RemoteNote) then) =
      _$RemoteNoteCopyWithImpl<$Res, RemoteNote>;
  @useResult
  $Res call({String id, String title, String content});
}

/// @nodoc
class _$RemoteNoteCopyWithImpl<$Res, $Val extends RemoteNote>
    implements $RemoteNoteCopyWith<$Res> {
  _$RemoteNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RemoteNoteCopyWith<$Res>
    implements $RemoteNoteCopyWith<$Res> {
  factory _$$_RemoteNoteCopyWith(
          _$_RemoteNote value, $Res Function(_$_RemoteNote) then) =
      __$$_RemoteNoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String content});
}

/// @nodoc
class __$$_RemoteNoteCopyWithImpl<$Res>
    extends _$RemoteNoteCopyWithImpl<$Res, _$_RemoteNote>
    implements _$$_RemoteNoteCopyWith<$Res> {
  __$$_RemoteNoteCopyWithImpl(
      _$_RemoteNote _value, $Res Function(_$_RemoteNote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_$_RemoteNote(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RemoteNote extends _RemoteNote with DiagnosticableTreeMixin {
  _$_RemoteNote({required this.id, required this.title, required this.content})
      : super._();

  factory _$_RemoteNote.fromJson(Map<String, dynamic> json) =>
      _$$_RemoteNoteFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RemoteNote(id: $id, title: $title, content: $content)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RemoteNote'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('content', content));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoteNote &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoteNoteCopyWith<_$_RemoteNote> get copyWith =>
      __$$_RemoteNoteCopyWithImpl<_$_RemoteNote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RemoteNoteToJson(
      this,
    );
  }
}

abstract class _RemoteNote extends RemoteNote {
  factory _RemoteNote(
      {required final String id,
      required final String title,
      required final String content}) = _$_RemoteNote;
  _RemoteNote._() : super._();

  factory _RemoteNote.fromJson(Map<String, dynamic> json) =
      _$_RemoteNote.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_RemoteNoteCopyWith<_$_RemoteNote> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocalNote _$LocalNoteFromJson(Map<String, dynamic> json) {
  return _LocalNote.fromJson(json);
}

/// @nodoc
mixin _$LocalNote {
  @HiveField(1)
  String get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get title => throw _privateConstructorUsedError;
  @HiveField(3)
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalNoteCopyWith<LocalNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalNoteCopyWith<$Res> {
  factory $LocalNoteCopyWith(LocalNote value, $Res Function(LocalNote) then) =
      _$LocalNoteCopyWithImpl<$Res, LocalNote>;
  @useResult
  $Res call(
      {@HiveField(1) String id,
      @HiveField(2) String title,
      @HiveField(3) String content});
}

/// @nodoc
class _$LocalNoteCopyWithImpl<$Res, $Val extends LocalNote>
    implements $LocalNoteCopyWith<$Res> {
  _$LocalNoteCopyWithImpl(this._value, this._then);

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
abstract class _$$_LocalNoteCopyWith<$Res> implements $LocalNoteCopyWith<$Res> {
  factory _$$_LocalNoteCopyWith(
          _$_LocalNote value, $Res Function(_$_LocalNote) then) =
      __$$_LocalNoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) String id,
      @HiveField(2) String title,
      @HiveField(3) String content});
}

/// @nodoc
class __$$_LocalNoteCopyWithImpl<$Res>
    extends _$LocalNoteCopyWithImpl<$Res, _$_LocalNote>
    implements _$$_LocalNoteCopyWith<$Res> {
  __$$_LocalNoteCopyWithImpl(
      _$_LocalNote _value, $Res Function(_$_LocalNote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_$_LocalNote(
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
@HiveType(typeId: 0)
class _$_LocalNote extends _LocalNote with DiagnosticableTreeMixin {
  _$_LocalNote(
      {@HiveField(1) required this.id,
      @HiveField(2) required this.title,
      @HiveField(3) required this.content})
      : super._();

  factory _$_LocalNote.fromJson(Map<String, dynamic> json) =>
      _$$_LocalNoteFromJson(json);

  @override
  @HiveField(1)
  final String id;
  @override
  @HiveField(2)
  final String title;
  @override
  @HiveField(3)
  final String content;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalNote(id: $id, title: $title, content: $content)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocalNote'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('content', content));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalNote &&
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
  _$$_LocalNoteCopyWith<_$_LocalNote> get copyWith =>
      __$$_LocalNoteCopyWithImpl<_$_LocalNote>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalNoteToJson(
      this,
    );
  }
}

abstract class _LocalNote extends LocalNote {
  factory _LocalNote(
      {@HiveField(1) required final String id,
      @HiveField(2) required final String title,
      @HiveField(3) required final String content}) = _$_LocalNote;
  _LocalNote._() : super._();

  factory _LocalNote.fromJson(Map<String, dynamic> json) =
      _$_LocalNote.fromJson;

  @override
  @HiveField(1)
  String get id;
  @override
  @HiveField(2)
  String get title;
  @override
  @HiveField(3)
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_LocalNoteCopyWith<_$_LocalNote> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  String get id => throw _privateConstructorUsedError;
  String get postId =>
      throw _privateConstructorUsedError; // ID of the post this comment belongs to
  Map<String, dynamic> get user => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Comment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call(
      {String id,
      String postId,
      Map<String, dynamic> user,
      String content,
      DateTime createdAt});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? user = null,
    Object? content = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentImplCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$CommentImplCopyWith(
          _$CommentImpl value, $Res Function(_$CommentImpl) then) =
      __$$CommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String postId,
      Map<String, dynamic> user,
      String content,
      DateTime createdAt});
}

/// @nodoc
class __$$CommentImplCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$CommentImpl>
    implements _$$CommentImplCopyWith<$Res> {
  __$$CommentImplCopyWithImpl(
      _$CommentImpl _value, $Res Function(_$CommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? user = null,
    Object? content = null,
    Object? createdAt = null,
  }) {
    return _then(_$CommentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentImpl extends _Comment {
  const _$CommentImpl(
      {required this.id,
      required this.postId,
      required this.user,
      required this.content,
      required this.createdAt})
      : super._();

  factory _$CommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentImplFromJson(json);

  @override
  final String id;
  @override
  final String postId;
// ID of the post this comment belongs to
  @override
  final Map<String, dynamic> user;
  @override
  final String content;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Comment(id: $id, postId: $postId, user: $user, content: $content, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, postId,
      const DeepCollectionEquality().hash(user), content, createdAt);

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      __$$CommentImplCopyWithImpl<_$CommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentImplToJson(
      this,
    );
  }
}

abstract class _Comment extends Comment {
  const factory _Comment(
      {required final String id,
      required final String postId,
      required final Map<String, dynamic> user,
      required final String content,
      required final DateTime createdAt}) = _$CommentImpl;
  const _Comment._() : super._();

  factory _Comment.fromJson(Map<String, dynamic> json) = _$CommentImpl.fromJson;

  @override
  String get id;
  @override
  String get postId; // ID of the post this comment belongs to
  @override
  Map<String, dynamic> get user;
  @override
  String get content;
  @override
  DateTime get createdAt;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

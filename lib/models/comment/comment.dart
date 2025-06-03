import 'package:freezed_annotation/freezed_annotation.dart';
part 'comment.freezed.dart';
part 'comment.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Comment with _$Comment {
  const Comment._();

  const factory Comment({
    required String id,
    required String postId, // ID of the post this comment belongs to
    required Map<String, dynamic> user,
    required String content,
    required DateTime createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, Object?> json) =>
      _$CommentFromJson(json);
}

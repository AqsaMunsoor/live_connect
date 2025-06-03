import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_connect/models/comment/comment.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Post with _$Post {
  const Post._();

  const factory Post({
    required String id,
    required Map<String, dynamic> user,

    required String content,

    @Default(0) int likeCount,
    @Default(0) int commentCount,
    // Comments are now directly embedded as a list of Comment objects
    @Default([]) List<Comment> comments,

    required DateTime createdAt,

    DateTime? updatedAt,
  }) = _Post;

  factory Post.fromJson(Map<String, Object?> json) => _$PostFromJson(json);
}

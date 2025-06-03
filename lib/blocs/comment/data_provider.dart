part of 'cubit.dart';

class _CommentDataProvider {
  static final users = FirebaseFirestore.instance.collection('users');
  static final posts = FirebaseFirestore.instance.collection('posts');

  static Future<Comment?> addComment({
    required String content,
    required String postId,
    required User currentUser,
  }) async {
    try {
      final userSnap = await users.doc(currentUser.uid).get();

      final userData = UserData.fromJson(
        userSnap.data() as Map<String, dynamic>,
      );
      final comment = Comment(
        id: const Uuid().v4(),
        postId: postId,
        user: {
          'uid': userData.uid,
          'username': userData.username,
          'email': userData.email,
          'profilePic': userData.profilePic,
          'name': userData.name,
          'bio': userData.bio,
        },
        content: content,
        createdAt: DateTime.now(),
      );

      final postRef = posts.doc(postId);
      await FirebaseFirestore.instance.runTransaction((txn) async {
        final snap = await txn.get(postRef);

        final post = Post.fromJson(snap.data() as Map<String, dynamic>);
        final comments = List<Comment>.from(post.comments)..insert(0, comment);

        txn.update(postRef, {
          'comments': comments.map((c) => c.toJson()).toList(),
          'commentCount': FieldValue.increment(1),
        });
      });

      return comment;
    } catch (e) {
      debugPrint('Add comment error: $e');
      return null;
    }
  }

  static Future<List<Comment>> fetchPostComments(String postId) async {
    final DocumentSnapshot postSnapshot = await posts.doc(postId).get();

    final Post post = Post.fromJson(
      postSnapshot.data() as Map<String, dynamic>,
    );

    return post.comments;
  }

  static Future<void> deleteComment({
    required Map<String, dynamic> payload,
  }) async {
    final String commentId = payload['commentId'] as String;
    final String postId = payload['postId'] as String;

    final DocumentReference postRef = posts.doc(postId);

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      final DocumentSnapshot postSnapshot = await transaction.get(postRef);

      if (!postSnapshot.exists) {
        throw Exception("Post not found to delete comment.");
      }

      final Post currentPost = Post.fromJson(
        postSnapshot.data() as Map<String, dynamic>,
      );
      final List<Comment> updatedComments = List.from(currentPost.comments);
      updatedComments.removeWhere((c) => c.id == commentId);

      transaction.update(postRef, {
        'comments': updatedComments.map((c) => c.toJson()).toList(),
        'commentCount': FieldValue.increment(-1),
      });
    });
  }
}

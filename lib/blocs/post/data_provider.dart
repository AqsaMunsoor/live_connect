part of 'cubit.dart';

class _PostDataProvider {
  static final users = FirebaseFirestore.instance.collection('users');
  static final posts = FirebaseFirestore.instance.collection('posts');

  static Future<Post> createPost({
    required String content,
    required User currentUser,
  }) async {
    final DocumentSnapshot userDoc = await users.doc(currentUser.uid).get();

    if (!userDoc.exists) {
      throw Exception("User data not found for UID: ${currentUser.uid}");
    }

    final currentUserData = UserData.fromJson(
      userDoc.data() as Map<String, dynamic>,
    );

    final newPostRef = posts.doc();

    final Map<String, dynamic> simplifiedUserData = {
      'uid': currentUserData.uid,
      'username': currentUserData.username,
      'email': currentUserData.email,
      'profilePic': currentUserData.profilePic,
      'name': currentUserData.name,
      'bio': currentUserData.bio,
    };

    final Post newPost = Post(
      id: newPostRef.id,
      user: simplifiedUserData,
      content: content,
      likeCount: 0,
      commentCount: 0,
      comments: [],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await newPostRef.set(newPost.toJson());

    await users.doc(currentUser.uid).update({
      'postCount': FieldValue.increment(1),
      'postIds': FieldValue.arrayUnion([newPost.id]),
    });

    return newPost;
  }

  static Future<List<Post>> fetchByUid(String userId) async {
    final querySnapshot =
        await posts
            .where('user.uid', isEqualTo: userId)
            .orderBy('createdAt', descending: true)
            .get();

    return querySnapshot.docs.map((doc) => Post.fromJson(doc.data())).toList();
  }

  static Future<List<Post>> fetchAll() async {
    final querySnapshot =
        await posts.orderBy('createdAt', descending: true).limit(20).get();

    return querySnapshot.docs.map((doc) => Post.fromJson(doc.data())).toList();
  }
}

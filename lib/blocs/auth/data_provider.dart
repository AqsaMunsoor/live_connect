part of 'cubit.dart';

class _AuthDataProvider {
  static final users = FirebaseFirestore.instance.collection('users');

  // Helper to generate DiceBear avatar URL
  static String generateDiceBearAvatarUrl(String seed) {
    final encodedSeed = Uri.encodeComponent(seed);
    return 'https://api.dicebear.com/7.x/initials/png?seed=$encodedSeed&backgroundColor=b6e3f4,c0aede,d1d4f9';
  }

  // --- Authentication Operations ---

  static Future<UserData> login(String email, String password) async {
    try {
      final userCreds = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = userCreds.user!;
      final snapshot = await users.doc(firebaseUser.uid).get();
      final data = snapshot.data()!;

      var userData = UserData.fromJson(data);

      return userData;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }

  // Combines Firebase Auth user creation and Firestore profile saving
  static Future<UserData> register(
    Map<String, dynamic> payload,
    // required String email,
    // required String password,
    // required String name,
    // required String username,
  ) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: payload['email'],
            password: payload['password'],
          );

      final firebaseUser = userCredential.user;

      if (firebaseUser == null) {
        throw Exception('Firebase user object is null after creation.');
      }

      final String profilePicUrl = generateDiceBearAvatarUrl(
        payload['displayName'].isNotEmpty
            ? payload['displayName']
            : firebaseUser.uid,
      );

      // Create UserData object with all required fields and default values
      final userData = UserData(
        uid: firebaseUser.uid,
        name: payload['displayName'],
        username: payload['username'],
        email: firebaseUser.email!,
        profilePic: profilePicUrl,
        fcm: null, // As requested
        bio: null, // Default to null
        postIds: [], // As requested
        followers: [],
        following: [],
        createdAt: DateTime.now(), // As requested
      );

      // Save the user data to Firestore
      await users.doc(firebaseUser.uid).set(userData.toJson());

      return userData; // Return the created UserData object
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Firebase Auth Error: ${e.code}');
    } catch (e) {
      throw Exception(
        'An unexpected error occurred during user creation and profile saving: $e',
      );
    }
  }

  static Future<UserData> fetchById(String uid) async {
    try {
      final snapshot = await users.doc(uid).get();
      final data = snapshot.data()!;
      return UserData.fromJson(data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }

  static Future<UserData?> fetchProfile(String? uid) async {
    try {
      if (uid == null) return null;
      final snapshot = await users.doc(uid).get();
      final data = snapshot.data()!;

      return UserData.fromJson(data);
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }

  static Future<List<UserData>> search(String query) async {
    try {
      final snapshot =
          await users
              .where('username', isGreaterThanOrEqualTo: query)
              .where('username', isLessThanOrEqualTo: '$query\uf7ff')
              .get();
      final data =
          snapshot.docs.map((doc) => UserData.fromJson(doc.data())).toList();
      return data;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }

  static Future<void> followUser({
    required String currentUid,
    required String targetUid,
  }) async {
    final batch = FirebaseFirestore.instance.batch();
    final currentRef = users.doc(currentUid);
    final targetRef = users.doc(targetUid);

    batch.update(currentRef, {
      'following': FieldValue.arrayUnion([targetUid]),
    });

    batch.update(targetRef, {
      'followers': FieldValue.arrayUnion([currentUid]),
    });

    await batch.commit();
  }

  static Future<void> unfollowUser({
    required String currentUid,
    required String targetUid,
  }) async {
    final batch = FirebaseFirestore.instance.batch();
    final currentRef = users.doc(currentUid);
    final targetRef = users.doc(targetUid);

    batch.update(currentRef, {
      'following': FieldValue.arrayRemove([targetUid]),
    });

    batch.update(targetRef, {
      'followers': FieldValue.arrayRemove([currentUid]),
    });

    await batch.commit();
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class UserData with _$UserData {
  const UserData._();

  const factory UserData({
    required String uid,
    required String name,
    required String username,
    required String email,
    String? profilePic,
    String? fcm,
    String? bio,
    @Default([]) List<String> postIds,
    @Default([]) List<String> followers, // UIDs of users who follow *this* user
    @Default([])
    List<String> following, // UIDs of users *this* user is following
    required DateTime createdAt,
  }) = _UserData;

  factory UserData.fromJson(Map<String, Object?> json) =>
      _$UserDataFromJson(json);

  
 
}

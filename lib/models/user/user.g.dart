// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      uid: json['uid'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      profilePic: json['profilePic'] as String?,
      fcm: json['fcm'] as String?,
      bio: json['bio'] as String?,
      postIds: (json['postIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      followers: (json['followers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      following: (json['following'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'profilePic': instance.profilePic,
      'fcm': instance.fcm,
      'bio': instance.bio,
      'postIds': instance.postIds,
      'followers': instance.followers,
      'following': instance.following,
      'createdAt': instance.createdAt.toIso8601String(),
    };

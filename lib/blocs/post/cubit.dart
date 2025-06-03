import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:live_connect/models/post/post.dart';
import 'package:live_connect/models/user/user.dart';
import 'package:meta/meta.dart';

part 'state.dart';
part 'data_provider.dart';

part 'states/_create.dart';
part 'states/_update.dart';
part 'states/_delete.dart';
part 'states/_fetch_by_id.dart';
part 'states/_fetch_by_uid.dart';
part 'states/_fetch_all.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(const PostStateDefault());

  static PostCubit c(BuildContext context, [bool listen = false]) {
    return BlocProvider.of<PostCubit>(context, listen: listen);
  }

  /// Creates a new post by delegating to the PostDataProvider.
  Future<void> createPost({required String content}) async {
    emit(state.copyWith(create: PostCreateLoading()));
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      emit(
        state.copyWith(
          create: PostCreateFailed(
            message: 'User not authenticated. Please log in.',
          ),
        ),
      );

      return;
    }

    try {
      // Call the data provider to create the post
      final newPost = await _PostDataProvider.createPost(
        content: content,
        currentUser: currentUser,
      );
      emit(state.copyWith(create: PostCreateSuccess(post: newPost)));
    } catch (e) {
      emit(state.copyWith(create: PostCreateFailed(message: e.toString())));
    }
  }

  /// Fetches posts for a specific user by delegating to the PostDataProvider.
  Future<void> fetchByUid(String userId) async {
    emit(state.copyWith(fetchPostByUid: FetchPostByUidLoading()));
    try {
      // Call the data provider to fetch user posts
      final posts = await _PostDataProvider.fetchByUid(userId);
      emit(
        state.copyWith(
          fetchPostByUid: FetchPostByUidSuccess(data: posts),
          posts: posts,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          fetchPostByUid: FetchPostByUidFailed(message: e.toString()),
        ),
      );
    }
  }

  /// Fetches a feed of posts by delegating to the PostDataProvider.
  Future<void> fetchAll() async {
    emit(state.copyWith(fetchAll: FetchAllLoading()));
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      emit(
        state.copyWith(
          fetchAll: FetchAllFailed(message: "User not authenticated for feed."),
        ),
      );
      return;
    }

    try {
      // Call the data provider to fetch feed posts
      final posts = await _PostDataProvider.fetchAll();
      emit(state.copyWith(fetchAll: FetchAllSuccess(), posts: posts));
    } catch (e) {
      emit(state.copyWith(fetchAll: FetchAllFailed(message: e.toString())));
    }
  }
}

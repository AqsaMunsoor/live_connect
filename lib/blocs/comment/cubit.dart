import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'; // Required for BuildContext extension
import 'package:flutter_bloc/flutter_bloc.dart'; // Required for read extension
import 'package:live_connect/blocs/post/cubit.dart';
import 'package:live_connect/models/post/post.dart';
import 'package:live_connect/models/user/user.dart';
import 'package:meta/meta.dart';

import 'package:live_connect/models/comment/comment.dart';
import 'package:uuid/uuid.dart'; // Import the Comment model

part 'state.dart';
part 'data_provider.dart';

part 'states/_add_comment.dart';
part 'states/_delete_comment.dart';
part 'states/_fetch_post_comments.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentStateDefault());

  static CommentCubit c(BuildContext context, [bool listen = false]) {
    return BlocProvider.of<CommentCubit>(context, listen: listen);
  }

  Future<void> addComment({
    required String content,
    required String postId,
  }) async {
    emit(state.copyWith(addComment: AddCommentLoading()));

    final user = FirebaseAuth.instance.currentUser;

    final comment = await _CommentDataProvider.addComment(
      content: content,
      postId: postId,
      currentUser: user!,
    );

    final updatedComments = [comment!, ...?state.comments];
    emit(
      state.copyWith(
        addComment: AddCommentSuccess(comment: comment),
        comments: updatedComments,
      ),
    );
  }

  Future<void> fetchPostComments({required String postId}) async {
    emit(state.copyWith(fetchPostComments: FetchPostCommentsLoading()));
    try {
      final comments = await _CommentDataProvider.fetchPostComments(postId);
      emit(
        state.copyWith(
          fetchPostComments: FetchPostCommentsSuccess(),
          comments: comments,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          fetchPostComments: FetchPostCommentsFailed(message: e.toString()),
        ),
      );
    }
  }
}

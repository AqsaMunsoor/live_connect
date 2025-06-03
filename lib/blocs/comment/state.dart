part of 'cubit.dart';

// nested-states

@immutable
class CommentState extends Equatable {
  // root-state
  final AddCommentState addComment;
  final DeleteCommentState deleteComment;

  final FetchPostCommentsState fetchPostComments;
  final List<Comment>? comments;
  final String? uid;

  const CommentState({
    // root-state-constr
    required this.addComment,
    required this.deleteComment,

    required this.fetchPostComments,

    this.comments,
    this.uid,
  });

  @override
  List<Object?> get props => [
    // root-state-props
    addComment,
    deleteComment,
    comments,
    uid,
    fetchPostComments,
  ];

  CommentState copyWith({
    // root-cw
    AddCommentState? addComment,
    DeleteCommentState? deleteComment,

    FetchPostCommentsState? fetchPostComments,

    List<Comment>? comments,
    String? uid,
  }) {
    return CommentState(
      // root-cw-ins
      addComment: addComment ?? this.addComment,
      deleteComment: deleteComment ?? this.deleteComment,

      comments: comments ?? this.comments,

      fetchPostComments: fetchPostComments ?? this.fetchPostComments,
      uid: uid ?? this.uid,
    );
  }
}

@immutable
class CommentStateDefault extends CommentState {
  const CommentStateDefault()
    : super(
        // root-state-init
        addComment: const AddCommentState(),
        deleteComment: const DeleteCommentState(),

        fetchPostComments: const FetchPostCommentsState(),
      );
}

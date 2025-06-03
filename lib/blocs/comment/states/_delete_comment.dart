part of '../cubit.dart';

@immutable
class DeleteCommentState extends Equatable {
  static bool match(CommentState a, CommentState b) =>
      a.deleteComment != b.deleteComment;

  final String? message;
  final Comment? comment;

  const DeleteCommentState({this.message, this.comment});

  @override
  List<Object?> get props => [message];
}

@immutable
class DeleteCommentDefault extends DeleteCommentState {}

@immutable
class DeleteCommentLoading extends DeleteCommentState {}

@immutable
class DeleteCommentSuccess extends DeleteCommentState {
  const DeleteCommentSuccess({required Comment comment})
    : super(comment: comment);
}

@immutable
class DeleteCommentFailed extends DeleteCommentState {
  const DeleteCommentFailed({super.message});
}

part of '../cubit.dart';

@immutable
class AddCommentState extends Equatable {
  static bool match(CommentState a, CommentState b) =>
      a.addComment != b.addComment;

  final String? message;
  final Comment? comment;

  const AddCommentState({this.message, this.comment});

  @override
  List<Object?> get props => [message];
}

@immutable
class AddCommentDefault extends AddCommentState {}

@immutable
class AddCommentLoading extends AddCommentState {}

@immutable
class AddCommentSuccess extends AddCommentState {
  const AddCommentSuccess({required Comment comment}) : super(comment: comment);
}

@immutable
class AddCommentFailed extends AddCommentState {
  const AddCommentFailed({super.message});
}

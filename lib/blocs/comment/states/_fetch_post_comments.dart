part of '../cubit.dart';

@immutable
class FetchPostCommentsState extends Equatable {
  static bool match(PostState a, PostState b) => a.fetchAll != b.fetchAll;

  final String? message;

  const FetchPostCommentsState({this.message});

  @override
  List<Object?> get props => [message];
}

@immutable
class FetchPostCommentsDefault extends FetchPostCommentsState {}

@immutable
class FetchPostCommentsLoading extends FetchPostCommentsState {}

@immutable
class FetchPostCommentsSuccess extends FetchPostCommentsState {}

@immutable
class FetchPostCommentsFailed extends FetchPostCommentsState {
  const FetchPostCommentsFailed({super.message});
}

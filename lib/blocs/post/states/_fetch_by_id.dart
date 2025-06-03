part of '../cubit.dart';

@immutable
class FetchPostByIdState extends Equatable {
  static bool match(PostState a, PostState b) =>
      a.fetchPostById != b.fetchPostById;

  final Post? post;
  final String? message;

  const FetchPostByIdState({this.message, this.post});

  @override
  List<Object?> get props => [message, post];
}

@immutable
class FetchPostByIdDefault extends FetchPostByIdState {}

@immutable
class FetchPostByIdLoading extends FetchPostByIdState {}

@immutable
class FetchPostByIdSuccess extends FetchPostByIdState {
  const FetchPostByIdSuccess({required Post post}) : super(post: post);
}

@immutable
class FetchPostByIdFailed extends FetchPostByIdState {
  const FetchPostByIdFailed({super.message});
}

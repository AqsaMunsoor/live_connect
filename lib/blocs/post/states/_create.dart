part of '../cubit.dart';

@immutable
class PostCreateState extends Equatable {
  static bool match(PostState a, PostState b) => a.create != b.create;

  final String? message;
  final Post? post;

  const PostCreateState({this.message, this.post});

  @override
  List<Object?> get props => [message];
}

@immutable
class PostCreateDefault extends PostCreateState {}

@immutable
class PostCreateLoading extends PostCreateState {}

@immutable
class PostCreateSuccess extends PostCreateState {
  const PostCreateSuccess({required Post post}) : super(post: post);
}

@immutable
class PostCreateFailed extends PostCreateState {
  const PostCreateFailed({super.message});
}

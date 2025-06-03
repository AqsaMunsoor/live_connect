part of '../cubit.dart';

@immutable
class PostUpdateState extends Equatable {
  static bool match(PostState a, PostState b) => a.update != b.update;

  final String? message;

  const PostUpdateState({this.message});

  @override
  List<Object?> get props => [message];
}

@immutable
class PostUpdateDefault extends PostUpdateState {}

@immutable
class PostUpdateLoading extends PostUpdateState {}

@immutable
class PostUpdateSuccess extends PostUpdateState {
  const PostUpdateSuccess();
}

@immutable
class PostUpdateFailed extends PostUpdateState {
  const PostUpdateFailed({super.message});
}

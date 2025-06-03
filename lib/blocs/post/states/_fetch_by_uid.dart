part of '../cubit.dart';

@immutable
class FetchPostByUidState extends Equatable {
  static bool match(PostState a, PostState b) =>
      a.fetchPostByUid != b.fetchPostByUid;

  final List<Post>? data;
  final String? message;

  const FetchPostByUidState({this.data, this.message});

  @override
  List<Object?> get props => [data, message];
}

@immutable
class FetchPostByUidDefault extends FetchPostByUidState {}

@immutable
class FetchPostByUidLoading extends FetchPostByUidState {}

@immutable
class FetchPostByUidSuccess extends FetchPostByUidState {
  const FetchPostByUidSuccess({required List<Post> data}) : super(data: data);
}

@immutable
class FetchPostByUidFailed extends FetchPostByUidState {
  const FetchPostByUidFailed({super.message});
}

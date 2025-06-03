part of '../cubit.dart';

@immutable
class FetchAllState extends Equatable {
  static bool match(PostState a, PostState b) => a.fetchAll != b.fetchAll;

  final String? message;

  const FetchAllState({this.message});

  @override
  List<Object?> get props => [message];
}

@immutable
class FetchAllDefault extends FetchAllState {}

@immutable
class FetchAllLoading extends FetchAllState {}

@immutable
class FetchAllSuccess extends FetchAllState {}

@immutable
class FetchAllFailed extends FetchAllState {
  const FetchAllFailed({super.message});
}

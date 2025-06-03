part of '../cubit.dart';

@immutable
class AuthUnFollowState extends Equatable {
  static bool match(AuthState a, AuthState b) => a.unfollow != b.unfollow;

  final String? message;

  const AuthUnFollowState({this.message});

  @override
  List<Object?> get props => [message];
}

@immutable
class AuthUnFollowDefault extends AuthUnFollowState {}

@immutable
class AuthUnFollowLoading extends AuthUnFollowState {}

@immutable
class AuthUnFollowSuccess extends AuthUnFollowState {
  const AuthUnFollowSuccess() : super();
}

@immutable
class AuthUnFollowFailed extends AuthUnFollowState {
  const AuthUnFollowFailed({super.message});
}

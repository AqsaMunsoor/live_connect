part of '../cubit.dart';

@immutable
class AuthFollowState extends Equatable {
  static bool match(AuthState a, AuthState b) => a.follow != b.follow;

  final String? message;

  const AuthFollowState({this.message});

  @override
  List<Object?> get props => [message];
}

@immutable
class AuthFollowDefault extends AuthFollowState {}

@immutable
class AuthFollowLoading extends AuthFollowState {}

@immutable
class AuthFollowSuccess extends AuthFollowState {
  const AuthFollowSuccess() : super();
}

@immutable
class AuthFollowFailed extends AuthFollowState {
  const AuthFollowFailed({super.message});
}

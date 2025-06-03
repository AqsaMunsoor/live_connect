part of '../cubit.dart';

@immutable
class AuthInitState extends Equatable {
  static bool match(AuthState a, AuthState b) => a.init != b.init;

  final String? message;
  final UserData? data;

  const AuthInitState({this.message, this.data});

  @override
  List<Object?> get props => [message];
}

@immutable
class AuthInitDefault extends AuthInitState {}

@immutable
class AuthInitLoading extends AuthInitState {
  const AuthInitLoading();
}

@immutable
class AuthInitSuccess extends AuthInitState {}

@immutable
class AuthInitFailed extends AuthInitState {
  const AuthInitFailed({super.message});
}

part of '../cubit.dart';

@immutable
class AuthLoginState extends Equatable {
  static bool match(AuthState a, AuthState b) => a.login != b.login;

  final String? message;
  final UserData? data;

  const AuthLoginState({this.message, this.data});

  @override
  List<Object?> get props => [message];
}

@immutable
class AuthLoginDefault extends AuthLoginState {}

@immutable
class AuthLoginLoading extends AuthLoginState {}

@immutable
class AuthLoginSuccess extends AuthLoginState {
  const AuthLoginSuccess({required UserData data}) : super(data: data);
}

@immutable
class AuthLoginFailed extends AuthLoginState {
  const AuthLoginFailed({super.message});
}

part of '../cubit.dart';

@immutable
class AuthRegisterState extends Equatable {
  static bool match(AuthState a, AuthState b) => a.register != b.register;

  final String? message;
  final UserData? data;

  const AuthRegisterState({this.message, this.data});

  @override
  List<Object?> get props => [message];
}

@immutable
class AuthRegisterDefault extends AuthRegisterState {}

@immutable
class AuthRegisterLoading extends AuthRegisterState {}

@immutable
class AuthRegisterSuccess extends AuthRegisterState {
  const AuthRegisterSuccess({required UserData data}) : super(data: data);
}

@immutable
class AuthRegisterFailed extends AuthRegisterState {
  const AuthRegisterFailed({super.message});
}

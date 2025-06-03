part of '../cubit.dart';

@immutable
class AuthFetchByIdState extends Equatable {
  static bool match(AuthState a, AuthState b) => a.fetchById != b.fetchById;

  final String? message;
  final UserData? data;

  const AuthFetchByIdState({this.message, this.data});

  @override
  List<Object?> get props => [message, data];
}

@immutable
class AuthFetchByIdDefault extends AuthFetchByIdState {}

@immutable
class AuthFetchByIdLoading extends AuthFetchByIdState {}

@immutable
class AuthFetchByIdSuccess extends AuthFetchByIdState {
  const AuthFetchByIdSuccess({required UserData data}) : super(data: data);
}

@immutable
class AuthFetchByIdFailed extends AuthFetchByIdState {
  const AuthFetchByIdFailed({super.message});
}

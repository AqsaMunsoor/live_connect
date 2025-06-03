part of '../cubit.dart';

@immutable
class AuthFetchState extends Equatable {
  static bool match(AuthState a, AuthState b) => a.fetch != b.fetch;

  final String? message;
  final UserData? data;

  const AuthFetchState({this.message, this.data});

  @override
  List<Object?> get props => [message];
}

@immutable
class AuthFetchDefault extends AuthFetchState {}

@immutable
class AuthFetchLoading extends AuthFetchState {}

@immutable
class AuthFetchSuccess extends AuthFetchState {
  const AuthFetchSuccess({required UserData data}) : super(data: data);
}

@immutable
class AuthFetchFailed extends AuthFetchState {
  const AuthFetchFailed({super.message});
}

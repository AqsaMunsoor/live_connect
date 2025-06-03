part of '../cubit.dart';

@immutable
class AuthSearchState extends Equatable {
  static bool match(AuthState a, AuthState b) => a.search != b.search;

  final String? message;
  final List<UserData>? data;

  const AuthSearchState({this.message, this.data});

  @override
  List<Object?> get props => [message];
}

@immutable
class AuthSearchDefault extends AuthSearchState {}

@immutable
class AuthSearchLoading extends AuthSearchState {}

@immutable
class AuthSearchSuccess extends AuthSearchState {
  const AuthSearchSuccess({required List<UserData> data}) : super(data: data);
}

@immutable
class AuthSearchFailed extends AuthSearchState {
  const AuthSearchFailed({super.message});
}

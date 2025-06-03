part of 'cubit.dart';

// root-state
@immutable
class AuthState extends Equatable {
  final AuthFetchState fetch;
  // final GmailAuthState gmail;
  final AuthLoginState login;
  final AuthInitState init;
  // final AuthForgotState forgot;
  // final AuthTokenState token;
  final AuthLogoutState logout;
  final AuthRegisterState register;
  final AuthUpdateState update;
  final AuthFetchByIdState fetchById;
  final AuthSearchState search;
  final AuthFollowState follow;
  final AuthUnFollowState unfollow;
  final UserData? profile;
  final List<UserData>? users;

  const AuthState({
    this.profile,
    // required this.gmail,
    required this.init,
    // required this.token,
    required this.fetch,
    required this.login,
    required this.logout,
    // required this.forgot,
    required this.register,
    required this.fetchById,
    required this.search,
    required this.update,
    required this.follow,
    required this.unfollow,
    this.users,
  });

  @override
  List<Object?> get props => [
    // root-state-props
    fetch,
    login,
    logout,
    // forgot,
    // gmail,
    // token,
    update,
    register,
    fetchById,
    search,
    init,
    follow,
    unfollow,
    profile,
    users,
  ];

  AuthState copyWith({
    UserData? profile,
    AuthFetchState? fetch,
    // GmailAuthState? gmail,
    AuthLoginState? login,
    AuthInitState? init,
    // AuthTokenState? token,
    AuthLogoutState? logout,
    // AuthForgotState? forgot,
    AuthRegisterState? register,
    AuthFetchByIdState? fetchById,
    AuthSearchState? search,
    AuthUpdateState? update,
    AuthFollowState? follow,
    AuthUnFollowState? unfollow,
    List<UserData>? users,
  }) {
    return AuthState(
      // gmail: gmail ?? this.gmail,
      fetch: fetch ?? this.fetch,
      login: login ?? this.login,
      // forgot: forgot ?? this.forgot,
      // token: token ?? this.token,
      init: init ?? this.init,
      logout: logout ?? this.logout,
      profile: profile ?? this.profile,
      fetchById: fetchById ?? this.fetchById,
      search: search ?? this.search,
      update: update ?? this.update,
      register: register ?? this.register,
      follow: follow ?? this.follow,
      unfollow: unfollow ?? this.unfollow,
      users: users ?? this.users,
    );
  }
}

@immutable
class AuthStateDefault extends AuthState {
  const AuthStateDefault()
    : super(
        // root-state-init
        // gmail: const GmailAuthState(),
        fetch: const AuthFetchState(),
        login: const AuthLoginState(),
        init: const AuthInitState(),
        // token: const AuthTokenState(),
        logout: const AuthLogoutState(),
        // forgot: const AuthForgotState(),
        register: const AuthRegisterState(),
        fetchById: const AuthFetchByIdState(),
        update: const AuthUpdateState(),
        search: const AuthSearchState(),
        follow: const AuthFollowState(),
        unfollow: const AuthUnFollowState(),
      );
}

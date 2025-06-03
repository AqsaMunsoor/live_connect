import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:live_connect/models/user/user.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart'; // Import for BuildContext
import 'package:flutter_bloc/flutter_bloc.dart'; // Import for read

part 'state.dart';

part 'states/_login.dart';
part 'states/_logout.dart';
part 'states/_register.dart';
part 'states/_fetch.dart';
part 'states/_fetch_by_id.dart';
part 'states/_init.dart';
part 'states/_update.dart';
part 'states/_search.dart';
part 'states/_follow.dart';
part 'states/_unfollow.dart';

part 'data_provider.dart';

// // Extension to easily access AuthCubit from BuildContext
// extension AuthCubitExtension on BuildContext {
//   AuthCubit get authCubit => read<AuthCubit>();
// }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthStateDefault());

  // Static helper to get the cubit from context
  static AuthCubit c(BuildContext context, [bool listen = false]) {
    return BlocProvider.of<AuthCubit>(context, listen: listen);
  }

  void resetSearch() {
    emit(state.copyWith(search: AuthSearchDefault()));
  }

  Future<void> search(String query) async {
    emit(state.copyWith(search: AuthSearchLoading()));
    try {
      final users = await _AuthDataProvider.search(query);
      emit(
        state.copyWith(search: AuthSearchSuccess(data: users), users: users),
      );
    } catch (e) {
      emit(state.copyWith(search: AuthSearchFailed(message: e.toString())));
    }
  }

  Future<void> fetchById(String uid) async {
    emit(state.copyWith(fetchById: AuthFetchByIdLoading()));
    try {
      final data = await _AuthDataProvider.fetchById(uid);

      emit(state.copyWith(fetchById: AuthFetchByIdSuccess(data: data)));
    } catch (e) {
      emit(
        state.copyWith(fetchById: AuthFetchByIdFailed(message: e.toString())),
      );
    }
  }

  StreamSubscription<User?>? listener;

  @override
  Future<void> close() async {
    super.close();
    listener?.cancel();
  }

  Future<void> _initUser(User? user) async {
    try {
      final profile = await _AuthDataProvider.fetchProfile(user?.uid);
      emit(state.copyWith(profile: profile, init: AuthInitSuccess()));
    } catch (e) {
      await FirebaseAuth.instance.signOut();
      emit(state.copyWith(init: AuthInitFailed(message: e.toString())));
    }
  }

  Future<void> init() async {
    emit(state.copyWith(init: const AuthInitLoading()));

    try {
      listener = FirebaseAuth.instance.authStateChanges().listen((user) {
        _initUser(user);
        listener?.cancel();
      });
    } catch (e) {
      emit(state.copyWith(init: AuthInitFailed(message: e.toString())));
    }
  }

  Future<void> login(String email, String password) async {
    emit(state.copyWith(login: AuthLoginLoading()));
    try {
      final data = await _AuthDataProvider.login(email, password);

      final profile = await _AuthDataProvider.fetchProfile(data.uid);

      emit(
        state.copyWith(login: AuthLoginSuccess(data: data), profile: profile),
      );
    } catch (e) {
      emit(state.copyWith(login: AuthLoginFailed(message: e.toString())));
    }
  }

  Future<void> register(Map<String, dynamic> payload) async {
    emit(state.copyWith(register: AuthRegisterLoading()));
    try {
      final data = await _AuthDataProvider.register(payload);
      emit(state.copyWith(register: AuthRegisterSuccess(data: data)));
    } catch (e) {
      emit(state.copyWith(register: AuthRegisterFailed(message: e.toString())));
    }
  }

  Future<void> fetchProfile([String? uid]) async {
    emit(state.copyWith(fetch: AuthFetchLoading()));
    try {
      final data = await _AuthDataProvider.fetchProfile(state.profile!.uid);
      emit(state.copyWith(fetch: AuthFetchSuccess(data: data!), profile: data));
    } catch (e) {
      emit(state.copyWith(fetch: AuthFetchFailed(message: e.toString())));
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(logout: AuthLogoutLoading()));
    try {
      final uid = state.profile?.uid ?? FirebaseAuth.instance.currentUser?.uid;

      await FirebaseAuth.instance.signOut();
      // AppCache.reset();
      emit(const AuthStateDefault());
      emit(state.copyWith(logout: const AuthLogoutSuccess(), profile: null));
    } catch (e) {
      emit(state.copyWith(logout: AuthLogoutFailed(message: e.toString())));
    }
  }

  Future<void> followUser(String targetUid) async {
    emit(state.copyWith(follow: AuthFollowLoading()));
    try {
      await _AuthDataProvider.followUser(
        currentUid: state.profile!.uid,
        targetUid: targetUid,
      );
      await fetchProfile(); // Refresh local profile
      emit(state.copyWith(follow: AuthFollowSuccess()));
    } catch (e) {
      emit(state.copyWith(follow: AuthFollowFailed(message: e.toString())));
    }
  }

  Future<void> unfollowUser(String targetUid) async {
    emit(state.copyWith(follow: AuthFollowLoading()));
    try {
      await _AuthDataProvider.unfollowUser(
        currentUid: state.profile!.uid,
        targetUid: targetUid,
      );
      await fetchProfile();
      emit(state.copyWith(follow: AuthFollowSuccess()));
    } catch (e) {
      emit(state.copyWith(follow: AuthFollowFailed(message: e.toString())));
    }
  }
}

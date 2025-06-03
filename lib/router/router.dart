import 'package:flutter/material.dart';
import 'package:live_connect/ui/screens/chat/chat.dart';

import 'package:live_connect/ui/screens/home/home.dart';
import 'package:live_connect/ui/screens/login/login.dart';
import 'package:live_connect/ui/screens/message/message.dart';
import 'package:live_connect/ui/screens/notification/notification.dart';
import 'package:live_connect/ui/screens/profile/profile.dart';
import 'package:live_connect/ui/screens/profile_info/profile_info.dart';
import 'package:live_connect/ui/screens/search/search.dart';
import 'package:live_connect/ui/screens/signup/signup.dart';
import 'package:live_connect/ui/screens/splash/splash.dart';

import 'routes.dart';

final navigator = GlobalKey<NavigatorState>();
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

final appRoutes = {
  AppRoutes.profile: (_) => const ProfileScreen(),
  AppRoutes.profileInfo: (_) => const ProfileInfoScreen(),
  AppRoutes.home: (_) => const HomeScreen(),
  AppRoutes.login: (_) => const LoginScreen(),
  AppRoutes.signup: (_) => const SignupScreen(),
  AppRoutes.notification: (_) => const NotificationScreen(),
  AppRoutes.search: (_) => const SearchScreen(),
  AppRoutes.splash: (_) => const SplashScreen(),
  // AppRoutes.zimLogin: (_) => const ZimLogin(),
  AppRoutes.chat: (_) => const ChatScreen(),
  AppRoutes.message: (_) => const MessageScreen(),
};

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  final route = switch (settings.name) {
    AppRoutes.home => FadeRoute(settings: settings, child: const HomeScreen()),
    AppRoutes.notification => FadeRoute(
      settings: settings,
      child: const NotificationScreen(),
    ),
    AppRoutes.search => FadeRoute(
      settings: settings,
      child: const SearchScreen(),
    ),
    AppRoutes.profile => FadeRoute(
      settings: settings,
      child: const ProfileScreen(),
    ),
    AppRoutes.login => FadeRoute(
      // <<< ADD THIS CASE for login!
      settings: settings,
      child: const LoginScreen(),
    ),
    AppRoutes.signup => FadeRoute(
      // <<< ADD THIS CASE for signup if you navigate to it via named routes!
      settings: settings,
      child: const SignupScreen(),
    ),
    _ => null,
  };
  return route;
}

class FadeRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  FadeRoute({required this.child, required this.settings})
    : super(
        settings: settings,
        pageBuilder: (context, ani1, ani2) => child,
        transitionsBuilder: (context, ani1, ani2, child) {
          return FadeTransition(opacity: ani1, child: child);
        },
      );
}

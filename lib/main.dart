import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_connect/blocs/auth/cubit.dart';
import 'package:live_connect/blocs/comment/cubit.dart';
import 'package:live_connect/blocs/post/cubit.dart';
import 'package:live_connect/configs/configs.dart';
import 'package:live_connect/router/routes.dart';
import 'package:live_connect/services/cache.dart';

import 'package:live_connect/router/router.dart';
import 'package:zego_zimkit/zego_zimkit.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';

void main() async {
  await ZIMKit().init(
    appID: 1661873479,
    appSign: 'ba529c467db8f36892ea9c641012045b5f95fa0e6b76dfd7fc3fb94da5238f3b',
  );
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  AppCache.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => AuthCubit()),
        BlocProvider<PostCubit>(create: (_) => PostCubit()),
        BlocProvider<CommentCubit>(create: (_) => CommentCubit()),
      ],
      child: MaterialApp(
        title: 'Live Connect App',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigator,
        navigatorObservers: [NavigationHistoryObserver(), routeObserver],
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.light(primary: AppColors.neutral900),

          textTheme: ThemeData().textTheme.apply(
            bodyColor: AppColors.neutral900,
            displayColor: AppColors.neutral900,
          ),
        ),

        // home: ZimLogin(),
        routes: appRoutes,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: onGenerateRoutes,
      ),
    );
  }
}

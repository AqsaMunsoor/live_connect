part of '../splash.dart';

class _UserListener extends StatelessWidget {
  const _UserListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (a, b) => a.init != b.init,
      listener: (_, state) {
        if (state.init is AuthInitFailed) {
          AppLog.log('init failed');
          UiFlash.error(context, (state.init..message) as String);
        }
        if (state.init is AuthInitSuccess) {
          AppLog.log('init success');
          final isLoggedIn = state.profile != null;
          if (isLoggedIn) {
            AppRoutes.home.pushReplace(context);
          } else if (AppCache.firstVisit) {
            AppRoutes.signup.pushReplace(context);
          } else {
            AppRoutes.login.pushReplace(context);
          }
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}

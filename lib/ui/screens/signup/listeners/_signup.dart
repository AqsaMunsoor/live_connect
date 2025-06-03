part of '../signup.dart';

class _SignupListener extends StatelessWidget {
  const _SignupListener();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final route = args?['source'] as String?;

    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: AuthRegisterState.match,
      listener: (context, state) {
        if (state.register is AuthRegisterFailed) {
          final message = state.register.message!.split(": ").last;
          UiFlash.error(context, message);
        } else if (state.register is AuthRegisterSuccess) {
          UiFlash.success(
            context,
            'Congratulations! Your account has been created, please login!',
          );

          AppRoutes.home.pushReplace(context, arguments: {'source': route});
        }
      },
      builder: (context, state) {
        if (state.register is AuthRegisterLoading) {
          return const FullScreenLoader(loading: true);
        }
        return const SizedBox();
      },
    );
  }
}

part of '../splash.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final userCubit = AuthCubit.c(context, true);
    final state = userCubit.state;
    final initLoading = state.init is AuthInitLoading;
    final errorMessage = state.init?.message;

    return Screen(
      keyboardHandler: true,
      belowBuilders: const [_UserListener()],
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (initLoading)
                const AppIconLoader(radius: 80)
              else
                Image(image: AssetImage('assets/app_icon.png')),
              Space.y.t24,
              if (initLoading) const Text('Loading...'),
              if (errorMessage != null)
                Padding(
                  padding: Space.p.horizontal.t16,
                  child: Text(errorMessage, textAlign: TextAlign.center),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

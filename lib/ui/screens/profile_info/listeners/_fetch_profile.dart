part of '../profile_info.dart';

class _FetchUserByUidListener extends StatelessWidget {
  const _FetchUserByUidListener();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context);
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (a, b) => a.fetchById != b.fetchById,
      listener: (context, state) {
        if (state.fetchById is FetchPostByIdSuccess) {
          final session = state.fetchById.data!;
          screenState.setUser(session);
          
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}

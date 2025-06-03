part of '../profile.dart';

class _FetchUserListener extends StatelessWidget {
  const _FetchUserListener();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context);

    return BlocListener<AuthCubit, AuthState>(
      listenWhen: AuthFetchByIdState.match,
      listener: (context, state) {
        if (state.fetchById is AuthFetchByIdSuccess) {
          screenState.tabController.index = 2;
          final userProfile = state.fetch.data;

          if (!screenState.postsFetched) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<PostCubit>().fetchByUid(userProfile!.uid);
              screenState.postsFetched = true;
            });
          }
        } else if (state.fetchById is AuthFetchByIdFailed) {
        } else if (state.fetchById is AuthFetchByIdLoading) {
          Expanded(child: Center(child: CircularProgressIndicator()));
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}

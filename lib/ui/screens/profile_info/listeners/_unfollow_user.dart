part of '../profile_info.dart';

class _UnFollowUser extends StatelessWidget {
  const _UnFollowUser();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context);

    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (a, b) => a.unfollow != b.unfollow,
      listener: (context, state) {
        if (state.unfollow is AuthUnFollowFailed) {
          UiFlash.error(
            context,
            state.unfollow.message ?? 'Failed to perform action',
          );
        }

        if (state.unfollow is AuthUnFollowSuccess) {
          final viewedUserId = screenState.userId;
          if (viewedUserId != null) {
            AuthCubit.c(context).fetchById(viewedUserId);
          }

          // If AuthFollowSuccess also provides an updated authenticated user profile,
          // you might want to update it in your AuthCubit's state as well.
          // For example, if state.profile is the updated authenticated user:
          // if (state.profile != null) {
          //   AuthCubit.c(context).updateAuthenticatedUserProfile(state.profile!);
          // }
        }
      },
      child: SizedBox.shrink(),
    );
  }
}

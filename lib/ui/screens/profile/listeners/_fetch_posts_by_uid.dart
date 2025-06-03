part of '../profile.dart';

class _FetchPostsByUid extends StatelessWidget {
  const _FetchPostsByUid();
  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context);
    final user = context.user(false);
    return BlocListener<PostCubit, PostState>(
      listenWhen: FetchPostByUidState.match,
      listener: (context, state) {
        if (state.fetchPostByUid is FetchPostByUidSuccess) {
          if (!screenState.postsFetched) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<PostCubit>().fetchByUid(user!.uid);
              screenState.postsFetched = true;
            });
          }
        } else if (state.fetchPostByUid is FetchPostByUidFailed) {
          Center(
            child: Text(
              'Failed to load posts: ${state.fetchPostByUid.message}',
              style: AppText.bodyRegular.copyWith(color: AppColors.red800),
            ),
          );
        } else if (state.fetchPostByUid is FetchPostByUidLoading) {
          Expanded(child: Center(child: CircularProgressIndicator()));
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}

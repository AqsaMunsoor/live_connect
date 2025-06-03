part of '../../profile_info.dart';

class _PostsTab extends StatefulWidget {
  const _PostsTab();

  @override
  State<_PostsTab> createState() => _PostsTabState();
}

class _PostsTabState extends State<_PostsTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final screenState = _ScreenState.s(context);
    final user = screenState.user;
    if (user != null) {
      PostCubit.c(context).fetchByUid(user.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    final postCubit = PostCubit.c(context, true);
    final isLoading = postCubit.state is FetchPostByUidLoading;
    final isSuccess = postCubit.state is FetchPostByUidSuccess;
    final posts = postCubit.state.fetchPostByUid.data ?? [];

    return Builder(
      builder: (context) {
        if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (posts.isEmpty && isSuccess) {
          return Center(
            child: Text('No posts yet', style: AppText.bodyRegular),
          );
        }
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return PostCard(post: post);
          },
        );
      },
    );
  }
}

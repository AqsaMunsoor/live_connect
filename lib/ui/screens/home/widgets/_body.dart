part of '../home.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    super.initState();
    PostCubit.c(context).fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      scaffoldBackgroundColor: AppColors.white100,
      keyboardHandler: true,
      bottomBar: true,
      overlayBuilders: [_AddCommentListener()],
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: AppColors.white900,
              width: double.infinity,
              child: AppHeader(
                trailing: GestureDetector(
                  child: Icon(FeatherIcons.send),
                  onTap: () => AppRoutes.chat.push(context),
                ),
                onTrailingTap: () => print('Send tapped'),
                centerAlign: true,
              ),
            ),
            Space.y.t08,
            Container(
              color: AppColors.white900,
              width: double.infinity,
              child: Padding(padding: Space.p.vertical.t16, child: WritePost()),
            ),
            Space.y.t08,

            BlocBuilder<PostCubit, PostState>(
              // Changed PostState to PostsState to match PostCubit emit
              buildWhen:
                  (previous, current) => previous.fetchAll != current.fetchAll,
              builder: (context, state) {
                // Check the type of the fetchAll sub-state
                if (state.fetchAll is FetchAllLoading) {
                  return const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (state.fetchAll is FetchAllSuccess) {
                  // Safely cast to FetchAllSuccess to access its 'posts' property
                  final posts = state.posts;
                  if (posts!.isEmpty) {
                    return const Expanded(
                      child: Center(
                        child: Text(
                          'No posts yet. Be the first to share something!',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return PostCard(post: post);
                      },
                    ),
                  );
                } else if (state.fetchAll is FetchAllFailed) {
                  // Safely cast to FetchAllFailed to access its 'message' property
                  final errorMessage =
                      (state.fetchAll as FetchAllFailed).message;
                  return Expanded(
                    child: Center(
                      child: Text(
                        'Error loading posts: ${errorMessage ?? "Unknown error"}',
                      ),
                    ),
                  );
                }
                // Default case, perhaps when fetchAll is FetchAllDefault or initial state
                return const Expanded(child: SizedBox.shrink());
              },
            ),
          ],
        ),
      ),
    );
  }
}

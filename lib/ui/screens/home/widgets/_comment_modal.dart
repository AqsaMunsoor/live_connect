part of '../home.dart';

class CommentsModalSheet extends StatefulWidget {
  final Post post;
  const CommentsModalSheet({super.key, required this.post});

  @override
  State<CommentsModalSheet> createState() => _CommentsModalSheetState();
}

class _CommentsModalSheetState extends State<CommentsModalSheet> {
  final commentFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    CommentCubit.c(context).fetchPostComments(postId: widget.post.id);
  }

  @override
  void dispose() {
    final screenState = _ScreenState.s(context);
    screenState.commentTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserData? user = context.user(true);
    final screenState = _ScreenState.s(context, true);
    final commentCubit = CommentCubit.c(context, true);

    final isLoading =
        commentCubit.state.fetchPostComments is FetchPostCommentsLoading;
    final isSuccess =
        commentCubit.state.fetchPostComments is FetchPostCommentsSuccess;
    final isFailed =
        commentCubit.state.fetchPostComments is FetchPostCommentsFailed;
    final comments = commentCubit.state.comments ?? [];

    final bool isCommenting =
        commentCubit.state.addComment is AddCommentLoading;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: Space.p.vertical.t12,
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.neutral300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Padding(
              padding: Space.p.horizontal.t16 + Space.p.bottom.t12,
              child: Text(
                'Comments',
                style: AppText.h6.copyWith(color: AppColors.neutral900),
              ),
            ),
            Divider(color: AppColors.neutral200, height: 1),
            Expanded(
              child: Builder(
                builder: (context) {
                  if (isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  } else if (isSuccess) {
                    if (comments.isEmpty) {
                      return Center(
                        child: Text(
                          'No comments yet. Be the first to comment!',
                          style: AppText.bodyRegular.copyWith(
                            color: AppColors.neutral500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (context, index) {
                        final comment = comments[index];
                        return Padding(
                          padding:
                              Space.p.horizontal.t16 + Space.p.vertical.t08,
                          child: CommentItem(comment: comment),
                        );
                      },
                    );
                  } else if (isFailed) {
                    return Center(
                      child: Text(
                        'Failed to load comments: ${commentCubit.state.fetchPostComments.message}',
                        style: AppText.bodyRegular.copyWith(
                          color: AppColors.red800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            Divider(color: AppColors.neutral200, height: 1),
            Container(
              padding: Space.p.all.t16,
              color: AppColors.white,
              child: Form(
                key: commentFormKey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColors.neutral100,
                      backgroundImage:
                          user != null &&
                                  user.profilePic != null &&
                                  user.profilePic!.isNotEmpty
                              ? NetworkImage(user.profilePic!)
                              : null,
                      child:
                          user == null ||
                                  user.profilePic == null ||
                                  user.profilePic!.isEmpty
                              ? Icon(
                                Icons.person,
                                size: 16,
                                color: AppColors.neutral500,
                              )
                              : null,
                    ),
                    Space.x.t08,
                    Expanded(
                      child: TextFormField(
                        controller: screenState.commentTextController,
                        decoration: InputDecoration(
                          hintText: 'Add a comment...',
                          hintStyle: AppText.bodyRegular.copyWith(
                            color: AppColors.neutral300,
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.white300),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.white300),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.white300),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.red800),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.red800),
                          ),
                          contentPadding: Space.p.all.t12,
                        ),
                        maxLines: 3,
                        minLines: 1,
                        textInputAction: TextInputAction.send,
                        onFieldSubmitted: (value) {
                          if (!isCommenting && user != null) {
                            if (commentFormKey.currentState?.validate() ??
                                false) {
                              final commentContent =
                                  screenState.commentTextController.text.trim();

                              CommentCubit.c(context).addComment(
                                content: commentContent,
                                postId: widget.post.id,
                              );
                            }
                          }
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Comment cannot be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    if (isCommenting) ...[
                      Space.x.t08,
                      const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    final String commentUserProfilePicUrl =
        comment.user['profilePic'] as String? ?? '';
    final String commentUsername =
        comment.user['username'] as String? ?? 'Anonymous';

    return GestureDetector(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: AppColors.neutral100,
            backgroundImage:
                commentUserProfilePicUrl.isNotEmpty
                    ? NetworkImage(commentUserProfilePicUrl)
                    : null,
            child:
                commentUserProfilePicUrl.isEmpty
                    ? Icon(Icons.person, size: 14, color: AppColors.neutral500)
                    : null,
          ),
          Space.x.t08,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      commentUsername.titleCase,
                      style: AppText.labelMedium.copyWith(
                        color: AppColors.neutral900,
                      ),
                    ),
                    Space.x.t08,
                    Text(
                      comment.createdAt.timeAgo,
                      style: AppText.bodyRegular.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                  ],
                ),
                Space.y.t04,
                Text(
                  comment.content,
                  style: AppText.bodyRegular.copyWith(
                    color: AppColors.neutral700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

part of '../home.dart';

class PostCard extends StatefulWidget {
  final Post post;
  const PostCard({required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  void _showCommentsModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ListenableProvider.value(
          value: _ScreenState(),
          child: CommentsModalSheet(post: widget.post),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.post.user;

    final userName = user['name'];
    final userPicture = user['profilePic'];
    final userBio = user['bio'];
    return Container(
      margin: Space.m.bottom.t08,
      color: AppColors.white900,
      width: double.infinity,
      child: Padding(
        padding: Space.p.all.t16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: AppColors.neutral100,
                      backgroundImage:
                          userPicture != null && user.isNotEmpty
                              ? NetworkImage(userPicture)
                              : null,
                      child:
                          userPicture.isEmpty
                              ? Icon(Icons.person, color: AppColors.neutral500)
                              : null,
                    ),
                    Space.x.t12,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: AppText.h6.copyWith(
                            color: AppColors.neutral900,
                          ),
                        ),
                        Text(
                          userBio ?? '',
                          style: AppText.labelRegular.copyWith(
                            color: AppColors.neutral800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(FeatherIcons.moreHorizontal),
                    Text(
                      widget.post.createdAt.timeAgo,
                      style: AppText.labelRegular.copyWith(
                        color: AppColors.neutral400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Space.y.t16,
            Text(
              widget.post.content,
              style: AppText.bodyRegular.copyWith(color: AppColors.neutral800),
            ),
            Space.y.t16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _showCommentsModal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        FeatherIcons.messageCircle,
                        color: AppColors.neutral500,
                      ),
                      Space.x.t08,
                      Text(
                        'Comment',
                        style: AppText.labelRegular.copyWith(
                          color: AppColors.neutral500,
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${widget.post.likeCount.toString()} Likes',
                      style: AppText.labelRegular.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                    Space.x.t08,
                    Icon(
                      FeatherIcons.thumbsUp,
                      size: 20,
                      color: AppColors.neutral500,
                    ),
                  ],
                ),
              ],
            ),

            Space.y.t16,
          ],
        ),
      ),
    );
  }
}

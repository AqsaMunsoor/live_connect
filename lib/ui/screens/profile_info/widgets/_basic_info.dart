part of '../profile_info.dart';

class _BasicInfo extends StatelessWidget {
  const _BasicInfo({required this.userProfile});

  final UserData userProfile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.p.horizontal.t32 + Space.p.vertical.t32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.neutral100,
                backgroundImage:
                    (userProfile.profilePic != null &&
                            userProfile.profilePic!.isNotEmpty)
                        ? NetworkImage(userProfile.profilePic!)
                        : null,
                child:
                    (userProfile.profilePic == null ||
                            userProfile.profilePic!.isEmpty)
                        ? Icon(
                          Icons.person,
                          size: 40,
                          color: AppColors.neutral500,
                        )
                        : null,
              ),
              Row(
                spacing: 24,
                children: [
                  _ProfileNumbers(
                    title: 'Posts',
                    count: '${userProfile.postIds.length}',
                  ),
                  _ProfileNumbers(
                    title: 'Followers',
                    count: '${userProfile.followers.length}',
                  ),
                  _ProfileNumbers(
                    title: 'Following',
                    count: '${userProfile.following.length}',
                  ),
                ],
              ),
            ],
          ),
          Space.y.t24,
          Row(
            spacing: 8,
            children: [
              Text(
                userProfile.name.titleCase,
                style: AppText.h5 + AppText.medium + AppColors.neutral800,
              ),
              Text(
                '@ ${userProfile.username}',
                style: AppText.labelRegular + AppColors.neutral500,
              ),
            ],
          ),
          Space.y.t08,
          Text(
            userProfile.bio ?? '',
            style: AppText.bodyRegular + AppColors.neutral600,
          ),
        ],
      ),
    );
  }
}

class _ProfileNumbers extends StatelessWidget {
  const _ProfileNumbers({required this.title, required this.count});

  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: AppText.h4 + AppText.semiBold + AppColors.neutral800,
        ),
        Text(title, style: AppText.labelRegular + AppColors.neutral600),
      ],
    );
  }
}

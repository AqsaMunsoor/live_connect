part of '../search.dart';

class UserListItem extends StatelessWidget {
  final UserData user;
  const UserListItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final String profilePicUrl = user.profilePic ?? '';
    return InkWell(
      onTap: () {
        AppRoutes.profileInfo.push(context, arguments: {'userId': user.uid});
      },
      child: Padding(
        padding: Space.p.vertical.t08,
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.neutral100,
              backgroundImage:
                  profilePicUrl.isNotEmpty ? NetworkImage(profilePicUrl) : null,
              child:
                  profilePicUrl.isEmpty
                      ? Icon(Icons.person, color: AppColors.neutral500)
                      : null,
            ),
            Space.x.t12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name.titleCase,
                  style: AppText.h6.copyWith(color: AppColors.neutral900),
                ),
                Text(
                  '@${user.username}',
                  style: AppText.labelRegular.copyWith(
                    color: AppColors.neutral700,
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Optional: Add a follow/message button here
          ],
        ),
      ),
    );
  }
}

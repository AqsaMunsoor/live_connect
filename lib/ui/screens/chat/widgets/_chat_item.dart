part of '../chat.dart';

class _ChatItem extends StatefulWidget {
  const _ChatItem();

  @override
  State<_ChatItem> createState() => __ChatItemState();
}

class __ChatItemState extends State<_ChatItem> {
  @override
  void initState() {
    super.initState();
    AuthCubit.c(context).fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: AuthFetchState.match,
      builder: (context, state) {
        final user = state.profile;
        final profilePic = user?.profilePic;

        return Expanded(
          child: ZIMKitConversationListView(
            itemBuilder: (context, conversation, defaultWidget) {
              final lastMessage = conversation.lastMessage;
              String lastMessageText = '';
              String timeAgoText = '';

              if (lastMessage != null) {
                // Extract text
                if (lastMessage.type == ZIMMessageType.text &&
                    lastMessage.textContent != null) {
                  lastMessageText = lastMessage.textContent!.text;
                } else {
                  lastMessageText = '[Unsupported message]';
                }

                // Use your extension on timestamp
                final dateTime = DateTime.fromMillisecondsSinceEpoch(
                  lastMessage.zim.timestamp,
                );
                timeAgoText = dateTime.timeAgo;
              }

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => ZIMKitMessageListPage(
                            conversationID: conversation.id,
                            conversationType: conversation.type,
                          ),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(conversation.name),
                  subtitle: Text(lastMessageText),
                  leading: CircleAvatar(
                    backgroundImage:
                        profilePic != null && profilePic.startsWith('http')
                            ? NetworkImage(profilePic)
                            : AssetImage('assets/default_avatar.png')
                                as ImageProvider,
                  ),
                  trailing: Text(
                    timeAgoText,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

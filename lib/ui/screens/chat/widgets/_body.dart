part of '../chat.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Screen(
      padding: Space.p.screen,
      keyboardHandler: true,
      bottomBar: true,
      child: SafeArea(
        child: Column(
          children: [
            AppHeader(
              leading: GestureDetector(
                child: Icon(FeatherIcons.arrowLeft),
                onTap: () => ''.pop(context),
              ),
              centerWidget: Text(
                'Chats',
                style: AppText.h3.copyWith(fontWeight: AppText.extraBold),
              ),
            ),
            _ChatItem(),
          ],
        ),
      ),
    );
  }
}

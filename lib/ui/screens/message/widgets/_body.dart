part of '../message.dart';

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [AppHeader(), Text("Notifications")],
        ),
      ),
    );
  }
}

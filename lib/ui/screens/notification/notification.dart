import 'package:flutter/material.dart';
import 'package:live_connect/ui/widgets/header/header.dart';

import 'package:provider/provider.dart';
import 'package:live_connect/configs/configs.dart';

import 'package:live_connect/ui/widgets/screen/screen.dart';

part '_state.dart';

part 'widgets/_body.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}

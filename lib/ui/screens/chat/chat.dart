import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_connect/blocs/auth/cubit.dart';
import 'package:live_connect/ui/widgets/header/header.dart';

import 'package:provider/provider.dart';
import 'package:live_connect/configs/configs.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:live_connect/ui/widgets/screen/screen.dart';
import 'package:zego_zim/zego_zim.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

part '_state.dart';

part 'widgets/_body.dart';
part 'widgets/_chat_item.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}

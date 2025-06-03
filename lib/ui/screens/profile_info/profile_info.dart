import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:live_connect/blocs/auth/cubit.dart';
import 'package:live_connect/blocs/post/cubit.dart';
import 'package:live_connect/models/user/user.dart';
import 'package:live_connect/router/routes.dart';
import 'package:live_connect/ui/screens/home/home.dart';
import 'package:live_connect/ui/widgets/button/app_button.dart';
import 'package:live_connect/ui/widgets/header/header.dart';
import 'package:live_connect/ui/widgets/loader/full_screen_loader.dart';
import 'package:live_connect/utils/ui_flash.dart';
import 'package:provider/provider.dart';
import 'package:live_connect/configs/configs.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:live_connect/ui/widgets/screen/screen.dart';
import 'package:zego_zim/zego_zim.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

part '_state.dart';

part 'widgets/_body.dart';
part 'widgets/_basic_info.dart';

part 'widgets/tab_bar/_post.dart';

part 'listeners/_fetch_profile.dart';
part 'listeners/_follow_user.dart';
part 'listeners/_unfollow_user.dart';
part 'listeners/_fetch_posts_by_uid.dart';

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(args: args),
      child: const _Body(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:live_connect/blocs/auth/cubit.dart';
import 'package:live_connect/blocs/comment/cubit.dart';
import 'package:live_connect/blocs/post/cubit.dart';
import 'package:live_connect/models/comment/comment.dart';
import 'package:live_connect/models/post/post.dart';
import 'package:live_connect/models/user/user.dart';
import 'package:live_connect/router/routes.dart';
import 'package:live_connect/ui/widgets/header/header.dart';
import 'package:live_connect/utils/ui_flash.dart';

import 'package:provider/provider.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:live_connect/configs/configs.dart';

import 'package:live_connect/ui/widgets/screen/screen.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '_state.dart';

part 'widgets/_body.dart';
part 'widgets/_write_post.dart';
part 'widgets/_post_card.dart';
part 'widgets/_comment_modal.dart';

part 'listeners/_add_comment.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}

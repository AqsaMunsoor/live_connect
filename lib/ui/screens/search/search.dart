import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:live_connect/blocs/auth/cubit.dart';
import 'package:live_connect/models/user/user.dart';
import 'package:live_connect/router/routes.dart';
import 'package:provider/provider.dart';
import 'package:live_connect/configs/configs.dart';

import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:live_connect/ui/widgets/screen/screen.dart';

part '_state.dart';

part 'widgets/_body.dart';
part 'widgets/_user_list_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}

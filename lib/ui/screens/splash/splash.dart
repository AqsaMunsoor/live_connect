import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_connect/blocs/auth/cubit.dart';
import 'package:live_connect/router/routes.dart';
import 'package:live_connect/services/cache.dart';
import 'package:live_connect/ui/widgets/loader/full_screen_loader.dart';
import 'package:live_connect/utils/ui_flash.dart';

import 'package:provider/provider.dart';
import 'package:live_connect/configs/configs.dart';

import 'package:live_connect/ui/widgets/screen/screen.dart';

import '../../../services/log.dart';

part '_state.dart';

part 'widgets/_body.dart';

part 'listeners/_user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthCubit.c(context).init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}

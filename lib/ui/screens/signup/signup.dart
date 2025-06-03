import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:live_connect/blocs/auth/cubit.dart';
import 'package:live_connect/router/routes.dart';
import 'package:live_connect/services/cache.dart';
import 'package:live_connect/ui/widgets/button/app_button.dart';
import 'package:live_connect/ui/widgets/header/header.dart';
import 'package:live_connect/ui/widgets/loader/full_screen_loader.dart';
import 'package:live_connect/utils/ui_flash.dart';
import 'package:provider/provider.dart';
import 'package:live_connect/configs/configs.dart';

import 'package:live_connect/ui/widgets/screen/screen.dart';

part '_state.dart';

part 'widgets/_body.dart';
part 'listeners/_signup.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  void initState() {
    super.initState();
    AppCache.setFirstVisit();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}

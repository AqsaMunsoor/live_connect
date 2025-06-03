part of '../login.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    final authCubit = AuthCubit.c(context, true);

    return Screen(
      padding: Space.p.screen,
      keyboardHandler: true,
      overlayBuilders: [_LoginListener()],
      child: SafeArea(
        child: FormBuilder(
          key: screenState.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppHeader(centerAlign: true),
                AppButton(
                  label: 'Log in with Google',
                  onPressed: () {
                    UiFlash.info(context, "Google Login not implemented.");
                  },
                  state: AppButtonState.outlined,
                  leading: const Icon(Icons.abc),
                ),
                Space.y.t16,
                AppButton(
                  label: 'Log in with Email',
                  onPressed: () {
                    UiFlash.info(context, "Use the form below.");
                  },
                  state: AppButtonState.outlined,
                  leading: const Icon(Icons.mail),
                ),
                Space.y.t32,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 136,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: AppColors.white300,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'OR',
                      style: AppText.labelMedium.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                    Container(
                      width: 136,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: AppColors.white300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Space.y.t48,
                FormBuilderTextField(
                  name: 'email',
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: AppText.bodyRegular.copyWith(
                      color: AppColors.neutral400,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.white400,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.white400,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(width: 1, color: AppColors.red800),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(width: 1, color: AppColors.red800),
                    ),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                Space.y.t16,
                FormBuilderTextField(
                  name: 'password',
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: AppText.bodyRegular.copyWith(
                      color: AppColors.neutral400,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.white400,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.white400,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(width: 1, color: AppColors.red800),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(width: 1, color: AppColors.red800),
                    ),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(6),
                  ]),
                ),
                Space.y.t32,
                AppButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (screenState.formKey.currentState?.saveAndValidate() ??
                        false) {
                      final formData = screenState.formKey.currentState!.value;
                      final email = formData['email'] as String;
                      final password = formData['password'] as String;

                      authCubit.login(email, password);
                    }
                  },
                  label: 'Login',
                ),
                Space.y.t32,
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don\'t have an account? ',
                          style: AppText.bodyRegular.copyWith(
                            color: AppColors.neutral600,
                          ),
                        ),
                        TextSpan(
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () => AppRoutes.signup.push(context),
                          text: 'Sign up',
                          style: AppText.bodyMedium.copyWith(
                            color: AppColors.neutral800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Space.y.t24,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

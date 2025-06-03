part of '../signup.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);

    final authCubit = AuthCubit.c(context, true);

    return Screen(
      padding: Space.p.screen,
      keyboardHandler: true,
      overlayBuilders: [_SignupListener()],
      child: SafeArea(
        child: FormBuilder(
          key: screenState.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppHeader(centerAlign: true),
                AppButton(
                  label: 'Sign up with Google',
                  onPressed: () {
                    UiFlash.info(
                      context,
                      "Google Sign up not implemented yet.",
                    );
                  },
                  state: AppButtonState.outlined,
                  leading: const Icon(Icons.abc),
                ),
                Space.y.t16,
                AppButton(
                  label: 'Sign up with Email',
                  onPressed: () {
                    UiFlash.info(
                      context,
                      "Use the form below for email sign up.",
                    );
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
                      width: MediaQuery.of(context).size.width * 0.35,
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
                      width: MediaQuery.of(context).size.width * 0.35,
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
                  name: 'username',
                  decoration: InputDecoration(
                    hintText: 'Username (e.g., johndoe23)',
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
                    FormBuilderValidators.required(
                      errorText: 'Username is required',
                    ),
                    FormBuilderValidators.minLength(
                      3,
                      errorText: 'Username must be at least 3 characters',
                    ),
                  ]),
                ),
                Space.y.t16,

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

                      final String username = formData['username'] as String;
                      final String displayName = username;
                      final String email = formData['email'] as String;
                      final String password = formData['password'] as String;
                      final payload = {
                        'username': username,
                        'displayName': displayName,
                        'email': email,
                        'password': password,
                      };
                      authCubit.register(payload);
                    }
                  },
                  label: 'Continue',
                ),
                Space.y.t32,
                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Have an account? ',
                          style: AppText.bodyRegular.copyWith(
                            color: AppColors.neutral600,
                          ),
                        ),
                        TextSpan(
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () => AppRoutes.login.push(context),
                          text: 'Log In',
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

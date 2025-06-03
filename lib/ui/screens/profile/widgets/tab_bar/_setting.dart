part of '../../profile.dart';

class _SettingTab extends StatefulWidget {
  const _SettingTab();

  @override
  State<_SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<_SettingTab> {
  late final _ScreenState screenState;
  bool _isFormPrefilled = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenState = _ScreenState.s(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: Space.p.horizontal.t32,
      child: FormBuilder(
        key: screenState.formKey,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Space.y.t32,
            FormBuilderTextField(
              name: 'fullname',

              decoration: InputDecoration(
                hintText: 'Full name',
                hintStyle: AppText.bodyRegular.copyWith(
                  color: AppColors.neutral400,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.white400,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
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
              ]),
            ),
            Space.y.t16,
            FormBuilderTextField(
              name: 'username',

              decoration: InputDecoration(
                hintText: 'Username',
                hintStyle: AppText.bodyRegular.copyWith(
                  color: AppColors.neutral400,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.white400,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
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
              ]),
            ),
            Space.y.t16,
            FormBuilderTextField(
              name: 'bio',
              maxLines: 3,

              decoration: InputDecoration(
                hintText: 'Bio',
                hintStyle: AppText.bodyRegular.copyWith(
                  color: AppColors.neutral400,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    width: 1,
                    color: AppColors.white400,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
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
            ),
            Space.y.t16,
            AppButton(
              label: 'Update',
              onPressed: () {
                if (screenState.formKey.currentState?.saveAndValidate() ??
                    false) {
                  final payload = screenState.formKey.currentState!.value;
                  // AuthCubit.c(context).updateUserProfile({
                  //   'name': payload['fullname'],
                  //   'username': payload['username'],
                  //   'bio': payload['bio'],
                  // });
                }
              },
            ),
            Space.y.t32,
            TextButton(
              onPressed: () {
                AuthCubit.c(context).logout();
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
              },
              child: Text(
                'Log out',
                style: AppText.h5 + AppText.medium + AppColors.red700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

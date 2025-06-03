part of '../profile.dart';

class _UpdateProfile extends StatelessWidget {
  const _UpdateProfile();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (a, b) => a.update != b.update,
      listener: (_, state) {
        if (state.update is AuthUpdateFailed) {
          UiFlash.error(
            context,
            state.update.message ?? 'Failed to perform action',
          );
        }
        if (state.update is AuthUpdateSuccess) {
          UiFlash.success(context, 'Profile updated successfully');
        }
      },
      builder: (context, state) {
        final loading = state.update is AuthUpdateLoading;
        return FullScreenLoader(loading: loading);
      },
    );
  }
}

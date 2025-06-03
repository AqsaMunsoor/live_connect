part of '../login.dart';

class _LoginListener extends StatelessWidget {
  const _LoginListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous.login != current.login,
      listener: (context, state) {
        if (state.login is AuthLoginFailed) {
          UiFlash.error(context, state.login.message ?? 'Login Failed');
        }

        if (state.login is AuthLoginSuccess) {
          // --- Existing success logic likely here ---
          // For example, navigation:
          // AppRoutes.home.go(context);
          // UiFlash.success(context, 'Login Successful');
          // --- End of existing success logic ---

          // --- Add ZIMKit connection logic ---
          final loggedInUserData =
              state
                  .login
                  .data; // Assuming AuthLoginSuccess has a 'data' field with UserData

          if (loggedInUserData != null) {
            final String userId = loggedInUserData.uid;
            // Adjust 'username' if your UserData model uses a different field for the display name
            final String userName = loggedInUserData.username;
            // Fallback if username is not available

            if (userId.isNotEmpty && userName.isNotEmpty) {
              ZIMKit()
                  .connectUser(id: userId, name: userName)
                  .then((_) {
                    // Optional: Handle successful ZIMKit connection
                    AppLog.log(
                      'ZIMKit connected successfully for user: $userId',
                    );
                    // Navigate after ZIMKit connection if preferred
                    AppRoutes.home.push(
                      context,
                    ); // Example: move navigation here
                    UiFlash.success(
                      context,
                      'Login Successful & ZIMKit Connected',
                    );
                  })
                  .catchError((error) {
                    // Optional: Handle ZIMKit connection error
                    AppLog.log('ZIMKit connection failed: $error');
                    UiFlash.error(
                      context,
                      'Login succeeded but chat connection failed.',
                    );
                    // Still navigate or handle as appropriate
                    AppRoutes.home.push(context); // Or some other error state
                  });
            } else {
              AppLog.log(
                'ZIMKit connection skipped: User ID or Name is empty after login.',
              );
              // Still navigate or handle as appropriate
              AppRoutes.home.push(context);
              UiFlash.error(
                context,
                'Login successful, but chat features may be limited.',
              );
            }
          } else {
            AppLog.log(
              'ZIMKit connection skipped: No user data found after successful login.',
            );
            // Still navigate or handle as appropriate
            AppRoutes.home.push(context);
            UiFlash.error(
              context,
              'Login successful, but user data missing for chat.',
            );
          }
          // --- End of ZIMKit connection logic ---
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}

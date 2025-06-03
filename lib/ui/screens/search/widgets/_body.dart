part of '../search.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    final authCubit = AuthCubit.c(context, true);
    final isLoading = authCubit.state.search is AuthSearchLoading;
    final isSuccess = authCubit.state.search is AuthSearchSuccess;
    final isFailed = authCubit.state.search is AuthSearchFailed;
    final users = authCubit.state.search.data ?? [];
    return Screen(
      padding: Space.p.screen,
      keyboardHandler: true,
      bottomBar: true,
      child: SafeArea(
        child: FormBuilder(
          key: screenState.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormBuilderTextField(
                name: 'search',
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: AppText.bodyRegular.copyWith(
                    color: AppColors.neutral400,
                  ),
                  prefixIcon: Icon(FeatherIcons.search, size: 20),
                  prefixIconColor: AppColors.neutral500,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(width: 1, color: AppColors.white400),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(width: 1, color: AppColors.white400),
                  ),
                ),
                onChanged: (value) {
                  if (value != null) {
                    AuthCubit.c(context).search(value);
                  }
                  if (value == null || value.isEmpty) {
                    AuthCubit.c(context).resetSearch();
                  }
                },
              ),
              Space.y.t16,
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (isSuccess) {
                      if (users.isEmpty) {
                        return Center(
                          child: Text(
                            'No users found.',
                            style: AppText.bodyRegular.copyWith(
                              color: AppColors.neutral500,
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return UserListItem(user: user);
                        },
                      );
                    } else if (isFailed) {
                      return Center(
                        child: Text(
                          'Error: ${authCubit.state.search.message}',
                          style: AppText.bodyRegular.copyWith(
                            color: AppColors.red800,
                          ),
                        ),
                      );
                    }
                    return Center(
                      child: Text(
                        'Start typing to search for users.',
                        style: AppText.bodyRegular.copyWith(
                          color: AppColors.neutral500,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

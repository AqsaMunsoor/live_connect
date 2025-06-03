part of '../profile.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    final screenState = _ScreenState.s(context);

    screenState.tabController = TabController(length: 3, vsync: this);

    // AuthCubit.c(context).fetchProfile();
  }

  @override
  void dispose() {
    final screenState = _ScreenState.s(context, true);
    screenState.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.c(context);
    final userProfile = authCubit.state.profile;
    final screenState = _ScreenState.s(context, true);
    return Screen(
      keyboardHandler: true,
      scaffoldBackgroundColor: AppColors.white100,
      bottomBar: true,
      overlayBuilders: [_FetchUserListener(), _FetchPostsByUid()],
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: AppColors.white900,
              width: double.infinity,
              child: AppHeader(),
            ),
            Space.y.t08,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: AppColors.white900,
                    width: double.infinity,
                    child: _BasicInfo(userProfile: userProfile!),
                  ),

                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          color: AppColors.white900,
                          width: double.infinity,
                          child: TabBar(
                            controller: screenState.tabController,
                            dividerColor: AppColors.white200,
                            indicatorColor: Colors.transparent,
                            labelColor: AppColors.neutral900,
                            unselectedLabelColor: AppColors.neutral500,
                            splashFactory: NoSplash.splashFactory,
                            overlayColor:
                                WidgetStateProperty.resolveWith<Color?>((
                                  Set<WidgetState> states,
                                ) {
                                  return states.contains(WidgetState.focused)
                                      ? null
                                      : Colors.transparent;
                                }),
                            tabs: const [
                              Tab(icon: Icon(FeatherIcons.grid)),
                              Tab(icon: Icon(FeatherIcons.bookmark)),
                              Tab(icon: Icon(FeatherIcons.settings)),
                            ],
                          ),
                        ),
                        Space.y.t08,

                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          color: AppColors.white900,
                          width: double.infinity,
                          child: TabBarView(
                            controller: screenState.tabController,
                            children: const [
                              _PostsTab(),
                              _SavedTab(),
                              _SettingTab(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

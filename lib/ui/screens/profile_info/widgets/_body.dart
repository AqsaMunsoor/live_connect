part of '../profile_info.dart';

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  bool? _isFollowing;
  UserData? _profileBeingViewed;

  @override
  void initState() {
    super.initState();
    final screenState = _ScreenState.s(context);
    if (screenState.userId != null) {
      AuthCubit.c(context).fetchById(screenState.userId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    final authCubit = AuthCubit.c(context);
    final String? currentAuthUserId = authCubit.state.profile?.uid;

    return Screen(
      keyboardHandler: true,
      scaffoldBackgroundColor: AppColors.white100,
      overlayBuilders: [
        _FetchUserByUidListener(),
        _FetchPostsByUid(),
        _FollowUser(),
        _UnFollowUser(),
      ],
      child: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listenWhen:
              (previous, current) => previous.fetchById != current.fetchById,
          listener: (context, state) {
            if (state.fetchById is AuthFetchByIdSuccess) {
              final userFromServer = state.fetchById.data!;
              if (_profileBeingViewed == null ||
                  userFromServer.uid == screenState.userId) {
                setState(() {
                  _profileBeingViewed = userFromServer;
                  if (currentAuthUserId != null) {
                    _isFollowing = _profileBeingViewed!.followers.contains(
                      currentAuthUserId,
                    );
                  }
                  screenState.setUser(_profileBeingViewed!);
                });
              }
            }
          },
          buildWhen:
              (previous, current) => previous.fetchById != current.fetchById,
          builder: (context, state) {
            if (_profileBeingViewed == null) {
              if (state.fetchById is AuthFetchByIdLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.fetchById is AuthFetchByIdFailed) {
                final errorMessage = state.fetchById.message;
                return Center(
                  child: AppButton(
                    label: errorMessage ?? 'Something went wrong!',
                    onPressed: () {
                      final userId = screenState.userId;
                      if (userId != null) {
                        authCubit.fetchById(userId);
                      }
                    },
                  ),
                );
              }
              return const SizedBox.shrink();
            }

            if (_isFollowing == null && currentAuthUserId != null) {
              _isFollowing = _profileBeingViewed!.followers.contains(
                currentAuthUserId,
              );
            }

            final bool currentFollowStatus = _isFollowing ?? false;

            // Enable Follow/Unfollow only if user is logged in and not viewing their own profile
            final bool canFollowUnfollow =
                currentAuthUserId != null &&
                _profileBeingViewed!.uid != currentAuthUserId;

            // Enable Message only if not viewing own profile
            final bool canMessage =
                _profileBeingViewed!.uid != currentAuthUserId;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: AppColors.white900,
                  width: double.infinity,
                  child: AppHeader(
                    leading: GestureDetector(
                      child: Icon(FeatherIcons.arrowUpLeft),
                      onTap: () => ''.pop(context),
                    ),
                    onLeadingTap: () => print('Menu tapped'),
                    centerAlign: true,
                  ),
                ),
                Space.y.t08,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        color: AppColors.white900,
                        width: double.infinity,
                        child: _BasicInfo(userProfile: _profileBeingViewed!),
                      ),
                      Container(
                        color: AppColors.white900,
                        width: double.infinity,
                        child: Padding(
                          padding: Space.p.horizontal.t24,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: AppButton(
                                  label:
                                      currentFollowStatus
                                          ? 'Unfollow'
                                          : 'Follow',
                                  onPressed:
                                      canFollowUnfollow
                                          ? () {
                                            final targetUserId =
                                                _profileBeingViewed!.uid;

                                            if (currentFollowStatus) {
                                              authCubit.unfollowUser(
                                                targetUserId,
                                              );
                                              setState(() {
                                                _isFollowing = false;
                                                _profileBeingViewed =
                                                    _profileBeingViewed!
                                                        .copyWith(
                                                          followers: List<
                                                            String
                                                          >.from(
                                                            _profileBeingViewed!
                                                                .followers,
                                                          )..remove(
                                                            currentAuthUserId,
                                                          ),
                                                        );
                                                screenState.setUser(
                                                  _profileBeingViewed!,
                                                );
                                              });
                                            } else {
                                              authCubit.followUser(
                                                targetUserId,
                                              );
                                              setState(() {
                                                _isFollowing = true;
                                                _profileBeingViewed =
                                                    _profileBeingViewed!
                                                        .copyWith(
                                                          followers: List<
                                                            String
                                                          >.from(
                                                            _profileBeingViewed!
                                                                .followers,
                                                          )..add(
                                                            currentAuthUserId!,
                                                          ),
                                                        );
                                                screenState.setUser(
                                                  _profileBeingViewed!,
                                                );
                                              });
                                            }
                                          }
                                          : () {},
                                ),
                              ),
                              Space.x.t08,
                              Expanded(
                                child: AppButton(
                                  label: 'Message',
                                  onPressed:
                                      canMessage
                                          ? () {
                                            AppRoutes.chat.push(context);
                                          }
                                          : () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: AppColors.white900,
                        padding: Space.p.vertical.t12,
                        alignment: Alignment.center,
                        child: Icon(
                          FeatherIcons.grid,
                          color: AppColors.neutral900,
                        ),
                      ),
                      Space.y.t08,
                      Expanded(
                        child: Container(
                          color: AppColors.white900,
                          width: double.infinity,
                          child: const _PostsTab(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

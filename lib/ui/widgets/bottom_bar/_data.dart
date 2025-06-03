part of 'bottom_bar.dart';

final _tabs = [
  _BottomBar(label: 'Products', path: AppRoutes.home, icon: FeatherIcons.home),
  _BottomBar(
    label: 'Search',
    path: AppRoutes.search,
    icon: FeatherIcons.search,
  ),
  _BottomBar(
    label: 'Notification',
    path: AppRoutes.notification,
    icon: FeatherIcons.bell,
  ),
  _BottomBar(
    label: 'Profile',
    path: AppRoutes.profile,
    icon: FeatherIcons.user,
  ),
];

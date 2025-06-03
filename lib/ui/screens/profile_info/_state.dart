part of 'profile_info.dart';

class _ScreenState extends ChangeNotifier {
  _ScreenState({required Map<String, dynamic> args}) {
    userId = args['userId'] as String?;

    // user = args['user'] as UserData;
  }
  // ignore: unused_element
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);
  bool postsFetched = false;
  String? userId;
  UserData? user;
  void setUser(UserData user) {
    this.user = user;

    notifyListeners();
  }
}

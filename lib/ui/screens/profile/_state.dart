part of 'profile.dart';

class _ScreenState extends ChangeNotifier {
  // ignore: unused_element
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);
  final formKey = GlobalKey<FormBuilderState>();

  late TabController tabController;
  bool postsFetched = false;
}

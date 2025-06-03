part of 'login.dart';

class _ScreenState extends ChangeNotifier {
  // ignore: unused_element
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
}

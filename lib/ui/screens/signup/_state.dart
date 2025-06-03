// lib/ui/screens/signup/_state.dart
part of 'signup.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
}

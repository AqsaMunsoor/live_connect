part of 'home.dart';

class _ScreenState extends ChangeNotifier {
  // ignore: unused_element
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final formKey = GlobalKey<FormBuilderState>();

  final TextEditingController commentTextController = TextEditingController();
  final GlobalKey<FormState> commentFormKey = GlobalKey<FormState>();
}

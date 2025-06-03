// lib/services/session_manager.dart
import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static double opacity = 1.0;
  static bool firstVisit = true;

  static const String _opcKey = 'OPC_KEY';
  static const String _firKey = 'FIR_KEY';

  static late SharedPreferences ins;

  static Future<void> init() async {
    ins = await SharedPreferences.getInstance();
    opacity = ins.getDouble(_opcKey) ?? 1.0;
    firstVisit = ins.getBool(_firKey) ?? true;
  }

  static void setFirstVisit() {
    firstVisit = false;
    ins.setBool(_firKey, firstVisit);
  }
}

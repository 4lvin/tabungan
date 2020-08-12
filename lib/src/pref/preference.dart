import 'package:shared_preferences/shared_preferences.dart';

Future setNama(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("nama", value);
}
Future getNama() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("nama");
}
Future rmvTNama() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("nama");
}
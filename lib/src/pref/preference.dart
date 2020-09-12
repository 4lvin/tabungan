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

Future setUrl(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("url", value);
}
Future getUrl() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("url");
}
Future rmvUrl() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("url");
}

Future setId(String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString("id", value);
}
Future getId() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString("id");
}
Future rmvId() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.remove("id");
}
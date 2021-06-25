import 'package:shared_preferences/shared_preferences.dart';

Future<void> setClientID(String clientID) async {
  var prefs = await SharedPreferences.getInstance();
  await prefs.setString('clientID', clientID);
}

Future<String> getClientID() async {
  var prefs = await SharedPreferences.getInstance();
  String clientID;
  clientID = (prefs.getString('clientID') ?? "");

  return clientID;
}

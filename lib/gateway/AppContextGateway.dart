import 'package:shared_preferences/shared_preferences.dart';

class AppContextGateway {
  final String _USER_ID_KEY = "user_id_key";

  Future<SharedPreferences> get _sharedPreferences async {
    return await SharedPreferences.getInstance();
  }

  Future<String> getUserId() async {
    var preferences = await _sharedPreferences;
    return preferences.containsKey(_USER_ID_KEY) ? preferences.getString(_USER_ID_KEY) : null;
  }

  Future<bool> setUserId(String userId) async {
    var preferences = await _sharedPreferences;
    return preferences.setString(_USER_ID_KEY, userId);
  }

  cleanUserId() async {
    var preferences = await _sharedPreferences;
    preferences.remove(_USER_ID_KEY);
  }
}

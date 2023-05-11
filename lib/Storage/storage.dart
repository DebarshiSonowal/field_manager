import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._();

  static final LocalStorage instance = LocalStorage._();
  late SharedPreferences sharedPreferences;

  Future<void> initializeStorage() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setUser(String token) async {
    print('set token ${token}');
    await sharedPreferences.setString("token", token);
    await sharedPreferences.setBool("isLoggedIn", true);
  }

  get filters => sharedPreferences.getString("filter") ?? "";
  get token => sharedPreferences.getString("token") ?? "";

  // void logout() {}
  Future<void> logout() async {
    await sharedPreferences.clear();
  }
}

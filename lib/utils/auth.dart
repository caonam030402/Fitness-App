import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static String? token = '';
  Future<String?> getTokenFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('x-auth-token');
    return accessToken;
  }

  //  return SharedPreferences.getInstance().then((prefs) {
  //     return prefs.getString('x-auth-token');
  //   });

  clearSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('x-auth-token');
    token = '';
  }
}

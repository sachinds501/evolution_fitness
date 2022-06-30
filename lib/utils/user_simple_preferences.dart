import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;

  static const _keyFname = 'fname';
  static const _keyLname = 'lname';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUsername(String fname) async {
    await _preferences!.setString(_keyFname, fname);
  }

  static Future setLname(String lname) async {
    await _preferences!.setString(_keyLname, lname);
  }

  static String? getUsername() => _preferences!.getString(_keyFname);

  static String? getLname() => _preferences!.getString(_keyLname);
}

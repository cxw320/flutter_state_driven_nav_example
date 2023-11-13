import 'package:flutter_global_app/shared_pref/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefImpl extends SharedPref {
  // final sharedPrefs;

  @override
  Future<bool> isFirstAppLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isFirstAppLaunch") ?? true;
  }

  // final _sharedPrefs = SharedPreferences.getInstance();
  // late bool _isFirstAppLaunch;

  // SharedPrefImpl() {
  //   _checkIsFirstAppLaunch().then((value) => _isFirstAppLaunch = value);
  // }

  // Future<bool> _checkIsFirstAppLaunch() async {
  //   final prefs = await _sharedPrefs;
  //   return prefs.getBool("isFirstAppLaunch") ?? true;
  // }

  // @override
  // bool get isFirstAppLaunch => _isFirstAppLaunch;

  // @override
  // updateIsFirstAppLaunch() => _isFirstAppLaunch = false;
}

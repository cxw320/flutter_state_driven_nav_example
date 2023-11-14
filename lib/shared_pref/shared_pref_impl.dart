import 'package:flutter_global_app/shared_pref/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefImpl extends SharedPref {
  late SharedPreferences _sharedPrefs;

  // SharedPrefImpl() {
  //   sharedPrefs = SharedPreferences.getInstance();
  // }

  @override
  Future<bool> isFirstAppLaunch() async {
    _sharedPrefs = await SharedPreferences.getInstance();
    return _sharedPrefs.getBool("isFirstAppLaunch") ?? true;
  }

  // final _sharedPrefs = SharedPreferences.getInstance();
  // late bool _isFirstAppLaunch;

  // SharedPrefImpl() {
  //   SharedPreferences.getInstance().then((value) => _sharedPrefs = value);
  // }

  // Future<bool> _checkIsFirstAppLaunch() async {
  //   final prefs = await _sharedPrefs;
  //   return prefs.getBool("isFirstAppLaunch") ?? true;
  // }

  // @override
  // bool get isFirstAppLaunch => _isFirstAppLaunch;

  @override
  updateIsFirstAppLaunch() {
    SharedPreferences.getInstance()
        .then((value) => value.setBool("isFirstAppLaunch", false));
  }
}


import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'providers.g.dart';

@riverpod
Future<SharedPreferences> fetchSharedPref(FetchSharedPrefRef ref) async {
  return SharedPreferences.getInstance();
}

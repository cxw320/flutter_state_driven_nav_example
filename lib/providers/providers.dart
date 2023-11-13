import 'package:flutter_global_app/shared_pref/shared_pref_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
SharedPrefImpl sharedPref(SharedPrefRef ref) {
  return SharedPrefImpl();
}

import 'package:flutter_global_app/my_app_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_app_state_notifier.g.dart';

@riverpod
class MyAppNotifier extends _$MyAppNotifier {
  @override
  MyAppState build() => MyAppState(true);
}

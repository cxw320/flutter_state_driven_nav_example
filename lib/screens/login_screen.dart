import 'package:flutter/material.dart';
import 'package:flutter_global_app/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(fetchSharedPrefProvider);
    switch (config) {
      case AsyncError(:final error):
        print(error.toString());
      case AsyncData(:final value):
        value.setBool("isFirstAppLaunch", false);
    }
    print(config.value?.getBool("isFirstAppLaunch"));
    return const Scaffold(body: Center(child: Text('Login')));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_global_app/providers/providers.dart';
import 'package:flutter_global_app/screens/login_screen.dart';
import 'package:flutter_global_app/screens/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late final GoRouter _goRouter;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final config = ref.watch(fetchSharedPrefProvider);
    print(config.value?.getBool("isFirstAppLaunch") ?? true);
    return switch (config) {
      AsyncError(:final error) => Text('Error: $error'),
      AsyncData(:final value) =>
        getMaterialApp(value.getBool("isFirstAppLaunch") ?? true),
      _ => const CircularProgressIndicator(),
    };
  }

  MaterialApp getMaterialApp(bool isFirstAppLaunch) {
    _goRouter = GoRouter(
      initialLocation: '/init',
      routes: [
        GoRoute(
            name: 'init',
            path: '/init',
            redirect: (context, state) {
              if (isFirstAppLaunch == true) {
                return "/splash";
              } else {
                return "/login";
              }
            }),
        GoRoute(
          name: 'splash',
          path: '/splash',
          builder: (BuildContext context, GoRouterState state) {
            return const SplashScreen();
          },
        ),
        GoRoute(
          name: 'login',
          path: '/login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
      ],
    );

    return MaterialApp.router(routerConfig: _goRouter);
  }
}

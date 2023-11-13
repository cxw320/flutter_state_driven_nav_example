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

    _goRouter = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          name: 'splash',
          path: '/',
          redirect: (context, state) {
            ref.watch(sharedPrefProvider).isFirstAppLaunch().then((value) {
              if (value == true) {
                return "/";
              } else {
                return "/home";
              }
            });
            return "/";
          },
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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MaterialApp.router(routerConfig: _goRouter));
  }
}

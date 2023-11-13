import 'package:flutter/material.dart';
import 'package:flutter_global_app/my_app_state_notifier.dart';
import 'package:flutter_global_app/screens/home_screen.dart';
import 'package:flutter_global_app/screens/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(Object context, WidgetRef ref) {
    final isFirstAppLaunch = ref.watch(myAppNotifierProvider).isFirstAppLaunch;

    return MaterialApp(
        home: MaterialApp.router(
            routerConfig: navigationRouterFactory(isFirstAppLaunch)));
  }
}

GoRouter navigationRouterFactory(bool isFirstAppLaunch) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'splash',
        path: '/',
        redirect: (context, state) {
          if (isFirstAppLaunch) {
            return "/";
          } else {
            return "/home";
          }
        },
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
    ],
  );
}


// final GoRouter navigationRouter = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(
//       name: 'splash',
//       path: '/',
//       redirect: (context, state){
//         if(isFirstAppLaunch){

//         }
//       };
//       builder: (BuildContext context, GoRouterState state) {
//         return const SplashScreen();
//       },
//     ),
//     GoRoute(
//       name: 'home',
//       path: '/home',
//       builder: (BuildContext context, GoRouterState state) {
//         return const HomeScreen();
//       },
//     ),
//   ],
// );

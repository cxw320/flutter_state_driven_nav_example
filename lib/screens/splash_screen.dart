import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  delay() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/login');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    delay();
    return const Scaffold(body: Center(child: Text('Splash')));
  }
}

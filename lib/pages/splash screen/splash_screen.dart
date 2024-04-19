import 'package:counter_app/pages/home.dart';
import 'package:counter_app/providers/app_theme_provider.dart';
import 'package:counter_app/responsive/responsive.dart';
import 'package:counter_app/utilities/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    return Scaffold(
      backgroundColor: themeMode == ThemeMode.light
          ? Colors.grey[100]
          : const Color(0xFF0B0B0B),
      body: Center(
        child: Image.asset(
          C.splashImage(ref),
          height: R.sh(180, context),
        ),
      ),
    );
  }
}

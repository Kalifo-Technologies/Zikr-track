import 'package:counter_app/main.dart';
import 'package:counter_app/providers/app_theme_provider.dart';
import 'package:counter_app/responsive/responsive.dart';
import 'package:counter_app/services/shared%20services/shared_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppearancePage extends ConsumerWidget {
  const AppearancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    Color colour =
        themeMode == ThemeMode.dark ? Colors.white70 : Colors.black87;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          "Appearance",
          style: TextStyle(
            fontSize: R.sh(34, context),
            fontWeight: FontWeight.bold,
            color: themeMode == ThemeMode.dark ? Colors.white70 : Colors.black,
          ),
        ),
      ),
      body: SwitchListTile(
        thumbColor: MaterialStateProperty.all(Colors.white),
        secondary: Icon(
          themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
          size: 26,
          color: colour,
        ),
        title: Text(
          'App Theme',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: colour,
          ),
        ),
        subtitle:
            Text(themeMode == ThemeMode.dark ? 'Dark theme' : 'Light theme'),
        value: themeMode == ThemeMode.dark ? true : false,
        onChanged: (value) async {
          if (value) {
            ref.read(themeModeProvider.notifier).state = ThemeMode.dark;
            sharedPreferences!.setBool(keyMode, true);
          } else {
            ref.read(themeModeProvider.notifier).state = ThemeMode.light;
            sharedPreferences!.setBool(keyMode, false);
          }
        },
      ),
    );
  }
}

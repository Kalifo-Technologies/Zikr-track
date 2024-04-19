import 'package:counter_app/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class C {
  static Color textColor(WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    var textColor =
        themeMode == ThemeMode.light ? Colors.black : Colors.grey[400];
    return textColor!;
  }

  static Color tileColor(WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    var tileColor =
        themeMode == ThemeMode.light ? Colors.white : Colors.grey[900];
    return tileColor!;
  }

  static Color tileBorderColor(WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    var tileBorderColor =
        themeMode == ThemeMode.dark ? Colors.grey[800]! : Colors.grey[350]!;
    return tileBorderColor;
  }

  static Color buttonColor(WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    var buttonColor = themeMode == ThemeMode.light
        ? const Color(0xFF7AE3DC)
        : const Color(0xFF80C5C0);
    return buttonColor;
  }

  static Color iconBGColor(WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    var iconBGColor =
        themeMode == ThemeMode.light ? Colors.grey[300] : Colors.grey[900];
    return iconBGColor!;
  }

  static Color bottomSheetColor(WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    var bottomSheetColor = themeMode == ThemeMode.light
        ? Colors.grey[100]
        : const Color(0xF4070707);
    return bottomSheetColor!;
  }

  static Color bgColor(WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    var bgColor = themeMode == ThemeMode.light
        ? Colors.grey[100]
        : const Color(0xF4000000);
    return bgColor!;
  }

  static String splashImage(WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    var splashImage = themeMode == ThemeMode.dark
        ? "assets/images/Zikr Track-03.png"
        : "assets/images/Zikr Track-02.png";
    return splashImage;
  }
}

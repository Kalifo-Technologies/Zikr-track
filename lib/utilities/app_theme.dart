import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    background: Color(0xfff5f5f5),
    onBackground: Color(0xFF160000),
    primary: Color(0xFF80C5C0),
    onPrimary: Colors.white,
    secondary: Colors.black,
    onSecondary: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    brightness: Brightness.light,
    error: Color(0xffb00020),
    onError: Colors.white,
    outline: Color(0xff801515),
    primaryContainer: Color(0x6CD09C00),
    onPrimaryContainer: Colors.white,
  ),
  fontFamily: 'Poppins',
);

class AppTheme {
  AppTheme._();
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7AE3DC)),
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.grey[100],
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF7AE3DC),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.black54,
      ),
      color: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.black,
      ),
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
      ),
    ),
    listTileTheme: const ListTileThemeData(
      titleTextStyle: TextStyle(
        color: Colors.black,
      ),
    ),
    fontFamily: 'Poppins',
  );
  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF80C5C0)),
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xF4000000),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF80C5C0),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white70,
      ),
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: Colors.grey[400],
      ),
    ),
    dialogTheme: DialogTheme(
      surfaceTintColor: Colors.black,
      backgroundColor: Colors.grey[900],
      titleTextStyle: const TextStyle(
        color: Colors.white70,
      ),
    ),
    listTileTheme: const ListTileThemeData(
      titleTextStyle: TextStyle(
        color: Colors.white,
      ),
      textColor: Colors.white70,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.grey[900],
      surfaceTintColor: Colors.grey[900],
    ),
    fontFamily: 'Poppins',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade900,
      ),
    ),
  );
}

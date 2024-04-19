import 'package:counter_app/constants.dart/goal_constants.dart';
import 'package:counter_app/models/goal_model.dart';
import 'package:counter_app/pages/splash%20screen/splash_screen.dart';
import 'package:counter_app/providers/app_theme_provider.dart';
import 'package:counter_app/services/shared%20services/shared_services.dart';
import 'package:counter_app/utilities/app_theme.dart';
import 'package:counter_app/utilities/hive_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;
List<GoalModel> myGoals = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(GoalModelAdapter());
  await Hive.openBox<GoalModel>(goalsHiveBox);
  initializeSharedPreferences().then((value) {
    runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );
  });
}

Future<void> initializeSharedPreferences() async {
  sharedPreferences = await SharedPreferences.getInstance();
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    getAppTheme();
    getHiveData();
    getLastDhikr();
  }

  @override
  void dispose() {
    super.dispose();
    Hive.close();
  }

  void getHiveData() {
    setState(() {
      myGoals = GoalFuncions().getAllGoals();
    });
  }

  void getLastDhikr() async {
    sharedPreferences!.getString(lastSelectedTasbihName);
    sharedPreferences!.getInt(lastSelectedCount);
    sharedPreferences!.getInt(lastSelectedTarget);
    sharedPreferences!.getString(lastSelectedNote);
  }

  void getAppTheme() async {
    var isDarkTheme = sharedPreferences!.getBool(keyMode);
    if (isDarkTheme != null) {
      if (isDarkTheme) {
        ref.read(themeModeProvider.notifier).state = ThemeMode.dark;
      } else {
        ref.read(themeModeProvider.notifier).state = ThemeMode.light;
      }
    } else {
      ref.read(themeModeProvider.notifier).state = ThemeMode.light;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZikrTrack: Dhikr Counter',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: const SplashScreen(),
    );
  }
}

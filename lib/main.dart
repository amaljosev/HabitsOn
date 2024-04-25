import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/model/analyse_models/analyse_model.dart';
import 'package:habitson/model/habit_models/habit_model.dart';
import 'package:habitson/view/home_screen.dart';
import 'package:habitson/view/screens/start_default_habit.dart';
import 'package:habitson/view/screens/started_habit_screen.dart';
import 'package:habitson/view/screens/timer_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'view/screens/statistics_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(HabitModelAdapter().typeId)) {
    Hive.registerAdapter(HabitModelAdapter());
  }
  if (!Hive.isAdapterRegistered(AnalyseModelAdapter().typeId)) {
    Hive.registerAdapter(AnalyseModelAdapter());
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HabitsOn',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (context) => const ScreenHome(),
        'started_habit': (context) => const ScreenStartedHabit(),
        'start_default_habit': (context) => const ScreenStartDefaultHabit(),
        'timer': (context) => const ScreenTimer(),
        'statistics': (context) => const ScreenStatistics(),
      },
      initialRoute: 'home',
    );
  }
}

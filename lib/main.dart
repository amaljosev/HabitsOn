import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:habitson/model/analyse_models/analyse_model.dart';
import 'package:habitson/model/habit_models/habit_model.dart';
import 'package:habitson/view/screens/boarding/splash_screen.dart';
import 'package:habitson/view/screens/home_screen.dart';
import 'package:habitson/view/screens/forms/start_default_habit.dart';
import 'package:habitson/view/screens/habit/started_habit_screen.dart';
import 'package:habitson/view/screens/habit/timer_screen.dart';
import 'package:habitson/view/screens/me/help_screen.dart';
import 'package:habitson/view/screens/me/privacy_policy_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'model/graph_models/graph_model.dart';
import 'view/screens/boarding/boarding_screens.dart';
import 'view/screens/habit/statistics_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(HabitModelAdapter().typeId)) {
    Hive.registerAdapter(HabitModelAdapter());
  }
  if (!Hive.isAdapterRegistered(AnalyseModelAdapter().typeId)) {
    Hive.registerAdapter(AnalyseModelAdapter());
  }
  if (!Hive.isAdapterRegistered(GraphModelAdapter().typeId)) {
    Hive.registerAdapter(GraphModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
          title: 'HabitsOn',
          theme: ThemeData(
            brightness: Brightness.dark, 
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const ScreenSplash(),
            'boarding': (context) => const ScreenBoarding(),
            'home': (context) => const ScreenHome(),
            'started_habit': (context) => const ScreenStartedHabit(),
            'start_default_habit': (context) => const ScreenStartDefaultHabit(),
            'timer': (context) => const ScreenTimer(),
            'statistics': (context) => const ScreenStatistics(),
            'help': (context) => const ScreenHelp(),
            'privacy': (context) => const ScreenPrivacyPolicy(),
          },
          initialRoute: '/',
        ),
      );
}

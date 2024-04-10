import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/view/home_screen.dart';

void main() {
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
      },
      initialRoute: 'home',
    );
  }
}

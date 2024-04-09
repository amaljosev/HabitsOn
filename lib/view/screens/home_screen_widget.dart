import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/home_controller.dart';

final homeCtrl = Get.put(HomeController());

class ScreenHomeWidget extends StatelessWidget {
  const ScreenHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container());
  }
}

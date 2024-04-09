import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewHabitsController extends GetxController {
  final habitNameCtrl = TextEditingController();
  final targetCtrl = TextEditingController();
  RxString counterWeelValue=''.obs;
   RxString categoryWeelValue=''.obs;

  Map<String, RxBool> weekDayss = {
    'MON': true.obs,
    'TUE': true.obs,
    'WED': true.obs,
    'THU': true.obs,
    'FRI': true.obs,
    'SAT': true.obs, 
    'SUN': true.obs
  };
}

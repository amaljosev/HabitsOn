import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewHabitsController extends GetxController {
  final habitNameCtrl = TextEditingController();
  final targetCtrl = TextEditingController();
  RxString counterWeelValue = ''.obs;
  RxString categoryWeelValue = ''.obs;

  Map<String, RxBool> weekDays = {
    'MON': true.obs,
    'TUE': true.obs,
    'WED': true.obs,
    'THU': true.obs,
    'FRI': true.obs,
    'SAT': true.obs,
    'SUN': true.obs
  };
  Map<String, RxBool> doItAt = {
    'Any Time':true.obs, 
    'Morning': false.obs,
    'Noon': false.obs,
    'Evening': false.obs
  };
}

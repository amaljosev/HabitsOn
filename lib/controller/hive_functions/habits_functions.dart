import 'dart:developer';

import 'package:get/get.dart';
import 'package:habitson/controller/new_habits_controller.dart';
import 'package:habitson/model/habit_models/habit_model.dart';
import 'package:hive/hive.dart';

final habitCtrl = Get.find<NewHabitsController>();
Future<bool> addHabit(HabitModel value) async {
  bool response = false;
  try {
    final habitsDB = await Hive.openBox<HabitModel>('habits_db');
    habitsDB.put(value.id, value);
    response = await getallDatas();
    return response;
  } catch (e) {
    return false;
  }
}

Future<bool> getallDatas() async {
  log('refreshed'); 
  try {
    final habitsDB = await Hive.openBox<HabitModel>('habits_db');
    habitCtrl.habitsList.clear();
    habitCtrl.habitsList.addAll(habitsDB.values);
    return true;
  } catch (e) {
    return false;
  }
}

Future<void> deleteData(int id) async {
  final habitsDB = await Hive.openBox<HabitModel>('habits_db');
  await habitsDB.deleteAt(id);
  getallDatas();
}

Future<void> updateList(int id, HabitModel value) async {
  final habitsDB = await Hive.openBox<HabitModel>('habits_db');
  habitsDB.putAt(id, value);
  getallDatas();
}

Future<int> calculateTotalHabitsStarted() async {
  final habitsDB = await Hive.openBox<HabitModel>('habits_db');
  return habitsDB.length;
}

Future<void> clearDatabase() async {
  final habitsDB = await Hive.openBox<HabitModel>('habits_db');
  await habitsDB.clear();
  getallDatas();
}

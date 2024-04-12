import 'package:get/get.dart';
import 'package:habitson/controller/habit_operations.dart';
import 'package:habitson/model/analyse_models/analyse_model.dart';
import 'package:hive/hive.dart';

final analyseCtrl = Get.find<HabitOperationsController>();
Future<bool> addToAnalyse(AnalyseModel value) async {
  bool response = false;
  try {
    final analyseDb = await Hive.openBox<AnalyseModel>('analyse_db');
    analyseDb.put(value.id, value);
    response = await getAllAnalyseDatas();
    return response;
  } catch (e) {
    return false;
  }
}

Future<bool> getAllAnalyseDatas() async {
  try {
    final analyseDb = await Hive.openBox<AnalyseModel>('analyse_db');
    analyseCtrl.analyseList.clear();
    analyseCtrl.analyseList.addAll(analyseDb.values);
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> deleteAnalyseData(int id) async {
  try {
    final analyseDb = await Hive.openBox<AnalyseModel>('analyse_db');
    await analyseDb.deleteAt(id);
    getAllAnalyseDatas();
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> updateAnalyseList(int id, AnalyseModel value) async {
  try {
    final analyseDb = await Hive.openBox<AnalyseModel>('analyse_db');
    analyseDb.putAt(id, value);
    getAllAnalyseDatas();
    return true;
  } catch (e) {
    return false;
  }
}

Future<int> calculateTotalAnalyseDatas() async {
  final analyseDb = await Hive.openBox<AnalyseModel>('analyse_db');
  return analyseDb.length;
}

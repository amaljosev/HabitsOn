import 'package:get/get.dart';
import 'package:habitson/controller/chart_controller.dart';
import 'package:hive/hive.dart';

import '../../model/graph_models/graph_model.dart';

final graphCtrl = Get.find<ChartController>();
Future<bool> addTograph(GraphModel value) async {
  try {
    final graphDb = await Hive.openBox<GraphModel>('graph_db');
    graphDb.add(value);
    getAllgraphDatas();
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> getAllgraphDatas() async {
  try {
    final graphDb = await Hive.openBox<GraphModel>('graph_db');
    graphCtrl.graphList.clear();
    graphCtrl.graphList.addAll(graphDb.values);
    graphCtrl.setGraph();

    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> updategraphList(GraphModel value) async {
  try {
    final graphDb = await Hive.openBox<GraphModel>('graph_db');
    graphDb.putAt(0, value);
    getAllgraphDatas();

    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> resetGraph() async {
  try {
    final graphDb = await Hive.openBox<GraphModel>('graph_db');
    final data = GraphModel(
        id: DateTime.now(),
        sundayCount: 0.0,
        mondayCount: 0.0,
        tuesdayCount: 0.0,
        wednesdayCount: 0.0,
        thursdayCount: 0.0,
        fridayCount: 0.0,
        saturdayCount: 0.0);
    graphDb.putAt(0, data);
    getAllgraphDatas();

    return true;
  } catch (e) {
    return false;
  }
}

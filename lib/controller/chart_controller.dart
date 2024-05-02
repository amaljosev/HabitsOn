import 'package:get/get.dart';

import '../model/graph_models/graph_model.dart';

class ChartController extends GetxController {
  RxList<GraphModel> graphList = <GraphModel>[].obs;
  RxList<RxDouble> weekChart = [
    0.0.obs,
    0.0.obs,
    0.0.obs,
    0.0.obs,
    0.0.obs,
    0.0.obs,
    0.0.obs,
  ].obs;
  setGraph() {
    weekChart[0].value = graphList.first.sundayCount;
    weekChart[1].value = graphList.first.mondayCount;
    weekChart[2].value = graphList.first.tuesdayCount;
    weekChart[3].value = graphList.first.wednesdayCount;
    weekChart[4].value = graphList.first.thursdayCount;
    weekChart[5].value = graphList.first.fridayCount;
    weekChart[6].value = graphList.first.saturdayCount;
  }
}

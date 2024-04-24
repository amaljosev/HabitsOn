
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:get/get.dart';

class ActivitiesController extends GetxController {
  RxInt duration = 60.obs;
  RxInt initialDuration = 0.obs;
  RxBool isRunning = false.obs;
  RxBool isPause = false.obs;
  RxBool isStopWatch=true.obs; 
  RxInt stopwatchDuration=86400.obs;
  final CountDownController controller = CountDownController();

  resetTimer() {
    duration.value = 60;
    initialDuration.value = 0;
    isRunning.value = false;
    isPause.value = false;
    isStopWatch.value=false;
  }
}

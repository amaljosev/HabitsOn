import 'package:get/get.dart';
import 'package:habitson/model/graph_models/individual_bar.dart';

class BarData {
  final RxDouble sundayValue;
  final RxDouble mondayValue;
  final RxDouble tuesdayValue;
  final RxDouble wednesdayValue;
  final RxDouble thursdayValue;
  final RxDouble fridayValue;
  final RxDouble saturdayValue;

  BarData(
      {required this.sundayValue,
      required this.mondayValue,
      required this.tuesdayValue,
      required this.wednesdayValue,
      required this.thursdayValue,
      required this.fridayValue,
      required this.saturdayValue});
  List<IndividualBar> barData = [];
  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: sundayValue.value),
      IndividualBar(x: 1, y: mondayValue.value),
      IndividualBar(x: 2, y: tuesdayValue.value),
      IndividualBar(x: 3, y: wednesdayValue.value),
      IndividualBar(x: 4, y: thursdayValue.value),
      IndividualBar(x: 5, y: fridayValue.value),
      IndividualBar(x: 6, y: saturdayValue.value),
    ];
  }
}

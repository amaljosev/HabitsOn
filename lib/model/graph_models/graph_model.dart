import 'package:hive/hive.dart';
part 'graph_model.g.dart'; 

@HiveType(typeId: 3)
class GraphModel {
  @HiveField(0)
  final DateTime id;
  @HiveField(1)
  final double sundayCount;
  @HiveField(2)
  final double mondayCount; 
  @HiveField(3)
  final double tuesdayCount;
  @HiveField(4)
  final double wednesdayCount;
  @HiveField(5)
  final double thursdayCount;
  @HiveField(6)
  final double fridayCount;
  @HiveField(7)
  final double saturdayCount;

  GraphModel(
      {required this.id,
      required this.sundayCount,
      required this.mondayCount,
      required this.tuesdayCount,
      required this.wednesdayCount,
      required this.thursdayCount,
      required this.fridayCount,
      required this.saturdayCount});
}

import 'package:hive/hive.dart';
part 'habit_model.g.dart';

@HiveType(typeId: 1)
class HabitModel {
  @HiveField(0) 
  final String id;
  @HiveField(1)
  final String habitName;
  @HiveField(2)
  final int duration;
  @HiveField(3)
  final List<String> selectedDays; 
  @HiveField(4)
  final String goalCount;
  @HiveField(5)
  final String goalName;
  @HiveField(6)
  final int doItAt;
  @HiveField(7)
  final int streak;
  @HiveField(8)
  final DateTime startedDate;
  @HiveField(9)
  final DateTime latestDate;
  @HiveField(10)
  final bool isComplete;
  @HiveField(11)
  final int backgroundColorIndex;

  HabitModel(
      {required this.id, 
      required this.habitName,
      required this.duration,
      required this.selectedDays,
      required this.goalCount,
      required this.goalName,
      required this.doItAt,
      required this.streak,
      required this.startedDate,
      required this.latestDate,
      required this.isComplete,
      required this.backgroundColorIndex});
}
 
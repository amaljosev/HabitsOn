import 'package:hive/hive.dart';
part 'analyse_model.g.dart';

@HiveType(typeId: 2)
class AnalyseModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String habitName;
  @HiveField(2)
  final int targetDays;
  @HiveField(3)
  final int completedDays;
  @HiveField(4)
  final int targetCategory;
  @HiveField(5) 
  final int completedCategory;
  @HiveField(6)
  final int currentStreak;
  @HiveField(7)
  final int bestStreak;
  @HiveField(8)
  final bool isTodayTaskComplete;
  

  AnalyseModel(
      {required this.id,
      required this.habitName,
      required this.targetDays,
      required this.completedDays,
      required this.targetCategory,
      required this.completedCategory,
      required this.currentStreak,
      required this.bestStreak,
      required this.isTodayTaskComplete});
}

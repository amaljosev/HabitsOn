import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HabitCompletionDetailWidget extends StatelessWidget {
  const HabitCompletionDetailWidget({
    super.key,
    required this.size,
    required this.goalName,
    required this.completedData,
    required this.target,
    required this.finishedOrStreak,
    required this.targetOrStreak,
  });

  final Size size;

  final String goalName;
  final String finishedOrStreak;
  final String completedData;
  final String targetOrStreak;
  final String target;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              goalName,
              style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),
            ),
            Text(
              finishedOrStreak,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.width * 0.05),
            ),
            Text(
              completedData,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.width * 0.10),
            ),
            Row(
              children: [
                Text(
                  targetOrStreak,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  " :  $target",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

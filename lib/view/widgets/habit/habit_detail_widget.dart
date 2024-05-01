import 'package:flutter/material.dart';

import '../../core/constants.dart'; 

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
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.27,
      decoration: BoxDecoration(
          color: primaryColor.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              goalName,
              style: const TextStyle(fontWeight: FontWeight.bold),
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

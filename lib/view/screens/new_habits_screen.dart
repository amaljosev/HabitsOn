import 'package:flutter/material.dart';
import 'package:habitson/view/core/constants.dart';

class ScreenNewHabits extends StatelessWidget {
  const ScreenNewHabits({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          kHeight,
           Text(
            'Start your Habit',
            style: titleStyle,
          ),
          kHeight,
          const Text('Enter Habit Name'),
          TextFormField(),
          const Text('Enter Target Days'),
          TextFormField(),
          const Text('Select Days'),
          const Row(
            children: [CircleAvatar()],
          ),
          Row(
            children: [
              const Text('Set Counter'),
              IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline))
            ],
          ),
        ],
      ),
    );
  }
}

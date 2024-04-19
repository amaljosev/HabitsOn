import 'package:flutter/material.dart';

import 'package:habitson/view/widgets/my_bar_graph.dart';

class ScreenAnalyse extends StatelessWidget {
  const ScreenAnalyse({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 100,
        ),
        SizedBox(height: 200, child: MyBarGraph()),
        SizedBox(
          height: 200,
        ),
      ],
    );
  }
}

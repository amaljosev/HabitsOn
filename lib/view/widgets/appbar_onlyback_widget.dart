import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/controller/hive_functions/analyse_functions.dart';
import 'package:habitson/controller/hive_functions/habits_functions.dart';

class AppBarOnlyBack extends StatelessWidget {
  const AppBarOnlyBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Card(
              child: IconButton(
                  onPressed: () async {
                    await getallDatas().then((value) => getAllAnalyseDatas());
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back))),
        ],
      ),
    );
  }
}

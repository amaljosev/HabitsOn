
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back))),
        ],
      ),
    );
  }
}

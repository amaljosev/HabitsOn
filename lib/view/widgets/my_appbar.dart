import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HabitsAppBar extends StatelessWidget {
  const HabitsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back)),
          ),
          const Row(
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.edit),
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.menu),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
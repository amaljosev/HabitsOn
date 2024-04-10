import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/view/screens/new_habits_screen.dart';

import '../core/constants.dart';

class DoItAtWidget extends StatelessWidget {
  const DoItAtWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.07,
      child: ListView.builder(
        scrollDirection: Axis.horizontal, 
        itemBuilder: (context, index) => Obx(() => InkWell(
          onTap: () {
                habitCtrl.doItAt.values.toList()[index].value = 
                    !habitCtrl.doItAt.values.toList()[index].value;
              },
          child: Padding(
            padding: const EdgeInsets.all(5.0), 
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                  color: habitCtrl.doItAt.values.toList()[index].value
                      ? primaryColor
                      : Colors.grey,
                  borderRadius:
                      const BorderRadius.all(Radius.circular(10))),
              child: Center(
                  child: Text(
                habitCtrl.doItAt.keys.toList()[index],
                style: TextStyle(
                    color: habitCtrl.doItAt.values.toList()[index].value
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
        )),
        itemCount: habitCtrl.doItAt.keys.length,
      ),
    );
  }
}

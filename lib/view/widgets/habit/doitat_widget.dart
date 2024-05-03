import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitson/view/screens/forms/new_habits_screen.dart';

import '../../core/constants.dart'; 

class DoItAtWidget extends StatelessWidget {
  const DoItAtWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Obx(() => InkWell(
              onTap: () {
                habitCtrl.pickedDayTimeIndex.value =
                    index;  
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: habitCtrl.pickedDayTimeIndex.value==index 
                          ? primaryColor
                          : Colors.grey,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),  
                  child: Center(
                      child: Text(
                    habitCtrl.timingList[index],
                    style: TextStyle( 
                        color:  habitCtrl.pickedDayTimeIndex.value==index 
                            ? secondaryColor 
                            : Colors.black,
                        fontWeight: FontWeight.bold,fontSize: 15),
                  )),
                ),
              ),
            )),
        itemCount: habitCtrl.timingList.length, 
      ),
    );
  }
}

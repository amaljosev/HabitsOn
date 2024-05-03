import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitson/view/screens/home/home_screen_widget.dart';

import '../../core/constants.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 60.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(6).w,
          child: Obx(() => InkWell(
                onTap: () => habitCtrl.pickedColorIndex.value = index,
                child: CircleAvatar(
                  backgroundColor: secondaryColor,
                  child: CircleAvatar(
                    radius: 18.w, 
                    backgroundColor: habitCtrl.colors[index],
                    child: habitCtrl.pickedColorIndex.value == index
                        ? const Icon(Icons.check)
                        : null,
                  ),
                ),
              )),
        ),
        itemCount: habitCtrl.colors.length,
      ),
    );
  }
}

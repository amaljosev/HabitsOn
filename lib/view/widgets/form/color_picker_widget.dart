import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/view/screens/home/home_screen_widget.dart';

import '../../core/constants.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(size.width * 0.015),
          child: Obx(() => InkWell(
            onTap: () => habitCtrl.pickedColorIndex.value=index,     
            child: CircleAvatar( 
              backgroundColor: secondaryColor,
              child: CircleAvatar( 
                radius: 18,
                backgroundColor: habitCtrl.colors[index], 
                child:habitCtrl.pickedColorIndex.value==index? const Icon(Icons.check):null,    
              ),
            ), 
          )),
        ),
        itemCount: habitCtrl.colors.length,
      ),
    );
  }
}
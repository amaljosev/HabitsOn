import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitson/view/core/constants.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h), 
            child: Row(
              children: [
                Text(
                  'About',
                  style: titleStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 8.0.h),
            child: Card(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     ListTile(
                      title: const Text('Privacy Policy'),
                      onTap: () => Get.toNamed('privacy'), 
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Help'),
                      onTap: () => Get.toNamed('help'),
                    ),
                    const Divider(),
                    const ListTile(
                      title: Text('Share App'),
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          const Text('VERSON : 1.0.0'),
          kHeight
        ],
      ),
    );
  }
}

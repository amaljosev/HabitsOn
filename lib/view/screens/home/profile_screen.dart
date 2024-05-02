import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/view/core/constants.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
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
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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

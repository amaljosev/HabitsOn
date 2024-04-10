import 'package:flutter/material.dart';
import 'package:habitson/view/core/constants.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Text(
                  'ME',
                  style: titleStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              height: size.height * 0.45,
              width: size.width,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ListTile(
                      title: Text('Total Habits Started'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Total Habits Completed'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Highest Streak'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Privacy Policy'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Settings'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          kHeight,
          const Text('VERSON : 1.0.0') 
        ],
      ),
    );

  }
}

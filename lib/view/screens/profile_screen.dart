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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Card(
              child:  Padding(
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
          const Spacer(),
          const Text('VERSON : 1.0.0'),
          kHeight
        ],
      ),
    );
  }
}

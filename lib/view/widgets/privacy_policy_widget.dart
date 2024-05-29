import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/constants.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            kHeight,
            Row(
              children: [
                Text(
                  'HabitsOn Privacy Policy',
                  style: GoogleFonts.comicNeue(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            kHeight,
            Row(
              children: [
                Expanded(
                  child: Text(
                    ''' Welcome to HabitsOn! This privacy policy explains how we (Amal Jose, the developer) collect, use, and store your data when you use the HabitsOn app. We understand the importance of protecting your privacy and are committed to doing so.''',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.gideonRoman(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            kHeight,
            Row(
              children: [
                Expanded(
                  child: Text(
                    '''What information does HabitsOn collect?''',
                    style: GoogleFonts.comicNeue(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            kHeight,
            Text(
              ''' HabitsOn does not collect any personal information about you. ''',
              style: GoogleFonts.gideonRoman(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            kHeight,
            Row(
              children: [
                Text(
                  'What data does HabitsOn store?',
                  style: GoogleFonts.comicNeue(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            kHeight,
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        ''' HabitsOn only stores app data on your local device. This includes information such as:''',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.gideonRoman(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                kHeight,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '● Habit names and descriptions: The names and descriptions of the habits you track.',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.gideonRoman(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                kHeight,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '● Habit completion history: Whether you completed or missed a habit for a specific date.',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.gideonRoman(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                kHeight,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '● Streak data: Your current streak for each habit.',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.gideonRoman(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            kHeight,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'How is data stored?',
                    style: GoogleFonts.comicNeue(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            kHeight,
            Text(
              '''All data is stored securely on your local device. We do not collect or store any data on our servers or share it with any third parties.''',
              textAlign: TextAlign.justify,
              style: GoogleFonts.gideonRoman(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            kHeight,
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Notifications',
                    style: GoogleFonts.comicNeue(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            kHeight,  
            Text(
              '''We have recently updated our app to include daily notifications. These notifications are designed to enhance your user experience by providing timely updates and relevant information. You have full control over these notifications and can choose to enable or disable them at any time through the settings menu within the app. Your privacy is important to us, and no personal information is collected or shared through these notifications.''',
              textAlign: TextAlign.justify,
              style: GoogleFonts.gideonRoman(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            kHeight,
            Row(
              children: [
                Text(
                  'Changes to This Privacy Policy',
                  style: GoogleFonts.comicNeue(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            kHeight,
            Text(
              '''I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.This policy is effective as of 2023-08-11''',
              textAlign: TextAlign.justify,
              style: GoogleFonts.gideonRoman(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            kHeight,
            Row(
              children: [
                Text(
                  'Contact Us',
                  style: GoogleFonts.comicNeue(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            kHeight,
            Text(
              '''If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at : amaljvattakkunnel@gmail.com''',
              textAlign: TextAlign.justify,
              style: GoogleFonts.gideonRoman(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            kHeight,
          ],
        ),
      ),
    );
  }
}

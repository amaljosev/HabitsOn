import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:habitson/view/screens/forms/new_habits_screen.dart';

import 'pages/page_one.dart';
import 'pages/page_two.dart';

class ScreenBoarding extends StatelessWidget {
  const ScreenBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          const PageOne(),
          const PageTwo(),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: Card(
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
                                  Text(
                                    ''' HabitsOn only stores app data on your local device. This includes information such as:''',
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.gideonRoman(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  kHeight,
                                  Text(
                                    '● Habit names and descriptions: The names and descriptions of the habits you track.',
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.gideonRoman(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  kHeight,
                                  Text(
                                    '● Habit completion history: Whether you completed or missed a habit for a specific date.',
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.gideonRoman(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  kHeight,
                                  Text(
                                    '● Streak data: Your current streak for each habit.',
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.gideonRoman(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
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
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          homeCtrl
                              .setLoginData() 
                              .then((value) => Get.toNamed('home'));
                        },
                        child: const Text('Agree and Continue'))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
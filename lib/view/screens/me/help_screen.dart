import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitson/view/core/constants.dart';
import 'package:habitson/view/widgets/appbar_onlyback_widget.dart';

class ScreenHelp extends StatelessWidget {
  const ScreenHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          kHeight,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const AppBarOnlyBack(), 
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Frequntly asked questions',
                    style: GoogleFonts.comicNeue(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                      child: ExpansionTile(
                        title: const Text(
                          'What is a habit tracker app?',
                        ),
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            width: double.infinity,
                            child: const Text(
                              "A habit tracker app is a tool designed to help you establish and maintain positive habits by allowing you to monitor your progress over time. It helps you stay accountable and motivated to reach your goals.",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: ExpansionTile(
                        title: const Text(
                          'How can i start a habit',
                        ),
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            width: double.infinity,
                            child: const Text(
                              "You can start habits from categories by selecting on it or you can create your own categories.",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: ExpansionTile(
                        title: const Text(
                          'Can I track multiple habits at once?',
                        ),
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            width: double.infinity,
                            child: const Text(
                              "Yes, you can track multiple habits simultaneously. You can create a list of habits you want to work on and monitor each one individually.",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: ExpansionTile(
                        title: const Text(
                          'How does the streak work?',
                        ),
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            width: double.infinity,
                            child: const Text(
                              "The streaks count how many consecutive days you completed all your habits.",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: ExpansionTile(
                        title: const Text(
                          'How can I visualize my progress?',
                        ),
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            width: double.infinity,
                            child: const Text(
                              "We added bar chart and percentage indicators These visualizations can help you see your achievements and identify patterns.",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: ExpansionTile(
                        title: const Text(
                          'How do check my habits as done or Undone?',
                        ),
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            width: double.infinity,
                            child: const Text(
                              "If you done the habit you can't do anything there buttons are disappear,If you want to done that task again you can edit the limit perday",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: ExpansionTile(
                        title: const Text(
                          'How can edit/delete my Lists?',
                        ),
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            width: double.infinity,
                            child: const Text(
                              "Go to your habit marking page and there top left you can see the edit option.",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';


class PageTwo extends StatelessWidget {
  const PageTwo({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/screen_2.webp"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 130,
            ),
            Text('Visualize your habits progress in charts',
                style: GoogleFonts.urbanist(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Enjoy your journey',
                    style: GoogleFonts.urbanist(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ],
            ),
            Spacer(),
            Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  height: 200.h,
                  width: 200.w,
                  child: Lottie.asset(
                      'assets/lottie/Animation - 1714743586965.json')),
            ],
          ),
          ],
        ));
  }
}

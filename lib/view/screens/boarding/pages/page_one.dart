import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/img/screen_1.webp"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Text('Welcome to HabitsOn',
              style: GoogleFonts.dangrek(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(
            height: 130,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Build the better you',
                  style: GoogleFonts.comicNeue(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Plan a habit for daily',
                  style: GoogleFonts.urbanist(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text('Track habits',
                  style: GoogleFonts.urbanist(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text('Build routines',
                  style: GoogleFonts.urbanist(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text('Accomplish goals',
                  style: GoogleFonts.urbanist(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text('Get your life in order',
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
      ),
    );
  }
}

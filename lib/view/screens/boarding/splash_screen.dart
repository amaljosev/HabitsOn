import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitson/controller/home_controller.dart';
import '../../core/constants.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(    
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(       
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/reload.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          kHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'Habits',
                    style: GoogleFonts.unbounded(
                      fontWeight: FontWeight.w800,  
                      fontSize: 30,
                    ),
                  ),
                 const Padding(
                    padding:  EdgeInsets.all(5.0),
                    child:  CircularProgressIndicator(color: Colors.white,),
                  ),
                  Text(
                    'n',
                    style: GoogleFonts.unbounded(
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}



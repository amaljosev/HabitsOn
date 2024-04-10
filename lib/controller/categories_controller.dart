import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitson/model/categories_model.dart';

class CategoriesController extends GetxController {
  
RxList<Categories> categoryList = [
  Categories(
      icon: const Icon(
        Icons.yard,
        color: Colors.green,
      ),
      title: 'Meditation'),
  Categories(
      icon: const Icon(
        Icons.menu_book_sharp,
        color: Colors.red,
      ),
      title: 'Reading'),
  Categories(
      icon: Icon(
        Icons.directions_walk,
        color: Colors.purple.shade300,
      ),
      title: 'Walking'),
  Categories(
      icon: const Icon(
        Icons.assignment,
        color: Colors.pink,
      ),
      title: 'Study'),
  Categories(
      icon: const Icon(
        Icons.fitness_center, 
        color: Colors.white,
      ),
      title: 'Workout'),
  Categories(
      icon: const Icon(
        Icons.draw,
        color: Colors.purple,
      ),
      title: 'Art'),
  Categories(
      icon: const Icon(
        Icons.water_drop_outlined,
        color: Colors.deepPurple,
      ),
      title: 'Drink Water'),
  Categories(
      icon: Icon(
        Icons.sports_soccer_outlined,
        color: Colors.yellow.shade800,
      ),
      title: 'Sports'),
  Categories(
      icon: const Icon(
        Icons.mobile_off_outlined,
        color: Colors.grey,
      ),
      title: 'Social'),
  Categories(
      icon: const Icon(
        Icons.cleaning_services_outlined,
        color: Colors.blue,
      ),
      title: 'Cleaning'),
  Categories(
      icon: const Icon(
        Icons.airline_seat_individual_suite,
        color: Colors.deepPurple,
      ),
      title: 'Sleep'),
  
  Categories(
      icon: const Icon(
        Icons.directions_run,
        color: Colors.greenAccent,
      ),
      title: 'Running'),
  Categories(
      icon: const Icon(
        Icons.pool,
        color: Colors.blueGrey,
      ),
      title: 'Swimming'),
  Categories(
      icon: const Icon(
        Icons.local_florist_outlined,
        color: Colors.orangeAccent,
      ),
      title: 'Gardening'),
  Categories(
      icon: const Icon(
        Icons.accessibility_new,
        color: Colors.orangeAccent,
      ),
      title: 'Yoga'),
  Categories(
      icon: const Icon(
        Icons.directions_bike,
        color: Colors.brown,
      ),
      title: 'cycling'),
  Categories(
      icon: const Icon(
        Icons.sports_gymnastics_sharp,
        color: Colors.blueAccent,
      ),
      title: 'Warm up'),
  Categories(
      icon: Icon(
        Icons.air,
        color: Colors.red.shade400,
      ),
      title: 'Practice breathing'),
  Categories(
      icon: Icon(
        Icons.border_color_rounded,
        color: Colors.green.shade700,
      ),
      title: 'Keep a journal'),
].obs;

}
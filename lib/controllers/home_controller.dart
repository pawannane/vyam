import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyam_2_final/models/home_model.dart';

class HomeController extends GetxController{
List boards  =[
  BoardInfo("assets/cards/50% off.png"),
  BoardInfo("assets/cards/yoga classes.png"),
];
List OptionsList = [
  OptionsInfo('assets/cards/gym.png'),
  OptionsInfo('assets/cards/zumba.png'),
  OptionsInfo('assets/cards/yoga.png'),
];
List GymLists = [
  ProductGym("assets/photos/gym.jpg", "Transfomer Gym", "Bus stand, Barakar", '4.7', '1'),
  ProductGym("assets/photos/gyms 2.jpg", "Fitness Fantasy", "Fitness Fantasy", '4.9', '2'),
  ProductGym("assets/photos/gyms 3.jfif", "GymX studios", "GymX studios", '4.9', '3.5'),
  ProductGym("assets/photos/gyms 4.jpeg", "GymX studios", "GymX studios", '4.7', '6'),
  ProductGym("assets/photos/gyms 5.jpg", "Transfomer Gym", "Bus stand, Barakar", '4.7', '7'),
];
}
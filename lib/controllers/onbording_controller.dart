import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:vyam_2_final/models/onboarding_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
class OnboardingController extends GetxController{
  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length-1;

  forwardAction() {
    if (isLastPage) {
      Get.offNamed("/login");
    } else {
      pageController.nextPage(
          duration: 300.milliseconds, curve: Curves.ease
      );
    }
  }
List onboardingPages = [
  OnbordingInfo(
      "assets/images/onboarding_1.png",
      "Find and book gyms"+" Online",
      "Lorem ipsum dolor sit amet consectetur adipiscing elit. Posuere orci integer feugiat vestibulum adipiscing."
  ),
  OnbordingInfo(
      "assets/images/onboarding2.png",
      "Hassle free instant Booking",
      "Lorem ipsum dolor sit amet consecrated adipiscing elit. Posuere orci integer feugiat vestibulum adipiscing."
  ),
  OnbordingInfo(
      "assets/images/onboarding_3.png",
      "Find best gyms Nearby",
      "Lorem ipsum dolor sit amet consectetur adipiscing elit. Posuere orci integer feugiat vestibulum adipiscing."
  )
];
}


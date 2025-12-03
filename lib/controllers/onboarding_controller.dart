import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnboardingController extends GetxController {
  void goToHome() {
    // fade then navigate
    Get.offAllNamed('/home');
  }
}

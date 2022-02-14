import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalSnacbar {
  void showError(String error, String errorMsg) {
    final snackBar = Get.snackbar(
      "",
      "",
      titleText:
          Text(error, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      messageText: Text(errorMsg,
          style:
              GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 12)),
      icon: const Icon(Icons.error, color: Colors.red),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey.shade300,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.black,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AuthController extends GetxController {
  var isLoggedIn = false.obs;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    // Logic for authentication
    if (usernameController.text == "Vinnie" && passwordController.text == "password") {
      isLoggedIn.value = true;
      Get.snackbar("Success", "Login successful", snackPosition: SnackPosition.BOTTOM);
      Get.offNamed('/home'); // Navigate to home on successful login
    } else {
      Get.snackbar("Error", "Invalid credentials", snackPosition: SnackPosition.BOTTOM);
    }
  }

  void logout() {
    isLoggedIn.value = false;
    Get.offAllNamed('/login'); // Navigate back to login screen on logout
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}


  void dispose() {}


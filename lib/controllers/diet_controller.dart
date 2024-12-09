import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DietController extends GetxController {
  var meals = <String>[].obs; // List of meal names
  final mealNameController = TextEditingController();

  void addMeal() {
    if (mealNameController.text.isNotEmpty) {
      meals.add(mealNameController.text);
      Get.snackbar("Meal Added", "Successfully added meal", snackPosition: SnackPosition.BOTTOM);
      mealNameController.clear();
    }
  }

  void removeMeal(int index) {
    meals.removeAt(index);
    Get.snackbar("Meal Removed", "Successfully removed meal", snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    mealNameController.dispose();
    super.onClose();
  }
}

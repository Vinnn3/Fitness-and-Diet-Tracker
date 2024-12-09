import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkoutController extends GetxController {
  var workouts = <String>[].obs; // List of workout names
  final workoutNameController = TextEditingController();

  void addWorkout() {
    if (workoutNameController.text.isNotEmpty) {
      workouts.add(workoutNameController.text);
      Get.snackbar("Workout Added", "Successfully added workout", snackPosition: SnackPosition.BOTTOM);
      workoutNameController.clear();
    }
  }

  void removeWorkout(int index) {
    workouts.removeAt(index);
    Get.snackbar("Workout Removed", "Successfully removed workout", snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    workoutNameController.dispose();
    super.onClose();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/assets/app_colors.dart';  

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
        centerTitle: true,
        foregroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Navigate back to login screen
              Get.offAllNamed('/login');  // Clears the stack and goes to login
            },
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "Your Achievements",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Milestones List
            Text(
              "Milestones Reached",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.star, color: AppColors.primary),
              title: Text("First 5 Workouts Completed"),
              subtitle: Text("You’ve completed your first 5 workouts. Great job!"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.star, color: AppColors.primary),
              title: Text("First 1000 Steps Achieved"),
              subtitle: Text("You’ve walked your first 1000 steps! Keep it up!"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.star, color: AppColors.primary),
              title: Text("Achieved Daily Goal for 7 Days"),
              subtitle: Text("You’ve met your daily goal for 7 consecutive days!"),
            ),
            SizedBox(height: 20),

            // Badges earned
            Text(
              "Badges Earned",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BadgeItem(
                  title: "Beginner",
                  description: "Earned for completing your first workout.",
                  icon: Icons.fitness_center_rounded,
                ),
                BadgeItem(
                  title: "Stepper",
                  description: "Earned for taking 5000 steps in a day.",
                  icon: Icons.directions_walk,
                ),
                BadgeItem(
                  title: "Consistency",
                  description: "Earned for exercising for 7 days in a row.",
                  icon: Icons.accessibility_new,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BadgeItem extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const BadgeItem({super.key, 
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Icon(icon, size: 40, color: AppColors.primary),
          const SizedBox(height: 8),
          Text(title, textAlign: TextAlign.center),
          Text(description, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}

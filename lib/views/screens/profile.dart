import 'package:flutter/material.dart';
import 'package:project/assets/app_colors.dart'; 

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        foregroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Picture and User Name
            _ProfileHeader(),

            const SizedBox(height: 24),

            // Personal Information
            const _ProfileSection(
              title: "Personal Information",
              children: [
                _ProfileInfoRow(label: "Name", value: "Vinnie"),
                _ProfileInfoRow(label: "Age", value: "25"),
                _ProfileInfoRow(label: "Weight", value: "70 kg"),
                _ProfileInfoRow(label: "Height", value: "175 cm"),
              ],
            ),

            const SizedBox(height: 24),

            // Fitness Progress
            const _ProfileSection(
              title: "Fitness Progress",
              children: [
                _ProfileInfoRow(label: "Total Workouts", value: "150"),
                _ProfileInfoRow(label: "Calories Burned", value: "5000 kcal"),
                _ProfileInfoRow(label: "Achievements", value: "5"),
              ],
            ),

            const SizedBox(height: 24),

            // Goals
            const _ProfileSection(
              title: "Fitness Goals",
              children: [
                _ProfileInfoRow(label: "Goal Weight", value: "65 kg"),
                _ProfileInfoRow(label: "Target Workouts", value: "200"),
              ],
            ),

            const SizedBox(height: 24),

            // Settings Button
            ElevatedButton(
              onPressed: () {
                // Navigate to settings screen
                Navigator.pushNamed(context, "/settings");
              },
              style: ElevatedButton.styleFrom(
                iconColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 12),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: const Text("Edit Profile"),
            ),
          ],
        ),
      ),
    );
  }
}

// Profile Header (Profile Picture + User Name)
class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('lib/assets/images/profile_picture.jpeg'),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Vinnie",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "Fitness Enthusiast",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}

// Profile Section Widget (Personal Info, Fitness Progress, Goals)
class _ProfileSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _ProfileSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...children,
      ],
    );
  }
}

// Profile Info Row Widget (For showing label-value pairs)
class _ProfileInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileInfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          Text(value, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}

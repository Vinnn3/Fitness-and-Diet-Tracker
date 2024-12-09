import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/theme_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false; // State for dark mode toggle
  bool _notificationsEnabled = true; // State for notifications toggle

  void _handleThemeChange() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
    Get.snackbar(
      "Theme Changed",
      _isDarkMode ? "Dark mode enabled" : "Light mode enabled",
      snackPosition: SnackPosition.BOTTOM,
    );
    // Add theme change logic here
  }

  void _handleNotificationChange() {
    setState(() {
      _notificationsEnabled = !_notificationsEnabled;
    });
    Get.snackbar(
      "Notifications",
      _notificationsEnabled ? "Notifications enabled" : "Notifications disabled",
      snackPosition: SnackPosition.BOTTOM,
    );
    // Add notification settings logic here
  }

  void _handleLogout() {
    Get.offAllNamed('/login'); // Clears navigation stack and goes to login
    Get.snackbar(
      "Logged Out",
      "You have been successfully logged out.",
      snackPosition: SnackPosition.BOTTOM,
    );
    // Add logout logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          // Account Section
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Account Settings'),
            onTap: () {
              // Navigate to account settings page
              Get.toNamed('/account-settings');
            },
          ),
          const Divider(),

          // Change Theme Option
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('Change Theme'),
           trailing: Obx(() => Switch(
        value: Get.find<ThemeController>().isDarkMode.value,
        onChanged: (value) => Get.find<ThemeController>().toggleTheme(),
      )),
          ),
          const Divider(),

          // Notification Settings
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) => _handleNotificationChange(),
            ),
          ),
          const Divider(),

          // Log Out
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: _handleLogout,
          ),
          const Divider(),

          // Help & Support Section
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help & Support'),
            onTap: () {
              // Navigate to help & support page
              Get.toNamed('/help-support');
            },
          ),
        ],
      ),
    );
  }
}

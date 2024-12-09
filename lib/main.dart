import 'package:get/get.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:project/assets/theme.dart';
import 'package:project/views/screens/settings.dart';
import '/views/screens/home.dart';
import 'views/screens/login.dart';
import 'views/screens/registration.dart';
import 'views/screens/dashboard.dart';
import 'views/screens/diet.dart';
import 'views/screens/workout.dart';
import 'views/screens/achievements.dart';
import 'controllers/theme_controller.dart';
import 'package:project/views/screens/help_support_screen.dart';
import 'package:project/views/screens/account_settings_screen.dart';

void main() {
    Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return GetMaterialApp(
      title: 'Fitness & Diet Tracker',
   theme: AppTheme.lightTheme,
initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/dashboard', page: () => const DashboardScreen()),
        GetPage(name: '/register', page: () => const Registration()),
        GetPage(name: '/diet', page: () => const DietScreen()),
        GetPage(name: '/workout', page: () =>  const WorkoutScreen()),
        GetPage(name: '/achievements', page: () => const AchievementsScreen()),
        GetPage(name: '/settings', page: () => const SettingsScreen()),
        GetPage(name: '/account-settings', page: () => const AccountSettingsScreen()),
        GetPage(name: '/help-support', page: () => const HelpSupportScreen()),
      ],
    );
    
  }
}

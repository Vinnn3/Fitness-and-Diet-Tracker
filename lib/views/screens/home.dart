import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/assets/app_colors.dart';
import 'package:project/views/screens/profile.dart';
import 'dashboard.dart';
import 'settings.dart';

final List titles = ["Workouts", "Diets", "Achievements"];
final List iconData = [Icons.fitness_center_rounded, Icons.food_bank, Icons.star];
final List<String> routes = ["/workout", "/diet", "/achievements"];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Track the selected index for the bottom navigation

  // List of screens to display based on the selected tab
  final List<Widget> _screens = [
    const HomeTabScreen(),
    const DashboardScreen(), 
    const SettingsScreen(), 
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness and Diet Tracker'),
        centerTitle: true,
        foregroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Go back to login screen
              Get.offAllNamed('/login'); // Clears the stack and goes to login
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Highlight the selected tab
        onTap: _onItemTapped, // Call the function when a tab is tapped
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile', 
          ),
        ],
      ),
    );
  }
}

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Text("Hi Vinnie", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24)),
                Text("Welcome back! Let's achieve your goals today!", style: TextStyle(fontSize: 24, color: Colors.black)),
              ],
            ),
          ),
        
          GridView.builder(
            itemCount: titles.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to respective screen based on the grid item tapped
                    Navigator.pushNamed(context, routes[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    height: 50,
                    width: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(iconData[index], size: 70, color: Colors.black),
                        Text(titles[index]),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

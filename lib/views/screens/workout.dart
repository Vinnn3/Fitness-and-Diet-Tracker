import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Workout Model
class Workout {
  final int id;
  final String name;
  final String description;
  final int duration;
  final String difficulty;

  Workout({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.difficulty,
  });

  // Convert JSON into a Workout object
  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
      difficulty: json['difficulty'],
    );
  }
}

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  late Future<List<Workout>> futureWorkouts;

  @override
  void initState() {
    super.initState();
    futureWorkouts = fetchWorkouts();
  }

  // Fetch workouts from the API
  Future<List<Workout>> fetchWorkouts() async {
    const String url = 'http://localhost/fitness_tracker/workouts.php';  
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> workoutsJson = json.decode(response.body)['data'];
      return workoutsJson.map((json) => Workout.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load workouts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Routines'),
      ),
      body: FutureBuilder<List<Workout>>(
        future: futureWorkouts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No workouts available'));
          } else {
            final workouts = snapshot.data!;
            return ListView.builder(
              itemCount: workouts.length,
              itemBuilder: (context, index) {
                final workout = workouts[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(workout.name),
                    subtitle: Text(workout.description),
                    trailing: Text('${workout.duration} min'),
                    onTap: () {
                      // Handle on tap, such as navigating to a workout detail screen
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

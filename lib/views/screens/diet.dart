import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Model class for Diet
class Diet {
  final int id;
  final String mealName;
  final String mealDescription;
  final int calories;
  final int protein;
  final int carbs;
  final int fat;

  Diet({
    required this.id,
    required this.mealName,
    required this.mealDescription,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
  });

  factory Diet.fromJson(Map<String, dynamic> json) {
    return Diet(
      id: int.tryParse(json['id'].toString()) ?? 0,  // parsing as int
      mealName: json['meal_name'] ?? '',
      mealDescription: json['meal_description'] ?? '',
      calories: int.tryParse(json['calories'].toString()) ?? 0, 
      protein: int.tryParse(json['protein'].toString()) ?? 0,  
      carbs: int.tryParse(json['carbs'].toString()) ?? 0,  
      fat: int.tryParse(json['fat'].toString()) ?? 0, 
    );
  }
}

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  _DietScreenState createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  late Future<List<Diet>> futureDiets;

  @override
  void initState() {
    super.initState();
    futureDiets = fetchDiets();
  }

  Future<List<Diet>> fetchDiets() async {
    final response = await http.get(Uri.parse('http://localhost/fitness_tracker/diet.php'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> dietsJson = data['data'];
      return dietsJson.map((json) => Diet.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load diets');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet Plans'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Diet>>(
          future: futureDiets,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No Diet Plans Available'));
            } else {
              final diets = snapshot.data!;
              return Column( // Removed Expanded
                children: diets.map((diet) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    child: Card(
                      child: ListTile(
                        title: Text(diet.mealName),
                        subtitle: Text(diet.mealDescription),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Calories: ${diet.calories}'),
                            Text('Protein: ${diet.protein}g'),
                            Text('Carbs: ${diet.carbs}g'),
                            //Text('Fat: ${diet.fat}g'),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }
          },
        ),
      ),
    );
  }
}

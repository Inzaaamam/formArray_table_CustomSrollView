// ignore_for_file: file_names, unused_field, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:tab/screen/recipes_api_for_food/api.dart';
import 'package:tab/screen/recipes_api_for_food/model_recipes.dart';
import 'package:tab/screen/recipes_api_for_food/recip_details.dart';

class RecipeListScreen extends StatefulWidget {
  const RecipeListScreen({super.key});

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  List<Recipes> _recipes = [];
  bool _isLoading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<List<Recipes>> fetchData() async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      _recipes = await ApiService().fetchRecipes();
    } catch (e) {
      _error = 'Failed to load recipes';
    }

    setState(() {
      _isLoading = false;
    });

    return _recipes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 22,
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: true,
        title: const Center(
            child: Text(
          'Food Recipe List',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        )),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error.isNotEmpty
              ? Center(child: Text('Error: $_error'))
              : _recipes.isEmpty
                  ? const Center(child: Text('No recipes found.'))
                  : ListView.builder(
                      itemCount: _recipes.length,
                      itemBuilder: (context, index) {
                        final recipe = _recipes[index];
                        return RecipeCard(recipe: recipe);
                      },
                    ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final Recipes recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailScreen(recipe: recipe),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.fromLTRB(16, 12, 16, 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (recipe.image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    recipe.image!,
                    fit: BoxFit.cover,
                    height: 200.0,
                    width: double.infinity,
                  ),
                ),
              const SizedBox(height: 8.0),
              Text(
                recipe.name ?? 'No name',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Meal Type: ${recipe.mealType?.join(', ') ?? 'Not available'}',
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8.0),
              Wrap(
                spacing: 8.0,
                children: recipe.tags!
                    .map((tag) => Chip(
                          label: Text(tag),
                          backgroundColor: Colors.lightBlueAccent,
                          labelStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 8.0),
              // const Text(
              //   'Instructions:',
              //   style: TextStyle(
              //     fontSize: 16.0,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.black54,
              //   ),
              // ),
              // for (var instruction in recipe.instructions!)
              //   Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 2.0),
              //     child: Text('• $instruction'),
              //   ),
              // const SizedBox(height: 8.0),
              // const Text(
              //   'Ingredients:',
              //   style: TextStyle(
              //     fontSize: 16.0,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.black54,
              //   ),
              // ),
              // for (var ingredient in recipe.ingredients!)
              //   Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 2.0),
              //     child: Text('• $ingredient'),
              //   ),
              // const SizedBox(height: 8.0),
              // Text(
              //   'Meal Type: ${recipe.mealType?.join(', ') ?? 'Not available'}',
              //   style: const TextStyle(
              //     fontSize: 14.0,
              //     color: Colors.black54,
              //   ),
              // ),
              // const SizedBox(height: 8.0),
              // Row(
              //   children: [
              //     const Icon(Icons.star, size: 18.0, color: Colors.amber),
              //     const SizedBox(width: 4.0),
              //     Text(
              //       '${recipe.rating} (${recipe.reviewCount} reviews)',
              //       style: const TextStyle(
              //         fontSize: 14.0,
              //         color: Colors.black54,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

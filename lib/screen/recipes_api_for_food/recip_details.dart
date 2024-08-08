// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tab/screen/recipes_api_for_food/model_recipes.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipes recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 22,
        ),
        automaticallyImplyLeading: true,
        title: Center(
          child: Text(
            recipe.name ?? 'Recipe Details',
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (recipe.image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  recipe.image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            const SizedBox(height: 16.0),
            Text(
              recipe.name ?? 'No name',
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // const SizedBox(height: 8.0),
            Text(
              recipe.mealType.toString(),
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
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
            const SizedBox(height: 16.0),
            const Text(
              'Instructions:',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            for (var instruction in recipe.instructions!)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text('• $instruction'),
              ),
            const SizedBox(height: 16.0),
            const Text(
              'Ingredients:',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            for (var ingredient in recipe.ingredients!)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text('• $ingredient'),
              ),
            const SizedBox(height: 16.0),
            Text(
              'Meal Type: ${recipe.mealType?.join(', ') ?? 'Not available'}',
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Icon(Icons.star, size: 24.0, color: Colors.amber),
                const SizedBox(width: 4.0),
                Text(
                  '${recipe.rating} (${recipe.reviewCount} reviews)',
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

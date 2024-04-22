import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:recipe_app/presentation/screens/recipe_detail_screen.dart';

import '../../bloc/saved_recipe_bloc.dart';
import '../../data/models/recipe_model.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Recipes'),
      ),
      body: BlocBuilder<SavedRecipesBloc, List<Recipe>>(
        builder: (context, savedRecipes) {
          if (savedRecipes.isEmpty) {
            return const Center(
              child: Text('No saved recipes yet.'),
            );
          } else {
            return ListView.builder(
              itemCount: savedRecipes.length,
              itemBuilder: (context, index) {
                final Recipe recipe = savedRecipes[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Image.network(
                        width: 100,
                        recipe.image,
                        alignment: Alignment.center,
                      ),
                      title: Text(
                        recipe.title,
                      ),
                      onTap: () {
                        Get.to(
                          RecipeDetailScreen(
                            recipe,
                          ),
                        );
                      },
                    ),
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

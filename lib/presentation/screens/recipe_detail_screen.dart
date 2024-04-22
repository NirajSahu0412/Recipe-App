import 'package:flutter/material.dart';
import 'package:recipe_app/utils/constants/sizes.dart';
import 'package:recipe_app/utils/helpers/helper_functions.dart';
import '../../data/models/recipe_model.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen(this.recipe, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                height: CustomHelperFunctions.screenHeight() / 3,
                width: double.infinity - 50,
                recipe.image,
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: CustomSize.spaceBetweenItem),
              const Text(
                'Ingredients:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: recipe.ingredients.length,
                itemBuilder: (context, index) {
                  return Text("- ${recipe.ingredients[index]}");
                },
              ),
              const SizedBox(height: CustomSize.spaceBetweenItem),
              const Text(
                'Instructions:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(recipe.instructions),
            ],
          ),
        ),
      ),
    );
  }
}

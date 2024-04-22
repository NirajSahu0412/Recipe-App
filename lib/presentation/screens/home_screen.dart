import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:recipe_app/presentation/screens/recipe_detail_screen.dart';
import 'package:recipe_app/presentation/screens/saved_screen.dart';
import 'package:recipe_app/utils/constants/strings.dart';

import '../../bloc/recipe_bloc.dart';
import '../../bloc/saved_recipe_bloc.dart';
import '../../data/models/recipe_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(CustomText.homeTitle),
        actions: [
          // Saved Recipe section IconButton
          IconButton(
            onPressed: () {
              Get.to(
                const SavedScreen(),
              );
            },
            icon: const Icon(
              Icons.bookmark,
            ),
          ),
        ],
      ),
      // Get the RecipeBloc and RecipeState give to the UI
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          List<Recipe> recipesToShow = [];

          // Search Function
          if (_searchController.text.isNotEmpty) {
            final query = _searchController.text.toLowerCase();

            recipesToShow = state.recipes.where((recipe) {
              final recipeName = recipe.title.toLowerCase();
              final ingredients = recipe.ingredients
                  .map((ingredient) => ingredient.toLowerCase())
                  .toList();
              return recipeName.contains(query) ||
                  ingredients.any((ingredient) => ingredient.contains(query));
            }).toList();
          } else {
            recipesToShow = state.recipes;
          }

          if (state.status == RecipeStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == RecipeStatus.success) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // Search Widget
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      labelText: 'Search by recipe or ingredient',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                Expanded(
                  // Recipe List
                  child: ListView.builder(
                    itemCount: recipesToShow.length,
                    itemBuilder: (context, index) {
                      final Recipe recipe = recipesToShow[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            leading: Image.network(
                              width: 100,
                              recipe.image,
                            ),
                            title: Text(
                              recipe.title,
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.bookmark_add_outlined),
                              onPressed: () {
                                BlocProvider.of<SavedRecipesBloc>(context)
                                    .toggleSaved(recipe);
                              },
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
                  ),
                ),
              ],
            );
          } else if (state.status == RecipeStatus.failure) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const Center(
              child: Text('Unknown state'),
            );
          }
        },
      ),
    );
  }
}

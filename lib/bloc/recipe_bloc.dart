import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/recipe_model.dart';
import '../data/repository/recipe_data.dart';

enum RecipeStatus { initial, loading, success, failure }

class RecipeState {
  final List<Recipe> recipes;
  final RecipeStatus status;
  final String errorMessage;

  const RecipeState({
    this.recipes = const [],
    this.status = RecipeStatus.initial,
    this.errorMessage = '',
  });

  RecipeState copyWith({
    List<Recipe>? recipes,
    RecipeStatus? status,
    String? errorMessage,
  }) {
    return RecipeState(
      recipes: recipes ?? this.recipes,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class RecipeBloc extends Cubit<RecipeState> {
  RecipeBloc() : super(const RecipeState());

  Future<void> fetchRecipes() async {
    emit(state.copyWith(status: RecipeStatus.loading));
    try {
      // Map the data according to the model class
      final List<Recipe> recipes = recipeData.map((data) {
        return Recipe(
          id: data['id'],
          title: data['title'],
          image: data['image'],
          ingredients: List<String>.from(data['ingredients']),
          instructions: data['instructions'],
        );
      }).toList();

      emit(state.copyWith(recipes: recipes, status: RecipeStatus.success));
    } catch (e) {
      emit(state.copyWith(status: RecipeStatus.failure, errorMessage: 'Failed to load recipes'));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/recipe_model.dart';

// SavedRecipebloc will make sure to state the saved recipe than emit or return it.
class SavedRecipesBloc extends Cubit<List<Recipe>> {
  SavedRecipesBloc() : super([]);

  void toggleSaved(Recipe recipe) {
    if (state.contains(recipe)) {
      emit(List.from(state)..remove(recipe));
    } else {
      emit(List.from(state)..add(recipe));
    }
  }
}
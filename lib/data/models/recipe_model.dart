
// Its the model of the recipe
class Recipe {
  final int id;
  final String title;
  final String image;
  final List<String> ingredients;
  final String instructions;

  Recipe({
    required this.id,
    required this.title,
    required this.image,
    required this.ingredients,
    required this.instructions,
  });
}
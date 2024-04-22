import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:recipe_app/presentation/screens/home_screen.dart';
import 'package:recipe_app/utils/constants/strings.dart';
import 'package:recipe_app/utils/theme/themes.dart';
import 'bloc/recipe_bloc.dart';
import 'bloc/saved_recipe_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // Bloc Provider Initialization
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecipeBloc>(
          create: (BuildContext context) => RecipeBloc()..fetchRecipes(),
        ),
        BlocProvider<SavedRecipesBloc>(
          create: (BuildContext context) => SavedRecipesBloc(),
        ),
      ],
      child: GetMaterialApp(
        title: CustomText.appName,
        debugShowCheckedModeBanner: false,
        theme: CustomAppTheme.lightTheme,
        darkTheme: CustomAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const HomeScreen(),
      ),
    );
  }
}

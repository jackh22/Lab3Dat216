import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/recipe_database/recipe_handler.dart';
import 'recipe_list_item.dart';
import 'recipe_detail.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    var recipeHandler = context.watch<RecipeHandler>();
    var recipes = recipeHandler.bestMatches;

    return ListView(
      children: [
        for (final recipe in recipes)
          RecipeListItem(
            recipe,
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => Scaffold(
            appBar: AppBar(
            title: Text(recipe.name),
      ),
      body: RecipeDetail(recipe),
    ),
  ),
);
  })],
    );
  }
}
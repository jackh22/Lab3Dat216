import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.paddingMedium),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.paddingLarge),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _image(recipe),
              const SizedBox(width: AppTheme.paddingLarge),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(recipe.name, style: AppTheme.largeHeading),
                      const SizedBox(height: AppTheme.paddingSmall),
                      Text(recipe.description),
                      const SizedBox(height: AppTheme.paddingMedium),
                      Row(
                        children: [
                          MainIngredient.icon(recipe.mainIngredient, width: 24)!,
                          const SizedBox(width: AppTheme.paddingSmall),
                          Difficulty.icon(recipe.difficulty, width: 56)!,
                          const SizedBox(width: AppTheme.paddingMedium),
                          Text('${recipe.time} min'),
                          const SizedBox(width: AppTheme.paddingMedium),
                          Text('${recipe.price} kr'),
                        ],
                      ),
                      const SizedBox(height: AppTheme.paddingLarge),
                      const Text('Ingredienser', style: AppTheme.smallHeading),
                      const SizedBox(height: AppTheme.paddingSmall),
                      for (final ingredient in recipe.ingredients)
                        Text(ingredient.toString()),
                      const SizedBox(height: AppTheme.paddingLarge),
                      const Text('Tillagning', style: AppTheme.smallHeading),
                      const SizedBox(height: AppTheme.paddingSmall),
                      Text(recipe.instruction),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image(Recipe recipe) {
    var image = ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 240,
        height: 240,
        child: FittedBox(
          fit: BoxFit.cover,
          child: recipe.image,
        ),
      ),
    );

    var flagImage = Cuisine.flag(recipe.cuisine, width: 60);

    return Stack(
      children: [
        image,
        Positioned(
          bottom: 12,
          right: 12,
          child: flagImage!,
        ),
      ],
    );
  }
}
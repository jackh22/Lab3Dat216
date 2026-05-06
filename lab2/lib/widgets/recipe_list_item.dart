import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';



class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.blue.withAlpha(30),
        onTap: onTap,
        child: Container(
          height: 128,
          padding: const EdgeInsets.all(AppTheme.paddingMediumSmall),
          child: Row(
            children: [
              _image(recipe),
              const SizedBox(width: AppTheme.paddingMedium),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(recipe.name, style: AppTheme.mediumHeading),
                    const SizedBox(height: AppTheme.paddingSmall),
                    Text(
                      recipe.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        MainIngredient.icon(recipe.mainIngredient, width: 20)!,
                        const SizedBox(width: AppTheme.paddingSmall),
                        Difficulty.icon(recipe.difficulty, width: 48)!,
                        const Spacer(),
                        Text('${recipe.time} min'),
                        const SizedBox(width: AppTheme.paddingMedium),
                        Text('${recipe.price} kr'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image(Recipe recipe) {
    var square = ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 104,
        height: 104,
        child: FittedBox(
          fit: BoxFit.cover,
          child: recipe.image,
        ),
      ),
    );

    var flagImage = Cuisine.flag(recipe.cuisine, width: 24.0);

    return Stack(
      children: [
        square,
        Positioned(
          bottom: 8,
          right: 8,
          child: flagImage!,
        ),
      ],
    );
  }
}
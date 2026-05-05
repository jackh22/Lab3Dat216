import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:provider/provider.dart';
import '../model/recipe_database/recipe_handler.dart';

class IngredientControl extends StatelessWidget {
  const IngredientControl({super.key});

  @override
  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);
    const labels = MainIngredient.labels;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text('Ingrediens:'),
        const SizedBox(width: AppTheme.paddingSmall),
        DropdownMenu<String>(
          width: 164,
          enableFilter: false,
          requestFocusOnTap: false,
          initialSelection: labels[0],
          dropdownMenuEntries: [
            for (int i = 0; i < labels.length; i++)
              DropdownMenuEntry(
                value: labels[i],
                label: labels[i],
                leadingIcon: MainIngredient.icons[i],
              ),
          ],
          onSelected: (value) {
            recipeHandler.setMainIngredient(value);
          },
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:provider/provider.dart';

import '../util/difficulty.dart';
import '../model/recipe_database/recipe_handler.dart';

class DifficultyControl extends StatefulWidget {
  const DifficultyControl({super.key});

  @override
  State<DifficultyControl> createState() => _DifficultyControlState();
}

class _DifficultyControlState extends State<DifficultyControl> {
  String _difficulty = Difficulty.labels[0];

  @override
  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);

   return Column(
  children: [
    for (int i = 0; i < Difficulty.labels.length; i++)
      RadioListTile<String>(
        dense: true,
        title: i == 0
            ? Text(Difficulty.labels[i])
            : Row(
                children: [
                  Difficulty.icons[i]!,
                  const SizedBox(width: AppTheme.paddingMedium),
                  Text(Difficulty.labels[i]),
                ],
              ),
        value: Difficulty.labels[i],
        groupValue: _difficulty,
        onChanged: (value) {
          setState(() {
            _difficulty = value!;
            recipeHandler.setDifficulty(value);
          });
        },
      ),
  ],
);
  }
}
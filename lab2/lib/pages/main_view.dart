import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';

import '../widgets/ingredient_control.dart';
import '../widgets/kitchen_control.dart';
import '../widgets/difficulty_control.dart';
import '../widgets/price_control.dart';
import '../widgets/recipe_list.dart';
import '../widgets/time_controll.dart';
import '../widgets/logo.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppTheme.paddingMedium),
        child: Row(
          children: [
            _controlPanel(context),
            const SizedBox(width: AppTheme.paddingSmall),
            _recipeArea(context),
          ],
        ),
      ),
    );
  }

  Widget _controlPanel(context, {double width = 335}) {
  return SizedBox(
    width: width,
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Logo(),
            const SizedBox(height: AppTheme.paddingMedium),
            const Text(
              'Hitta ett recept som passar genom att\nändra inställningarna nedanför',
            ),
            const SizedBox(height: AppTheme.paddingLarge),

            const IngredientControl(),
            const SizedBox(height: AppTheme.paddingMedium),

            const KitchenControl(),
            const SizedBox(height: AppTheme.paddingLarge),

            const Text('Svårighetsgrad', style: AppTheme.smallHeading),
            const DifficultyControl(),
            const SizedBox(height: AppTheme.paddingMedium),

            const Text('Maxpris', style: AppTheme.smallHeading),
            const PriceControl(),
            const SizedBox(height: AppTheme.paddingMedium),

            const Text('Tillagningstid', style: AppTheme.smallHeading),
            const TimeControl(),
          ],
        ),
      ),
    ),
  );
}
  Widget _recipeArea(context) {
    return const Expanded(
      child: RecipeList(),
    );
  }
}
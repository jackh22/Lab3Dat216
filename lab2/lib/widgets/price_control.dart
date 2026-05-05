import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/recipe_database/recipe_handler.dart';
import 'package:lab2/app_theme.dart';

class PriceControl extends StatefulWidget {
  const PriceControl({super.key});

  @override
  State<PriceControl> createState() => _PriceControlState();
}

class _PriceControlState extends State<PriceControl> {
  double _price = 60;

  @override
  Widget build(BuildContext context) {

    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Slider(
          value: _price,
          min: 0,
          max: 200,
          divisions: 40,
          onChanged: (double value) {
            setState(() {
              _price = value;
              recipeHandler.setMaxPrice(value.toInt());
            });
          },
        ),
        Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Padding(
      padding: const EdgeInsets.only(right: AppTheme.paddingLarge),
      child: Text('${_price.round()} kr'),
      ),
     ],
    ),
   ],
  );
 }
}
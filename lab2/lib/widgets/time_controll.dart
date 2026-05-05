import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/recipe_database/recipe_handler.dart';
import 'package:lab2/app_theme.dart';

class TimeControl extends StatefulWidget {
  const TimeControl({super.key});

  @override
  State<TimeControl> createState() => _TimeControlState();
}

class _TimeControlState extends State<TimeControl> {
  double _time = 30;

  @override
  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Slider(
          value: _time,
          min: 0,
          max: 150,
          divisions: 15,
          onChanged: (double value) {
            setState(() {
              _time = value;
              recipeHandler.setMaxTime(value.toInt());
            });
          },
        ),
        Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Padding(
      padding: const EdgeInsets.only(right: AppTheme.paddingLarge),
      child: Text('${_time.round()} minuter'),
    ),
  ],
),
      ],
    );
  }
}
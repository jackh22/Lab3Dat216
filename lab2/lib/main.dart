import 'package:flutter/material.dart';
import 'package:lab2/pages/main_view.dart';
import 'package:provider/provider.dart';
import '../model/recipe_database/recipe_handler.dart';
import 'ui_controller.dart';
import 'app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RecipeHandler()),
        ChangeNotifierProvider(create: (context) => UIController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receptsök',
      theme: ThemeData(
        colorScheme: AppTheme.colorScheme,
        textTheme: AppTheme.textTheme,
      ),
      home: const MainView(),
    );
  }
}
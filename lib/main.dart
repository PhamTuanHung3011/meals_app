import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screens.dart';
import 'package:meals_app/screens/category_meals_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delimeals',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Raleway',
      ),
      home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        CategoryMealsScreen.idCategoryMealsScreen: (context) =>
            CategoryMealsScreen(),
      },
    );
  }
}
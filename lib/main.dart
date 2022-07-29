import 'package:flutter/material.dart';
import 'package:meals_app/model/dummy_data.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/category_meals_screens.dart';
import 'package:meals_app/screens/filter_screens.dart';
import 'package:meals_app/screens/meal_detail_screens.dart';
import 'package:meals_app/screens/tabs_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoritesMeals = [];

  //bo loc hien tai;
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((mealData) {
        if ((_filters['gluten'] ?? false) && !mealData.isGlutenFree) {
          return false;
        }

        if ((_filters['vegan'] ?? false) && !mealData.isVegan) {
          return false;
        }

        if ((_filters['vegetarian'] ?? false) && !mealData.isVegetarian) {
          return false;
        }

        if ((_filters['lactose'] ?? false) && !mealData.isLactoseFree) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoritesMeals.indexWhere((mealData) => mealData.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoritesMeals.removeAt(existingIndex);
      });
    }
    else {
      setState(() {
        _favoritesMeals.add(DUMMY_MEALS.firstWhere((mealData) => mealData.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoritesMeals.any((mealData) => mealData.id == id);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delimeals',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Raleway',
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favoritesMeals),
        CategoryMealsScreen.idCategoryMealsScreen: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.idMealDetailScreen: (context) => MealDetailScreen(_isMealFavorite,_toggleFavorite),
        FilterScreens.idFilterScreens: (context) =>
            FilterScreens(_filters, _setFilters),
      },
    );
  }
}

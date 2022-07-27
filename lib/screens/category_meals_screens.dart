import 'package:flutter/material.dart';
import 'package:meals_app/component/meal_items.dart';

import '../model/dummy_data.dart';
import '../model/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const idCategoryMealsScreen = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  late List<Meal> displayedMeals;

  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArgs =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final categoryId = routeArgs['id'];
    categoryTitle = routeArgs['title'];

    displayedMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItems(
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                imageUrl: displayedMeals[index].imageUrl,
                duration: displayedMeals[index].duration,
                complexity: displayedMeals[index].complexity,
                affordability: displayedMeals[index].affordability,
                removeItems: _removeMeal,

            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}

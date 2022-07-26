import 'package:flutter/material.dart';
import 'package:meals_app/component/meal_items.dart';
import 'package:meals_app/model/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const idMealDetailScreen = '/meals-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectMeals =
        DUMMY_MEALS.firstWhere((mealData) => mealData.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('$mealId'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 300.0,
            width: double.infinity,
            child: Image.network(selectMeals.imageUrl, fit: BoxFit.cover,),
          ),
          Container(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10.0),
                      child: Text(selectMeals.ingredients[index])),
                );
              },
              itemCount: selectMeals.ingredients.length,
            ),
          )
        ],
      ),
    );
  }
}

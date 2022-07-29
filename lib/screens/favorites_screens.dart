

import 'package:flutter/material.dart';

import '../component/meal_items.dart';
import '../model/meal.dart';

class FavoritesScreen extends StatelessWidget {

  late final List<Meal> favoriteMeal;
  FavoritesScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {

    if (favoriteMeal.isEmpty) {
      return Center(child: Text('You have no favorites yet'),) ;
    }
    else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItems(
            id: favoriteMeal[index].id,
            title: favoriteMeal[index].title,
            imageUrl: favoriteMeal[index].imageUrl,
            duration: favoriteMeal[index].duration,
            complexity: favoriteMeal[index].complexity,
            affordability: favoriteMeal[index].affordability,

          );
        },
        itemCount: favoriteMeal.length,
      );
    }




  }
}

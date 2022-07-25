import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screens.dart';

class CategoryItems extends StatelessWidget {
  final String id;
  final String title;
  final Color colour;

  CategoryItems(this.id, this.title, this.colour);

  void selectedCategory(BuildContext ctx) {
    Navigator.pushNamed(ctx, CategoryMealsScreen.idCategoryMealsScreen,
        arguments: {'id': this.id, 'title': this.title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [colour.withOpacity(0.7), colour],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}

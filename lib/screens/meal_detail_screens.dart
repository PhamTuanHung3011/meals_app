import 'package:flutter/material.dart';
import 'package:meals_app/component/meal_items.dart';
import 'package:meals_app/model/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const idMealDetailScreen = '/meals-detail';

  Widget buildSectionTitle(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.black54, fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectMeals =
        DUMMY_MEALS.firstWhere((mealData) => mealData.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('$mealId'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 280.0,
              width: double.infinity,
              child: Image.network(
                selectMeals.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                      color: Theme.of(context).colorScheme.secondary,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 5.0),
                        child: Text(selectMeals.ingredients[index]),
                      ));
                },
                itemCount: selectMeals.ingredients.length,
              ),
            ),
            buildSectionTitle('Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(selectMeals.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectMeals.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete_forever),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}

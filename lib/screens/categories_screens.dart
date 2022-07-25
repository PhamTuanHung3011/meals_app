import 'package:flutter/material.dart';
import 'package:meals_app/model/dummy_data.dart';
import 'package:meals_app/screens/category_items.dart';

class CategoriesScreen extends StatelessWidget {

  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menus'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2,
          mainAxisExtent: 200.0,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (e) => CategoryItems(e.id, e.title, e.colour),
            )
            .toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screens.dart';
import 'package:meals_app/screens/favorites_screens.dart';

import '../component/main_drawer.dart';
import '../model/meal.dart';

class TabsScreen extends StatefulWidget {
  // tao list mon an ua thich
  final List<Meal> favoritesMealsList;
  TabsScreen(this.favoritesMealsList);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late final List<Map<String, Object>> _page;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _page = [
      {'page': CategoriesScreen(),
        'title': 'Categories'
      },
      {
        'page': FavoritesScreen(widget.favoritesMealsList),
        'title': 'Favorites'
      },
    ];

    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _page[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
            tooltip: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star_border_purple500_sharp),
            label: 'Favorites',
            tooltip: 'Favorites',
          ),
        ],
      ),
    );
  }
}

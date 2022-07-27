import 'package:flutter/material.dart';
import 'package:meals_app/screens/filter_screens.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTitle(IconData icon, String text, Function()? goPage) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25.0,
      ),
      title: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 25.0,
            fontStyle: FontStyle.italic),
      ),
      onTap: goPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTitle(
            Icons.restaurant_outlined,
            'Meals',
            // Navigator.pushNamed(context, '/'),
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          buildListTitle(
            Icons.settings,
            'Filters',
              () => Navigator.of(context).pushReplacementNamed(FilterScreens.idFilterScreens),
          ),
        ],
      ),
    );
  }
}

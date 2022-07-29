import 'package:flutter/material.dart';

import '../component/main_drawer.dart';

class FilterScreens extends StatefulWidget {
  static const idFilterScreens = 'filter-screens';

  final Function saveFilters;
  final Map<String, bool> currentFilters;


  FilterScreens(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreens> createState() => _FilterScreensState();
}

class _FilterScreensState extends State<FilterScreens> {
  bool _glutenFree = false;
  bool _veganFree = false;
  bool _vegetarianFree = false;
  bool _lactoseFree = false;

  Widget _SwitchList(
    String text,
    String description,
    bool currentValue,
    Function(bool)? updateValue,
  ) {
    return SwitchListTile(
      title: Text(text),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.currentFilters['gluten']!;
    _veganFree = widget.currentFilters['vegan']!;
    _vegetarianFree = widget.currentFilters['vegetarian']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FilterScreens"),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final selectFilters = {
                  'gluten': _glutenFree,
                  'vegan': _veganFree,
                  'vegetarian': _vegetarianFree,
                  'lactose': _lactoseFree,
                };
                widget.saveFilters(selectFilters);
              },
              icon: Icon(Icons.save)),
        ],
      ),
      drawer: MainDrawer(),
      // drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Adjust your meal select',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _SwitchList(
                  'GlutenFree', 'Only include gluten -free meals', _glutenFree,
                  (bool newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _SwitchList(
                  'Lactose', 'Only include lactose -free meals', _lactoseFree,
                  (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _SwitchList('VeganFree', 'Tot cho suc khoe', _veganFree,
                  (newValue) {
                setState(() {
                  _veganFree = newValue;
                });
              }),
              _SwitchList('Vegetables', 'Only include vegetables -free meals',
                  _vegetarianFree, (newValue) {
                setState(() {
                  _vegetarianFree = newValue;
                });
              }),

              // _SwitchList('Vegan Free', _veganFree),
              // _SwitchList('Vegetarian Free', _vegetarianFree),
              // _SwitchList('Lactose Free', _lactoseFree),
            ],
          )),
        ],
      ),
    );
  }
}

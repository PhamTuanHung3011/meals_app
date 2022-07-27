import 'package:flutter/material.dart';

import '../component/main_drawer.dart';

class FilterScreens extends StatelessWidget {
  static const idFilterScreens = 'filter-screens';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FilterScreens"),
      ),
      // drawer: MainDrawer(),
      body: Center(
        child: Text('FilterScreens'),
      ),
    );
  }
}

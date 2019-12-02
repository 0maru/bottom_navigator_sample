import 'package:flutter/material.dart';

enum TabItem {
  red,
  green,
  blue,
}

Map<TabItem, String> tabName = {
  TabItem.red: 'red',
  TabItem.green: 'green',
  TabItem.blue: 'blue',
};

Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.red: Colors.red,
  TabItem.green: Colors.green,
  TabItem.blue: Colors.blue,
};

class TabHelper {
  TabHelper();

  MaterialColor color(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.red:
        return Colors.red;
        break;
      case TabItem.blue:
        return Colors.blue;
        break;
      case TabItem.green:
        return Colors.green;
        break;
    }
    return null;
  }

  Widget description(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.red:
        return Text('red');
        break;
      case TabItem.blue:
        return Text('blue');
        break;
      case TabItem.green:
        return Text('green');
        break;
    }
    return null;
  }
}

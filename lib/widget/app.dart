import 'package:bottom_navigator_sample/utils/tab_helper.dart';
import 'package:bottom_navigator_sample/widget/bottom_navigator.dart';
import 'package:bottom_navigator_sample/widget/tab_navigator.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  TabItem _currentTab = TabItem.red;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.red: GlobalKey<NavigatorState>(),
    TabItem.green: GlobalKey<NavigatorState>(),
    TabItem.blue: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != TabItem.red) {
            _selectTab(TabItem.red);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(TabItem.red),
            _buildOffstageNavigator(TabItem.green),
            _buildOffstageNavigator(TabItem.blue),
          ],
        ),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: _currentTab,
      ),
    );
  }
}

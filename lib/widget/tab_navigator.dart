import 'package:bottom_navigator_sample/pages/color_detail_page.dart';
import 'package:bottom_navigator_sample/pages/colors_list_page.dart';
import 'package:bottom_navigator_sample/utils/tab_helper.dart';
import 'package:flutter/material.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void _push(BuildContext context, {int materialIndex = 500}) {
    var routeBuilders = _routeBuilders(
      context,
      materialIndex: materialIndex,
    );

    Navigator.push<Widget>(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[TabNavigatorRoutes.detail](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(
    BuildContext context, {
    int materialIndex = 500,
  }) {
    return {
      TabNavigatorRoutes.root: (context) => ColorsListPage(
            color: activeTabColor[tabItem],
            title: tabName[tabItem],
            onPush: (materialIndex) => _push(
              context,
              materialIndex: materialIndex,
            ),
          ),
      TabNavigatorRoutes.detail: (context) => ColorDetailPage(
            color: activeTabColor[tabItem],
            title: tabName[tabItem],
            materialIndex: materialIndex,
          ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute<Widget>(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}

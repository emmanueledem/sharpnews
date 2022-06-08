import 'package:flutter/material.dart';
import 'package:sharpnews/core/navigators/routes.dart';
import 'package:sharpnews/screens/view_news.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.readNews:
        final args = settings.arguments as ReadNewsScreenData;
        return _getPageRoute(routeName: settings.name, viewToShow: ViewNews(
          params:  args,
        ));

      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

PageRoute _getPageRoute({String? routeName, required Widget viewToShow}) {
  return MaterialPageRoute<dynamic>(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}

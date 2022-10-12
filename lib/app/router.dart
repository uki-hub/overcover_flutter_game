import 'package:flutter/cupertino.dart';
import 'package:overcover/app/page_route.dart';
import 'package:overcover/src/screens/home/home_screen.dart';
import 'package:overcover/src/screens/lobby/lobby_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final routeName = settings.name;
    final args = settings.arguments as dynamic;

    dynamic page;

    switch (routeName) {
      case '/':
        page = HomeScreen();
        break;

      case '/lobby':
        page = LobbyScreen();
        break;

      default:
        // page = UnknownRoutePage(unknownRouteName: settings.name);
        break;
    }

    return AppPageRoute(
      page: page,
    );
  }
}

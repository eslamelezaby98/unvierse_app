import 'package:flutter/material.dart';
import 'package:universe_ui_app/data/model/planet_info.dart';
import 'package:universe_ui_app/views/explore_screen/explore_screen.dart';
import 'package:universe_ui_app/views/plant_screen.dart';

class RouteManager {
  static const String exploreScreen = "/exploreScreen";
  static const String plantScreen = "/plantScreen";

  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case exploreScreen:
        return MaterialPageRoute(
          builder: (context) => const ExploreScreen(),
        );
      case plantScreen:
        final PlanetInfo planetInfo = routeSettings.arguments as PlanetInfo;
        return MaterialPageRoute(
          builder: (context) => PlanetScreen(planetInfo: planetInfo),
        );
      default:
    }
    return null;
  }
}

import 'package:flutter/material.dart';
import 'package:universe_ui_app/helper/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteManager.generateRoute,
      initialRoute: RouteManager.exploreScreen,
    );
  }
}

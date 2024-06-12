import 'package:fireeeee/main.dart';
import 'package:fireeeee/screen/cloud_firestore_screen.dart';
import 'package:fireeeee/screen/realtime_database_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerate {
  static Route<dynamic>? generateRoute(RouteSettings? settings) {
    switch (settings?.name) {
      case MyHomePage.routeName:
        return MaterialPageRoute(
          builder: (context) =>
              const MyHomePage(title: 'Flutter Firebase Demo Home Page'),
        );
      case CloudFireStore.routeName:
        return MaterialPageRoute(
          builder: (context) => const CloudFireStore(),
        );
      case RealTimeDatabase.routeName:
        return MaterialPageRoute(
          builder: (context) => const RealTimeDatabase(),
        );
      default:
        return null;
    }
  }
}

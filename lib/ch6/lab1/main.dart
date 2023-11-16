import 'package:flutter/material.dart';
import 'four_screen.dart';
import 'one_screen.dart';
import 'three_screen.dart';
import 'two_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/one',
      routes: {
        '/one': (context) => OneScreen(),
        '/two': (context) => TwoScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/three') {
          //적절한 알고리즘 돌리고
          //리턴시키는 Route 정보대로 화면이 전환된다.
          return MaterialPageRoute(
            builder: (context) => ThreeScreen(),
            settings: settings,
          );
        } else if (settings.name == '/four') {
          return MaterialPageRoute(
            builder: (context) => FourScreen(),
            settings: settings,
          );
        }
      },
    );
  }
}

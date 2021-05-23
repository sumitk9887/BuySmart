import "package:flutter/material.dart";
import 'package:flutter_catalog/pages/home_page.dart';
import 'package:flutter_catalog/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.system,
        darkTheme: ThemeData.dark(),
        theme: ThemeData.light(),
        routes: {
          "/": (context) => HomePage(),
          "login": (context) => LoginPage()
        });
  }
}

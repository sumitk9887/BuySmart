import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int x = 1;
    String name = "Sumit";
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
          child: Container(
        child: Text("$name is making his $x Flutter Program"),
      )),
      drawer: Drawer(),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int x = 1;
    String name = "Sumit";
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Catalog App"),
          ),
          body: Center(
              child: Container(
            child: Text("$name is making his $x Flutter Program"),
          )),
          drawer: MyDrawer(),
        ));
  }
}

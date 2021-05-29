import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  final String name = "Codepur";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    //from local json
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");

    //from network
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;

    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, _, __) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Vx.gray200,
            size: 22,
            count: _cart.items.length,
            textStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Catalog App",
          style: TextStyle(color: context.accentColor),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              ? ListView.builder(
                  itemCount: CatalogModel.items.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(item: CatalogModel.items[index]);
                  },
                )
              : Center(child: CircularProgressIndicator())),
      drawer: MyDrawer(),
    );
  }
}

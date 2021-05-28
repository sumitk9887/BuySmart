import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:flutter_catalog/models/cart.dart';

class HomeDetailPage extends StatelessWidget {
  final Item item;

  const HomeDetailPage({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        centerTitle: true,
        title: "Details".text.color(context.accentColor).make(),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: Key(item.id.toString()),
              child: Image.network(item.image),
            ).h40(context),
            Expanded(
              child: VxArc(
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                height: 30.0,
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child: Column(
                    children: [
                      item.name.text.xl3.bold.make(),
                      item.desc.text.textStyle(context.captionStyle).xl.make(),
                    ],
                  ).py(40),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${item.price}".text.xl3.bold.red900.make(),
            _AddToCart(item: item).wh(120, 45)
          ],
        ).p12(),
      ),
    );
  }
}

class _AddToCart extends StatefulWidget {
  final Item item;

  const _AddToCart({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  __AddToCartState createState() => __AddToCartState();
}

class __AddToCartState extends State<_AddToCart> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.item);
        setState(() {});
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isAdded ? Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}

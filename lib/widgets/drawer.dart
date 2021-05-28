import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  final imageUrl = "https://avatars.githubusercontent.com/u/43931043?v=4";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: context.canvasColor,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: context.canvasColor),
                accountName: Text(
                  "Sumit",
                  style: TextStyle(color: context.theme.buttonColor),
                ),
                accountEmail: Text("sumit.k9887@gmail.com",
                    style: TextStyle(color: context.theme.buttonColor)),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_box,
                color: context.theme.buttonColor,
              ),
              title: Text(
                "Account",
                style: TextStyle(color: context.theme.buttonColor),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.mail,
                color: context.theme.buttonColor,
              ),
              title: Text(
                "Mail",
                style: TextStyle(color: context.theme.buttonColor),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.phone,
                color: context.theme.buttonColor,
              ),
              title: Text(
                "Contact",
                style: TextStyle(color: context.theme.buttonColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}

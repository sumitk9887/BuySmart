import 'dart:html';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Image.asset("assets/images/login_image.png"),
          SizedBox(height: 20),
          Text(
            "Welcome To Login Page",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Column(children: [
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Username", hintText: "Enter username"),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Password", hintText: "Enter password"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    print("login");
                  },
                  child: Text("Login"))
            ]),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String user = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/login_image.png"),
              SizedBox(height: 20),
              Text(
                "Welcome $user",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(children: [
                  TextFormField(
                    onChanged: (value) {
                      user = value;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        labelText: "Username", hintText: "Enter username"),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Password cannot be empty";
                      }
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password", hintText: "Enter password"),
                    validator: (value) {
                      if (value.length < 6) {
                        return "Length cannot be less than 6";
                      } else if (value.isEmpty) {
                        return "Password cannot be empty";
                      }
                    },
                  ),
                  SizedBox(height: 40),

                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        alignment: Alignment.center,
                        height: 45,
                        width: changeButton ? 50 : 120,
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  )

                  // ElevatedButton(
                  //     style: TextButton.styleFrom(minimumSize: Size(120, 45)),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //     },
                  //     child: Text("Login"))
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

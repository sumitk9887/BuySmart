import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

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
      color: context.canvasColor,
      child: SafeArea(
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
                      color: context.accentColor),
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
                      color: context.theme.buttonColor,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          alignment: Alignment.center,
                          width: changeButton ? 50 : 150,
                          height: 50,
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
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Material(
                      color: context.theme.buttonColor,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, MyRoutes.signupRoute),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          alignment: Alignment.center,
                          width: 150,
                          height: 50,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    // ElevatedButton(
                    //     style: TextButton.styleFrom(
                    //         minimumSize: Size(120, 45),
                    //         backgroundColor: context.theme.buttonColor),
                    //     onPressed: () {
                    //       Navigator.pushNamed(context, MyRoutes.signupRoute);
                    //     },
                    //     child: Text("Sign Up"))
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

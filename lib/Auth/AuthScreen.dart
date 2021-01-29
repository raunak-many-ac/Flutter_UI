import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myproject/Auth/SignUpForm.dart';
import 'package:myproject/Auth/LoginForm.dart';
import 'package:myproject/Auth/google_signin.dart';
import 'package:myproject/HomePage.dart';

class AuthScreen extends StatefulWidget {

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  bool _signUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'My Project',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                _signUp ? SignUpForm(setSignUp) : LoginForm(setSignUp),
                Center(
                  child: RaisedButton(
                    elevation: 20,
                    child: Text('google Sign In'),
                    onPressed: () => signIn(context),
                  ),
                ),
              ],
            )));
  }

  void setSignUp(bool signup){
    setState(() {
      _signUp = signup;
    });
  }

  void signIn(BuildContext context) async {
    if (await googleSignIn()) goToHomeScreen(context);
  }

  //..pop current screen and go to another one
  void goToHomeScreen(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(title: 'Flutter Demo Home Page')));
  }
}

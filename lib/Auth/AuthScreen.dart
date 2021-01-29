import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myproject/Auth/google_signin.dart';
import 'package:myproject/HomePage.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          elevation: 20,
          child: Text('google Sign In'),
          onPressed: () => signIn(context),
        ),
      ),
    );
  }

  void signIn(BuildContext context) async{
    if(await googleSignIn())
      goToHomeScreen(context);
  }

  //..pop current screen and go to another one
  void goToHomeScreen(BuildContext context){
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(title: 'Flutter Demo Home Page'))
    );
  }

}

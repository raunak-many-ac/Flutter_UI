import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;

Future<User> signin(
    String email, String password, BuildContext context) async {
  try {
    UserCredential result =
    await auth.signInWithEmailAndPassword(email: email, password: password);
    User user = result.user;
    // return Future.value(true);
    return Future.value(user);
  } catch (e) {
    // simply passing error code as a message
    print(e.code);
    switch (e.code) {
      case "invalid-email":
        showErrDialog(context, "Invalid Email");
        break;
      case "wrong-password":
        showErrDialog(context, "Invalid Password");
        break;
      case 'user-not-found':
        showErrDialog(context, "No such user exists");
        break;
      case "user-disabled":
        showErrDialog(context, "User is now disabled");
        break;
      default:
        showErrDialog(context, "Something went wrong");
        break;

    }
    return Future.value(null);
  }
}

Future<User> signUp(
    String email, String password, BuildContext context) async {
  try {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: email);
    User user = result.user;
    return Future.value(user);
    // return Future.value(true);
  } catch (error) {
    switch (error.code) {
      case "email-already-in-use":
        showErrDialog(context, "Email Already Exists");
        break;
      case "invalid-email":
        showErrDialog(context, "Invalid Email Address");
        break;
      case "weak-password":
        showErrDialog(context, "Please Choose a stronger password");
        break;
    }
    return Future.value(null);
  }
}


showErrDialog(BuildContext context, String err) {
  //..keyboard remove
  FocusScope.of(context).requestFocus(new FocusNode());
  return showDialog(
    context: context,
    child: AlertDialog(
      title: Text("Error"),
      content: Text(err),
      actions: <Widget>[
        OutlineButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Ok"),
        ),
      ],
    ),
  );
}
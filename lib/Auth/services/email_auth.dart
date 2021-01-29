import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;

Future<User> signin(
    String email, String password, BuildContext context) async {
  try {
    UserCredential result =
    await auth.signInWithEmailAndPassword(email: email, password: email);
    User user = result.user;
    // return Future.value(true);
    return Future.value(user);
  } catch (e) {
    // simply passing error code as a message
    print(e.code);
    switch (e.code) {
      case "invalid-email":
        showErrDialog(context, e.code);
        break;
      case "wrong-password":
        showErrDialog(context, e.code);
        break;
      case 'user-not-found':
        showErrDialog(context, e.code);
        break;
      case "user-disabled":
        showErrDialog(context, e.code);
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
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        showErrDialog(context, "Email Already Exists");
        break;
      case 'ERROR_INVALID_EMAIL':
        showErrDialog(context, "Invalid Email Address");
        break;
      case 'ERROR_WEAK_PASSWORD':
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
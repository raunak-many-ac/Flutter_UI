import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final gooleSignIn = GoogleSignIn();

// a simple sialog to be visible everytime some error occurs
showErrDialog(BuildContext context, String err) {
  // to hide the keyboard, if it is still present
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

Future<bool> googleSignIn() async {
  final googleSignIn = GoogleSignIn();
  FirebaseAuth auth = FirebaseAuth.instance;

  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

  print("googleSignInAccount = "+googleSignInAccount.toString());

  if (googleSignInAccount != null) {
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result = await auth.signInWithCredential(credential);
    print("userdata = "+result.user.toString());

    User user = await auth.currentUser;
    print(user.uid);

    return Future.value(true);
  }

  return Future.value(false);
}

// instead of returning true or false
// returning user to directly access UserID
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
      case 'ERROR_INVALID_EMAIL':
        showErrDialog(context, e.code);
        break;
      case 'ERROR_WRONG_PASSWORD':
        showErrDialog(context, e.code);
        break;
      case 'ERROR_USER_NOT_FOUND':
        showErrDialog(context, e.code);
        break;
      case 'ERROR_USER_DISABLED':
        showErrDialog(context, e.code);
        break;
      case 'ERROR_TOO_MANY_REQUESTS':
        showErrDialog(context, e.code);
        break;
      case 'ERROR_OPERATION_NOT_ALLOWED':
        showErrDialog(context, e.code);
        break;
    }
    // since we are not actually continuing after displaying errors
    // the false value will not be returned
    // hence we don't have to check the valur returned in from the signin function
    // whenever we call it anywhere
    return Future.value(null);
  }
}

// change to Future<FirebaseUser> for returning a user
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

Future<bool> signOutUser() async {
  User user = auth.currentUser;
  print(user.providerData.toString());
  if (user.providerData[0].providerId == 'google.com') {
    print("googleSignIn disconnecting...");
    await gooleSignIn.disconnect();
  }
  await auth.signOut();
  return Future.value(true);
}
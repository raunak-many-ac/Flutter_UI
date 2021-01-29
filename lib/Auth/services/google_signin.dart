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
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myproject/Auth/services/Github/github_auth.dart';
import 'file:///C:/Users/admin/Flutter_projects/myproject/lib/Auth/widgets/SignUpForm.dart';
import 'file:///C:/Users/admin/Flutter_projects/myproject/lib/Auth/widgets/LoginForm.dart';
import 'file:///C:/Users/admin/Flutter_projects/myproject/lib/Auth/services/google_signin.dart';
import 'package:myproject/HomePage.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import "package:myproject/Auth/services/Github/github_auth.dart" as GithubAuthService;

/**
 * github sign in tutorial--> https://medium.com/flutter-community/flutter-firebase-github-authentication-990fe8731d9e
 */
class AuthScreen extends StatefulWidget {

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  StreamSubscription _subs;
  bool loader;
  final String _TAG = "AuthScreen: - ";

  @override
  void initState() {
    loader = false;
    super.initState();
    _initDeepLinkListener();
  }

  @override
  void dispose() {
    _disposeDeepLinkListener();
    super.dispose();
  }

  void _initDeepLinkListener() async {
    _subs = getLinksStream().listen((String link) {
      _checkDeepLink(link);
    }, cancelOnError: true);
  }

  void _checkDeepLink(String link) {
    if (link != null) {

      String code = link.substring(link.indexOf(RegExp('code=')) + 5);
      print(_TAG+" _checkDeepLink() -> code ="+ code);
      GithubAuthService.loginWithGitHub(code)
          .then((firebaseUser) {
        print(_TAG+""+firebaseUser.email);
        print(_TAG+""+firebaseUser.photoURL);
        print("LOGGED IN AS: " + firebaseUser.displayName);
        goToHomeScreen(context);
      }).catchError((e) {
        print(_TAG+"LOGIN ERROR: " + e.toString());
      });

    }
  }

  void _disposeDeepLinkListener() {
    if (_subs != null) {
      _subs.cancel();
      _subs = null;
    }
  }

  void onClickGitHubLoginButton() async {
    const String url = "https://github.com/login/oauth/authorize" +
        "?client_id=" + GITHUB_CLIENT_ID +
        "&scope=public_repo%20read:user%20user:email";

    if (await canLaunch(url)) {
      setState(() {
        loader = true;
      });
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      setState(() {
        loader = false;
      });
      print("CANNOT LAUNCH THIS URL!");
    }
  }

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
                _signUp ? SignUpForm(setSignUp, goToHomeScreen, context) : LoginForm(setSignUp, goToHomeScreen, context),
                Center(
                  child: RaisedButton(
                    elevation: 20,
                    child: Text('google Sign In'),
                    onPressed: () => onClickGitHubLoginButton(),
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





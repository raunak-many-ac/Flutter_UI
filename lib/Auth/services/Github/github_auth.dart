import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:myproject/Auth/services/Github/models/GithubLoginRequest.dart';
import 'package:myproject/Auth/services/Github/models/GithubLoginResponse.dart';

const String GITHUB_CLIENT_ID = "b7fe484d9e5366c4f021";
const String GITHUB_CLIENT_SECRET = "5a012f948fe3afc65e8cb18f0744902cd847f5df";

final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
final String _TAG = "GithubAuthService: - ";

Future<auth.User> loginWithGitHub(String code) async {
  //ACCESS TOKEN REQUEST
  print(_TAG+" loginWithGitHub()...");

  final response = await http.post(
    "https://github.com/login/oauth/access_token",
    headers: {"Content-Type": "application/json", "Accept": "application/json"},
    body: jsonEncode(GitHubLoginRequest(
      clientId: GITHUB_CLIENT_ID,
      clientSecret: GITHUB_CLIENT_SECRET,
      code: code,
    )),
  );

  print(_TAG+" response = "+response.body.toString());

  GitHubLoginResponse loginResponse =
      GitHubLoginResponse.fromJson(json.decode(response.body));

  //FIREBASE SIGNIN, set credentials to firebase
  final auth.AuthCredential credential =
      auth.GithubAuthProvider.credential(loginResponse.accessToken);

  final auth.User user =
      (await _firebaseAuth.signInWithCredential(credential)).user;

  print(_TAG+"returning user = "+user.toString());
  return user;
}

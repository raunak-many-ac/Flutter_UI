import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproject/Auth/services/email_auth.dart';

TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

Widget SignUpForm(
    Function setSignUp, Function goToHomeScreen, BuildContext context) {
  return Column(
    children: [
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: Text(
            'Sign Up',
            style: TextStyle(fontSize: 20),
          )),
      Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          controller: nameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'User Name',
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: TextField(
          obscureText: true,
          controller: passwordController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: TextField(
          obscureText: true,
          controller: confirmPasswordController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Confirm Password',
          ),
        ),
      ),
      Container(
          height: 50,
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          margin: EdgeInsets.only(top: 10),
          child: RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('SignUp'),
              onPressed: () => startSignUp(
                  nameController.text,
                  passwordController.text,
                  confirmPasswordController.text,
                  goToHomeScreen,
                  context))),
      Container(
          child: Row(
        children: <Widget>[
          Text('Have an account?'),
          FlatButton(
            textColor: Colors.blue,
            child: Text(
              'Login',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              setSignUp(false);
            },
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      )),
    ],
  );
}

void startSignUp(String email, String password, String confirmPassword,
    Function goToHomeScreen, BuildContext context) async {

  print("email = "+email);

  if(await signUp(email, password, context) != null)
    goToHomeScreen(context);

}

bool passwordVerified(String password1, String password2) =>
    password1.compareTo(password2) == 0;

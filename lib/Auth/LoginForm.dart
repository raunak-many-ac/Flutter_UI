import 'package:flutter/material.dart';
import 'package:myproject/Auth/AuthScreen.dart';

Widget LoginForm(Function setSignUp){
  return Column(
    children: [
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: Text(
            'Sign in',
            style: TextStyle(fontSize: 20),
          )),
      Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          // controller: nameController,
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
          // controller: passwordController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        ),
      ),
      FlatButton(
        onPressed: () {
          //forgot password screen
        },
        textColor: Colors.blue,
        child: Text('Forgot Password'),
      ),
      Container(
          height: 50,
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            child: Text('Login'),
            onPressed: () {
              // print(nameController.text);
              // print(passwordController.text);
            },
          )),
      Container(
          child: Row(
            children: <Widget>[
              Text('Does not have account?'),
              FlatButton(
                textColor: Colors.blue,
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  setSignUp(true);
                },
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )),
    ],
  );
}
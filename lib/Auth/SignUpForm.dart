import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget SignUpForm(Function setSignUp){
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
      Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: TextField(
          obscureText: true,
          // controller: passwordController,
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
            onPressed: () {

            },
          )),
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
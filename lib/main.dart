import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myproject/DataPlans.dart';
import 'package:myproject/RecommendedPlans.dart';
import "package:myproject/bottom_bar.dart";
import "package:myproject/Header.dart";


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu, size: 30.0, color: Colors.black),

        actions: [
          Icon(Icons.notifications_on_outlined, size: 30.0, color: Colors.black),
          Container(
              height: 30.0,
              width: 30.0,
              margin: EdgeInsets.only(right: 15, left: 10),
              child: SvgPicture.asset("assets/profile.svg")
          ),
        ],
      ),
      body:  Column(
          children: [
            Header(),
            DataPlans(),

          ],
        ),

      bottomNavigationBar: BottomBar(),
      );// This trailing comma makes auto-formatting nicer for build methods.
  }
}

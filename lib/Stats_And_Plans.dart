import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stats_And_Plans extends StatefulWidget {
  @override
  _Stats_And_PlansState createState() => _Stats_And_PlansState();
}

class _Stats_And_PlansState extends State<Stats_And_Plans> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(top: 10),
      physics: BouncingScrollPhysics(),
      child: Container(
        height: 100,
        child: Row(
          children: [
            Item(),
            Item(),
            Item(),
            Item(),
          ],
        ),
      ),
    );
  }

  Widget Item() {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 2.3,
      child: Card(
        elevation: 5,
        color: Color.fromRGBO(59, 65, 226, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                "GOSURF1299",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Center(
              child: Text(
                "30 Days 15GB Data",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

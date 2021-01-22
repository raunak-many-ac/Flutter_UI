import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendedPlans extends StatefulWidget {
  @override
  _RecommendedPlansState createState() => _RecommendedPlansState();
}

class _RecommendedPlansState extends State<RecommendedPlans> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommended",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "View all",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(top: 10),
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height/10,
            child: Row(
              children: [
                Item(),
                Item(),
                Item(),
                Item(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget Item() {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 2.3,
      child: Card(
        elevation: 5,
        color: Color.fromRGBO(59, 65, 226, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: [
              Container(
                child: Align(
                  alignment: Alignment.topRight,
                  child: newText(),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "GOSMURFF1299",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "30 Days 15GB Data",
                  textAlign: TextAlign.start,
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget newText() {
    return Container(
      color: Color.fromRGBO(17, 198, 186, 1),
      height: MediaQuery.of(context).size.height / 45,
      width: MediaQuery.of(context).size.width / 12,
      child: Center(
        child: Text(
          "New",
          style: TextStyle(color: Colors.white, fontSize: 10),
        ),
      ),
    );
  }
}

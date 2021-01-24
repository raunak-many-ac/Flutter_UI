import 'package:flutter/material.dart';
import 'package:myproject/DataPlans/Carousal.dart';
import 'package:myproject/DataPlans/RecommendedPlans.dart';


class DataPlans extends StatefulWidget {
  @override
  _DataPlansState createState() => _DataPlansState();
}

class _DataPlansState extends State<DataPlans> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(241,244,255, 1),
      height: MediaQuery.of(context).size.height/1.9,
      child: Column(
        children: [
          Carousal(),
          RecommendedPlans(),
        ],
      ),
    );
  }
}

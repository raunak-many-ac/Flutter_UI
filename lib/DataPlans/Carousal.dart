import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Carousal extends StatefulWidget {
  @override
  _CarousalState createState() => _CarousalState();
}

class _CarousalState extends State<Carousal> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(top: 10),
      physics: BouncingScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height/3.5,
        child: Row(
          children: [
            Highlighted_Item(),
            Item(),
            Item(),
            Item(),
          ],
        ),
      ),
    );
  }

  Widget Item(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 2.3,
        child: Card(
          elevation: 5,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset("assets/videoplayer.svg"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Data Balance",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "5 GB",
                      textAlign: TextAlign.start,
                      style:
                      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "of 8 GB",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Highlighted_Item(){
    return Container(

      width: MediaQuery.of(context).size.width / 2.3,
      child: Card(
        elevation: 5,
        color: Color.fromRGBO(54,60,213,1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset("assets/videoplayer.svg"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Data Balance",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "300 MB",
                    textAlign: TextAlign.start,
                    style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "of 12 GB",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w200),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

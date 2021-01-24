import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Promos extends StatefulWidget {
  @override
  _PromosState createState() => _PromosState();
}

class _PromosState extends State<Promos> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color.fromRGBO(48, 35, 174, 1),
      Color.fromRGBO(200, 109, 215, 1)
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Special Promos',
              textAlign: TextAlign.start,
              style: new TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = linearGradient),
            ),
            card_with_backgroundImage()
          ],
        ),
      ),
    );
  }

  Widget card_with_backgroundImage() =>  Padding(
    padding: const EdgeInsets.only(right: 8.0, top: 20),
    child: Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: [ Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "GoSakto",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.grey,
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Create What Matters",
                      textAlign: TextAlign.start,
                      style:
                      TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Promo that’s all you! ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w300,),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        "Create your own Promo",
                        textAlign: TextAlign.start,
                        style:
                        TextStyle(color: Colors.white,
                            fontSize: 20),
                      ),
                      Icon(Icons.keyboard_arrow_right, size: 35.0, color: Colors.white)
                    ],
                  )
              ),
            ),
          )
        ],
      ),
    ),
  );

}

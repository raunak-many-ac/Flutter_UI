import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return
     Container(
        height: MediaQuery.of(context).size.height/13,
        // color: Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("My Prepaid", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("9986532835", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    Icon(Icons.keyboard_arrow_down_outlined, size: 30,)
                  ],
                ),
                Icon(Icons.add)
              ],
            )
          ],
        ),

    );
  }
}

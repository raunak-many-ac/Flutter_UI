import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatefulWidget {
  BottomBar();

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int currentTab = 0;

  void showMobile() {
    setState(() {
      currentTab = 0;
    });
  }

  void showLifeStyle() {
    setState(() {
      currentTab = 1;
    });
  }

  void showWallet() {
    setState(() {
      currentTab = 2;
    });
  }

  void showMore() {
    setState(() {
      currentTab = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        notchMargin: 6.0,
        color: Colors.transparent,
        elevation: 9.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
            height: 50.0,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: showMobile,
                    child: Container(
                      height: 30.0,
                      width: MediaQuery.of(context).size.width / 4 - 40.0,
                      child: currentTab == 0 ? SvgPicture.asset("assets/mobile_active.svg") : SvgPicture.asset("assets/mobile_inactive.svg")
                    ),
                  ),
                  MaterialButton(
                    onPressed: showLifeStyle,
                    child: Container(
                        height: 30.0,
                        width: MediaQuery.of(context).size.width / 4 - 40.0,
                        child: currentTab == 1 ? SvgPicture.asset("assets/lifestyle_active.svg") : SvgPicture.asset("assets/lifestyle_inactive.svg") //Icon(Icons.search, color: Color(0xFF676E79)),
                    ),
                  ),
                  MaterialButton(
                    onPressed: showWallet,
                    child: Container(
                        height: 30.0,
                        width: MediaQuery.of(context).size.width / 4 - 40.0,
                        child: currentTab == 2 ? SvgPicture.asset("assets/wallet_active.svg") : SvgPicture.asset("assets/wallet_inactive.svg")
                    ),
                  ),
                  MaterialButton(
                    onPressed: showMore,
                    child: Container(
                        height: 30.0,
                        width: MediaQuery.of(context).size.width / 4 - 40.0,
                        child: currentTab == 3 ? SvgPicture.asset("assets/more_active.svg") : SvgPicture.asset("assets/more_inactive.svg")
                    ),
                  ),
                ])));
  }
}
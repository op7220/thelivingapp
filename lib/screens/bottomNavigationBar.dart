import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterlivingapp/styles/color.dart';
import 'package:flutterlivingapp/styles/color.dart';
import 'package:flutterlivingapp/styles/constant_values.dart';
import 'package:flutterlivingapp/styles/images.dart';
import 'package:flutterlivingapp/styles/size_config.dart';
import 'package:flutterlivingapp/styles/text_style.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomNav extends StatefulWidget {
  int indexPage;

  BottomNav({Key key, this.indexPage}) : super(key: key);

  @override
  BottomNavState createState() {
    return new BottomNavState(page: indexPage);
  }
}

class BottomNavState extends State<BottomNav> {
  bool connectionResult = false;
  int page;
  BuildContext _context;
  List<BottomNavigationBarItem> bottomBarItem = [];
  int index = i_0;

  BottomNavState({Key key, this.page}) {
    bottomBarItem.add(BottomNavigationBarItem(
        icon: Container(
          height:SizeConfig.widthMultiplier>400?d_35:d_20,
          width: SizeConfig.widthMultiplier>400?d_35:d_20,
          alignment: Alignment.bottomCenter,
          child: love,
        ),
        title: Text("")));

    bottomBarItem.add(BottomNavigationBarItem(
        icon: Container(
          height:SizeConfig.widthMultiplier>400?d_35:d_20,
          width: SizeConfig.widthMultiplier>400?d_35:d_20,
          alignment: Alignment.bottomCenter,
          child: navigation,
        ),
        title: Text("")));

    bottomBarItem.add(BottomNavigationBarItem(
        icon: Container(
          height:SizeConfig.widthMultiplier>400?d_35:d_20,
          width: SizeConfig.widthMultiplier>400?d_35:d_20,
          alignment: Alignment.bottomCenter,
          child: business,
        ),
        title: Text("")));

    bottomBarItem.add(BottomNavigationBarItem(
        icon: Container(
          height:SizeConfig.widthMultiplier>400?d_35:d_20,
          width: SizeConfig.widthMultiplier>400?d_35:d_20,
          child: shopping,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(top: d_2),
        ),
        title: Text("")));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _checkConnection();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    _context=context;
    return Container(
      child: BottomNavigationBar(
        showSelectedLabels: false,
        selectedFontSize: d_14,
        unselectedFontSize: d_14,
        currentIndex: index,
        onTap: onTabTaped,
        items: bottomBarItem,
        fixedColor: Colors.white,
        backgroundColor: bg_color,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  onTabTaped(int value) {
    setState(() {
      index = value;
    });
    if (index == i_1) {
    } else {}
  }
}

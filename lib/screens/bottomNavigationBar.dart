import 'package:flutter/material.dart';
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
          height:SizeConfig.widthMultiplier>400?d_30:d_20,
          width: SizeConfig.widthMultiplier>400?d_30:d_20,
          child: love,
        ),
        title: Text("")));

    bottomBarItem.add(BottomNavigationBarItem(
        icon: Container(
          height:SizeConfig.widthMultiplier>400?d_30:d_20,
          width: SizeConfig.widthMultiplier>400?d_30:d_20,
          child: navigation,
        ),
        title: Text("")));

    bottomBarItem.add(BottomNavigationBarItem(
        icon: Container(
          height:SizeConfig.widthMultiplier>400?d_30:d_20,
          width: SizeConfig.widthMultiplier>400?d_30:d_20,
          child: business,
        ),
        title: Text("")));

    bottomBarItem.add(BottomNavigationBarItem(
        icon: Container(
          height:SizeConfig.widthMultiplier>400?d_30:d_20,
          width: SizeConfig.widthMultiplier>400?d_30:d_20,
          child: shopping,
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
      height: SizeConfig.widthMultiplier>400?d_60:d_52,
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

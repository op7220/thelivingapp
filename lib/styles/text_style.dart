import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlivingapp/styles/color.dart';
import 'package:flutterlivingapp/styles/size_config.dart';

import 'constant_values.dart';
class AppStyle {
  AppStyle._();

//text_style
  TextStyle style1 = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black);
 static final headerStyle = TextStyle(
      fontSize: 3.2 * SizeConfig.textMultiplier,color: Colors.white, fontWeight: FontWeight.w600);
  static final editTextFont = TextStyle(
      fontSize: 2.5 * SizeConfig.textMultiplier,color: Colors.white, fontWeight: FontWeight.w400);
  static final subHeaderStyle = TextStyle(
      fontSize: 2.8* SizeConfig.textMultiplier,color: Colors.white, fontWeight: FontWeight.w400);
  static final labelTextStyle = TextStyle(
      fontSize: 2.6* SizeConfig.textMultiplier, color: Colors.white, fontWeight: FontWeight.w400,decoration: TextDecoration.underline);
  static final commonTextStyle = TextStyle(
      fontSize: d_14, color: greyishBrown, fontWeight: FontWeight.w600);
  static final newsHeadingTextStyle = TextStyle(
      fontSize: d_18, fontWeight: FontWeight.w700);
  static final newsContentTextStyle = TextStyle(fontSize: d_14, color: Colors.black,);
  static  final timeDateTextStyle = TextStyle(fontSize: d_12, color: greyishBrown);

}



//margin





//padding
EdgeInsetsGeometry pd_0=const EdgeInsets.all(0.0);
EdgeInsetsGeometry pd_2=const EdgeInsets.all(2.0);
EdgeInsetsGeometry pd_4=const EdgeInsets.all(4.0);
EdgeInsetsGeometry pd_5=const EdgeInsets.all(5.0);
EdgeInsetsGeometry pd_8=const EdgeInsets.all(8.0);
EdgeInsetsGeometry pd_10=const EdgeInsets.all(10.0);
EdgeInsetsGeometry pd_15=const EdgeInsets.all(15.0);
EdgeInsetsGeometry pd_18=const EdgeInsets.all(18.0);
EdgeInsetsGeometry pd_20=const EdgeInsets.all(20.0);
EdgeInsetsGeometry pd_25=const EdgeInsets.all(25.0);
EdgeInsetsGeometry pd_50=const EdgeInsets.all(50.0);
EdgeInsetsGeometry pd_25_25_10_0=const EdgeInsets.fromLTRB(25.0, 25.0, 10.0, 0.0);
EdgeInsetsGeometry pd_25_25_25_40=const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 45.0);
EdgeInsetsGeometry pd_25_25_25_50=const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 48.0);
EdgeInsetsGeometry pd_35_25_35_50=const EdgeInsets.fromLTRB(35.0, 25.0, 35.0, 50.0);
EdgeInsetsGeometry pdTop_5=const EdgeInsets.only(top: 5.0);
EdgeInsetsGeometry pdTop_10=const EdgeInsets.only(top: 10.0);
EdgeInsetsGeometry pdLeft_15=const EdgeInsets.only(left: 15.0);
EdgeInsetsGeometry pdLeftRight_10=const EdgeInsets.only(left: 10.0, right: 10.0);
EdgeInsetsGeometry pdLeftRight_8=const EdgeInsets.only(left: 8.0, right: 8.0);
EdgeInsetsGeometry pd_20_0_0_0=const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0);
EdgeInsetsGeometry pd_10_0_10_0=const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0);
EdgeInsetsGeometry pd_20_25_20_25=const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0);
EdgeInsetsGeometry pd_35_40_35_40=const EdgeInsets.fromLTRB(35, 40, 35, 40);
EdgeInsetsGeometry pd_26_22_26_0=const EdgeInsets.fromLTRB(26, 22, 26, 00);
EdgeInsetsGeometry pd_20_20_20_0=const EdgeInsets.fromLTRB(20, 20, 20, 00);
EdgeInsetsGeometry pd_20_10_20_20=const EdgeInsets.fromLTRB(20, 10, 20, 20);
EdgeInsetsGeometry pd_15_15_15_0=const EdgeInsets.fromLTRB(15, 15, 15, 0);
EdgeInsetsGeometry pd_15_30_15_30=const EdgeInsets.fromLTRB(15, 30, 15, 30);
EdgeInsetsGeometry pd_25_0_25_0=const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0);
EdgeInsetsGeometry pd_20_15_20_15=const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0);
EdgeInsetsGeometry pd_15_0_15_15=const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0);

//margin
EdgeInsetsGeometry marg_10=const EdgeInsets.only(left: 10.0);
EdgeInsetsGeometry marg_30=const EdgeInsets.only(right: 30.0);
EdgeInsetsGeometry marg_30_top=const EdgeInsets.only(top: 30.0);
EdgeInsetsGeometry marg_10_right=const EdgeInsets.only(right: 10.0);
EdgeInsetsGeometry marg_20_top=const EdgeInsets.only(top: 20.0);







//BorderRadius
BorderRadius br_20=BorderRadius.circular(20.0);
BorderRadius brAll_20=BorderRadius.all(Radius.circular(20.0));
BorderRadius brAll_10= BorderRadius.all(Radius.circular(10.0));
BorderRadius brAll_15=BorderRadius.all(Radius.circular(15.0));
BorderRadius brAll_4=BorderRadius.all(Radius.circular(4.0));

import 'package:flutter/material.dart';
import 'package:vault_app/utils/dimensions.dart';

class Styles {
  //Colors
  static Color black = Colors.black;
  static Color white = Colors.white;
  static Color lightGrey = const Color(0xFFF0F0F0);
  static Color darkGrey = const Color(0xFF171717);
  static Color darkBlue = const Color(0xFF0A2342);
  static Color verdigris = const Color(0xFF3AAFB9);
  static Color brightBlue = const Color(0xFF64E9EE);
  static Color fernGreen = const Color(0xFF556F44);
  static Color red = const Color(0xFFC41E3A);

  static Color codeBtnColor = lightGrey;

  //TextStyles
  static TextStyle bigThinTextStyle = TextStyle(
    fontSize: Dimensions.bigThinfontSize,
    color: black
  );
  static TextStyle bigBoldTextStyle = TextStyle(
    fontSize: Dimensions.bigBoldfontSize,
    fontWeight: FontWeight.w700,
    color: black
  );
  static TextStyle normalBoldTextStyle = TextStyle(
    fontSize: Dimensions.normalBoldfontSize,
    color: black,
    fontWeight: FontWeight.w500
  );
  static TextStyle smallTextStyle = TextStyle(
    fontSize: Dimensions.smallfontSize,
    color: black,
  );
  static TextStyle bigPasswordTextStyle = TextStyle(
    fontSize: Dimensions.bigPasswordfontSize,
    color: black,
    fontWeight: FontWeight.bold
  );
  static TextStyle bigPasswordAlphaTextStyle = TextStyle(
    color: darkBlue,
  );
  static TextStyle bigPasswordNumTextStyle = TextStyle(
    color: brightBlue,
  );
  static TextStyle bigPasswordSymbTextStyle = TextStyle(
    color: fernGreen,
  );
}
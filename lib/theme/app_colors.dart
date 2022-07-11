import 'package:flutter/material.dart';

class ColorConstants {
  //App primary color
  static Color primaryColor = fromHex("#d3e1af");
  static Color buttonColor = fromHex("#bdd386");

  static Color lightBlueColor = fromHex("#8bc8db");
  static Color extraLightBlueColor = fromHex("#b1d9e7");
  static Color whiteColor = Colors.white;
  static Color redColor = Colors.red;
  static Color lightRedColor = fromHex("#f87e78");
  static Color whiteHexColor = fromHex("#FCFCFD");

  //FONT COLOR
  static Color grayColor = fromHex("#d4d4d4");
  static Color lightOrangeColor = fromHex("#f7ba7b");
  static Color extralightyellowColor = fromHex("#fad1a9");
  static Color darkgrayColor = fromHex("#545454");
  static Color primaryTextColor = fromHex("#99b540");
  static Color blackFontColor = fromHex("#344054");
  static Color gray500Color = fromHex("#c6c6c6");
  static Color darkGrayColor = fromHex("#aaaaaa");
  static Color blackColor = Colors.black;
  static Color lightGreenColor = fromHex("#9CCC65");
  static Color borderColor = fromHex("#afafaf");
  static Color onTapHilightColor = const Color.fromRGBO(15, 105, 180, 0.2);
}
Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
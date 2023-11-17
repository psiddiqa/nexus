import 'package:flutter/material.dart';
import 'package:nedusoft/Utils/Colors.dart';

class ColorNotifire with ChangeNotifier {
  bool isDark = false;
  set setIsDark(value) {
    isDark = value;
    notifyListeners();
  }

  get getIsDark => isDark;
  get getbgcolor => isDark ? darkmode : bgcolor; //background color
  get getdarkmodecolor => isDark ? boxcolor : WhiteColor; //containar color
  get getlightblackcolor => isDark ? boxcolor : lightBlack2;

  get getwhiteblackcolor =>
      isDark ? WhiteColor : BlackColor; //text defultsystemicon imageicon color

  get getgreycolor => isDark ? greycolor : greycolor;
  get getwhitebluecolor => isDark ? WhiteColor : Darkblue;
  get getblackgreycolor => isDark ? lightBlack2 : greycolor;

  get getcardcolor => isDark ? darkmode : WhiteColor;
  get getgreywhite => isDark ? WhiteColor : greycolor;
  get getredcolor => isDark ? RedColor : RedColor;
  get getprocolor => isDark ? yelloColor : yelloColor;
  get getblackwhitecolor => isDark ? BlackColor : WhiteColor;
  get getlightblack => isDark ? lightBlack2 : lightBlack2;
  get getbuttonscolor => isDark ? lightgrey : lightgrey;
  get getbuttoncolor => isDark ? greycolor : onoffColor;
  get getdarkbluecolor => isDark ? Darkblue : Darkblue;
  get getdarkscolor => isDark ? BlackColor : bgcolor;
  get getdarkwhitecolor => isDark ? WhiteColor : WhiteColor;
}

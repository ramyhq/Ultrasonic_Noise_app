import 'package:flutter/material.dart';

const Color appBackGroundColor1 = Color(0xffffcc00);
const Color fontColor1 = Color(0xff333333);
const Color fontColor2 = Color(0xffffffff);

const Color sliderColor1 = Color(0xffffffff);
const Color sliderColor2 = Color(0xffffcc00);

TextStyle kMoodTitleStyle = const TextStyle(
  fontSize: 20,
  color: fontColor1,
  fontWeight: FontWeight.bold
);
TextStyle kListTitle = const TextStyle(
  fontSize: 20,
  color: fontColor2,
  fontWeight: FontWeight.bold,
);
TextStyle kAppBarTitle = const TextStyle(
  fontSize: 20,
  color: fontColor2,
  fontWeight: FontWeight.bold,
);
TextStyle kListsubtile = const TextStyle(
  fontSize: 13,
  color: fontColor2,
  fontWeight: FontWeight.w500,
);
//Slider
TextStyle kSliderValue = const TextStyle(
  fontSize: 10,
  color: fontColor2,
  fontWeight: FontWeight.w500,
);
TextStyle kSliderValue2 = const TextStyle(
  fontSize: 13,
  color: fontColor2,
  fontWeight: FontWeight.w800,
);
//Drawer
TextStyle kDrawerItemStyle = const TextStyle(
  fontSize: 18,
  color: fontColor2,
  fontWeight: FontWeight.w700,
);
SliderThemeData sliderTheme = SliderThemeData(
  activeTrackColor: sliderColor2,
  inactiveTrackColor: Colors.black87,
  activeTickMarkColor: Colors.black,
  inactiveTickMarkColor: Colors.white,
  thumbColor: sliderColor2,
  trackHeight: 15,
  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
  overlayColor: Colors.red.withOpacity(0.8),
  overlayShape: const RoundSliderOverlayShape(overlayRadius: 35.0),
    valueIndicatorTextStyle: const TextStyle(
        color: sliderColor2, letterSpacing: 2.0,)
);


//About Me Page
TextStyle kAboutFont = const TextStyle(
  fontSize: 16,
  color: fontColor1,
  fontWeight: FontWeight.w700,
);
TextStyle kAboutAppFont2 = const TextStyle(
  fontSize: 14,
  color: fontColor1,
  fontWeight: FontWeight.w600,
);
TextStyle kAboutTitleFont3 = const TextStyle(
  fontSize: 30,
  color: fontColor1,
  fontWeight: FontWeight.w900,
);

//more apps Page
TextStyle kAppTitle = const TextStyle(
  fontSize: 25,
  color: fontColor1,
  fontWeight: FontWeight.w900,
);
import 'package:flutter/material.dart';

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
        headline: base.headline.copyWith(
          fontFamily: 'ObuyFont',
          fontSize: 16.0,
          color: Colors.white,
        ),
        title: base.title.copyWith(fontSize: 18.0, color: Colors.white),
        display1: base.headline.copyWith(
          fontFamily: 'ObuyFont',
          fontSize: 24.0,
          color: Colors.white,
        ),
        display2: base.headline.copyWith(
          fontFamily: 'ObuyFont',
          fontSize: 18.0,
          color: Colors.white,
        ),
        caption: base.caption.copyWith(
          fontFamily: 'ObuyFont',
          color: Colors.white,
        ),
        body1: base.body1.copyWith(
          fontFamily: 'ObuyFont',
          color: Colors.white,
        ),
        overline: base.overline.copyWith(
          color: Colors.white,
          fontFamily: 'ObuyFont',
        ));
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      primaryColor: Color(0xFFFDB000),
      indicatorColor: Colors.white,
      accentColor: Color(0xFFFFFFFF),
      iconTheme: IconThemeData(
        color: Color(0xFFFFFFFF),
        size: 20.0,
      ),
      buttonColor: Colors.white,
      backgroundColor: Colors.white,
      tabBarTheme: base.tabBarTheme.copyWith(
        labelColor: Color(0xFFD32F2F),
        unselectedLabelColor: Colors.white,
      ));
}

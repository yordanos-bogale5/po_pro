import 'package:flutter/material.dart';

class AppTheme {
  static String fontFamily = 'ProductSans';

  // static Color primaryColor = const Color(0xff833cf6);
  // static Color primaryColorDark = const Color(0xff461597);
  // static Color whiteColor = const Color(0xffffffff);
  // static Color blackColor = const Color(0xff000000);
  // static Color hintColor = const Color(0xffacafaf);
  // static Color lightBlackColor = const Color(0xff3c3c3d);
  // static Color greenButtonTopColor = const Color(0xff88e68b);
  // static Color greyTextColor = const Color(0xffc7c5cc);

  // static Color textFieldBorderColor = const Color(0xfffcfcfc);

  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    hintColor: const Color(0xffb3b3b3),
    highlightColor: Colors.white,
    primaryColor: const Color(0xffFFC336),
    primaryColorLight: const Color(0xffFEF675),
    // primaryColorDark: primaryColorDark,
    // fontFamily: fontFamily,
    // hintColor: hintColor,
    // primaryColor: primaryColor,
    // disabledColor: textFieldBorderColor,

    ///appBar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),

    ///text theme
    textTheme: const TextTheme(
      titleSmall: TextStyle(
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
      ),
      labelLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        color: Color(0xff53606b),
      ), //caption
    ),
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: const Color(0xff220708),
    ),
  );
}

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5

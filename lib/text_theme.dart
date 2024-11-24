


import 'package:projectmanagers/Constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


ThemeData themeData=_buildThemeTest1();






ThemeData _buildThemeTest1() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _test1ColorScheme,

    primaryColor: test1_color1_100,

    scaffoldBackgroundColor: test1_colorBackgroundWhite,
    cardColor: test1_colorBackgroundWhite,
    buttonTheme: const ButtonThemeData(
      colorScheme: _test1ColorScheme,
      textTheme: ButtonTextTheme.normal,
    ),
    primaryIconTheme: _customIconThemeTest1(base.iconTheme),
    textTheme: _buildTest1TextTheme(base.textTheme),
    primaryTextTheme: _buildTest1TextTheme(base.primaryTextTheme),

    iconTheme: _customIconThemeTest1(base.iconTheme),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: kColorsWhite,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
          color: test1_colorSurfaceWhite
      ),
      backgroundColor: test1_color1_100,
      titleTextStyle: TextStyle(fontFamily: 'Cairo',
          fontSize: 16.0.sp,
          // fontWeight: FontWeight.w300,
          color: test1_colorSurfaceWhite
      ),
    ),

    // primaryIconTheme:IconThemeData( color: kColorsBackground,) ,
    // focusColor: test1_color2_900,
    // hintColor: test1_color2_900,

    // primarySwatch: Colors.blue,

  );
}
TextTheme _buildTest1TextTheme(TextTheme base) {

  return base
      .copyWith(


    titleSmall: TextStyle(fontFamily: 'Cairo',
        fontSize: 16.0.sp,
        // fontWeight: FontWeight.w300,
        color: kColorsLightBlack
    ),

    titleMedium: TextStyle(fontFamily: 'Cairo',
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w500,
        color: kColorsLightBlack),
    titleLarge: TextStyle(fontFamily: 'Cairo',
        fontSize: 20.0.sp,
        fontWeight: FontWeight.bold,
        color: kColorsBlack),
    bodyMedium: TextStyle(fontFamily: 'Cairo',
        fontSize: 18.0.sp,
        fontWeight: FontWeight.w300,
        color: Colors.black),
    bodySmall: TextStyle(fontFamily: 'Cairo',
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w500,
        color:Colors.black),
    labelMedium:
    TextStyle(fontFamily: 'Cairo',fontSize: 14.0.sp, color: kColorsBlack),
    displaySmall: TextStyle(fontFamily: 'Cairo',fontSize: 12.0.sp, color: kColorsBlack, fontWeight: FontWeight.w300,),
    bodyLarge: TextStyle(fontSize: 10.0.sp, color: Colors.grey, fontWeight: FontWeight.w300,),
    // button: base.button?.copyWith(
    //     fontWeight: FontWeight.w500,
    //     fontSize: 14,
    //     letterSpacing: defaultLetterSpacing,
    //   ),
  )
      .apply(
    fontFamily: 'Cairo',
    displayColor: test1_color2_900,
    bodyColor: test1_color2_900,

  );
}
IconThemeData _customIconThemeTest1(IconThemeData original) {
  return original.copyWith(color: test1_color2_900);
}

const ColorScheme _test1ColorScheme = ColorScheme(
  primary: test1_color1_100,

  secondary: test1_color1_50,

  surface: test1_colorSurfaceWhite,
  background: test1_colorBackgroundWhite,
  error: test1_color_ErrorRed,
  onPrimary: test1_color2_900,
  onSecondary: test1_color2_900,
  onSurface: test1_color2_900,
  onBackground: test1_color2_900,
  onError: test1_colorSurfaceWhite,
  brightness: Brightness.light,
);

const Color test1_color1_50 = Color(0xFF158BAC);
const Color test1_color1_100 = Color(0xFF158BA4);
const Color test1_color1_300 = Color(0xFF036E92);
const Color test1_color1_400 = Color(0xFF005163);

const Color test1_color2_900 = Color(0xFF442B2D);
const Color test1_color2_600 = Color(0xFF7D4F52);

const Color test1_color_ErrorRed = Color(0xFFC5032B);

const Color test1_colorSurfaceWhite = Color(0xF5EEF1F8);
const Color test1_colorBackgroundWhite = Color(0xF5EEF1F8);




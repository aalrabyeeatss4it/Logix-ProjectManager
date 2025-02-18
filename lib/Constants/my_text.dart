
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Constants.dart';
class MyText{


  ///////////////////////////////////////////////////////////////////////////
  static TextStyle TitleAppBarePrimary(BuildContext context){
    return TextStyle(fontFamily: 'GraphikArabic',
        fontSize: 13.sp,
        color: kColorsPrimaryFont,
        fontWeight: FontWeight.bold);
  }
  ////////////////////////////////////////////////////////////
  static TextStyle TitleAppBareblack(BuildContext context){
    return TextStyle(fontFamily: 'GraphikArabic',
        fontSize: 14.sp,
        color: kColorsLightBlack,
        fontWeight: FontWeight.bold);
  }
  static TextStyle TitleLargeColorePrimary(BuildContext context){
    return TextStyle(fontFamily: 'GraphikArabic',
    fontSize: 19.sp,
     color: kColorsPrimaryFont,
     fontWeight: FontWeight.bold);
  }

  static TextStyle TitleMedumColorePrimary(BuildContext context){
    return TextStyle(fontFamily: 'GraphikArabic',
        fontSize: 16.sp,
        color: kColorsPrimaryFont,
        //fontWeight: FontWeight.bold
    );
  }

  static TextStyle TitleSmallColorePrimary(BuildContext context){
    return TextStyle(fontFamily: 'GraphikArabic',
        fontSize: 14.sp,
        color: kColorsPrimaryFont);
  }
  static TextStyle TitleSmallVeryColorePrimary(BuildContext context){
    return TextStyle(
        fontFamily: 'GraphikArabic',
        fontSize: 12.sp,
        color: kColorsPrimaryFont
    );
  }



  ////////////////////////////////////////////////

  static TextStyle TitleLargeblackPrimary(BuildContext context){
    return TextStyle(
        fontSize: 19.sp,
        fontFamily: 'GraphikArabic',
        color: Colors.black,
        fontWeight: FontWeight.bold);
  }
  static TextStyle TitleMedumblackPrimary(BuildContext context){
    return TextStyle(
        fontSize: 16.sp,
      fontFamily: 'GraphikArabic',
        color: Colors.black,

       );
  }
  static TextStyle TitleSmallblackPrimary(BuildContext context){
    return TextStyle(
        fontSize: 13.sp,
      fontFamily: 'GraphikArabic',
        color: Colors.black,
      //fontWeight: FontWeight.bold,
    );
  }
  static TextStyle TitleSmallVeryblackPrimary(BuildContext context){
    return TextStyle(
      fontSize: 11.sp,
      fontFamily: 'GraphikArabic',
      color: Colors.black,
      //fontWeight: FontWeight.bold,
    );
  }
///////////////////////////////////////////////////////////////////////////
  static TextStyle TitleLargeblackDrawer(BuildContext context){
    return TextStyle(
        fontSize: 18.sp,
        fontFamily: 'GraphikArabic',
        color: Colors.black
    );
  }
  static TextStyle TitleMedumblackDrawer(BuildContext context){
    return TextStyle(
        fontSize: 14.sp,
      fontFamily: 'GraphikArabic',
        color: Colors.black,
    );
  }
  static TextStyle TitleSmallblackDrawer(BuildContext context){
    return TextStyle(
        fontSize: 11.sp,
        fontFamily: 'GraphikArabic',
        color: Colors.black
    );
  }
  static TextStyle TitleSmallblacWizard(BuildContext context){
    return TextStyle(
        fontSize: 11.sp,
        fontFamily: 'GraphikArabic',
        color: kColorsLightBlack
    );
  }


///////////////////////////////////////////////////////////////////////////////

  static TextStyle TitleLargeRedPrimary(BuildContext context){
    return TextStyle(
        fontSize: 19.sp,
        fontFamily: 'GraphikArabic',
        color: Colors.red,
        fontWeight: FontWeight.bold);
  }
  static TextStyle TitleMedumRedPrimary(BuildContext context){
    return TextStyle(
        fontSize: 16.sp,
        color: Colors.red,
        fontFamily: 'GraphikArabic',
        fontWeight: FontWeight.bold);
  }


  static TextStyle TitleSmallRedPrimary(BuildContext context){
    return TextStyle(
        fontSize: 14.sp,
        fontFamily: 'GraphikArabic',
        color: Colors.red
    );
  }
  static TextStyle TitleSmallVeryRedPrimary(BuildContext context){
    return TextStyle(
        fontSize: 12.sp,
        fontFamily: 'GraphikArabic',
        color: Colors.red
    );
  }

////////////////////////////////////////////////////
  static TextStyle TitleLargeRedTow(BuildContext context){
    return TextStyle(
        fontSize: 19.sp,
        color: kColorsRedTow,
        fontFamily: 'GraphikArabic',
        fontWeight: FontWeight.bold);
  }
  static TextStyle TitleMedumRedTow(BuildContext context){
    return TextStyle(
        fontSize: 16.sp,
        fontFamily: 'GraphikArabic',
        color:kColorsRedTow,
        fontWeight: FontWeight.bold);
  }


  static TextStyle TitleSmallRedTow(BuildContext context){
    return TextStyle(
        fontSize: 14.sp,
        fontFamily: 'GraphikArabic',
        color:kColorsRedTow
    );
  }
  static TextStyle TitleSmallVeryRedTow(BuildContext context){
    return TextStyle(
        fontSize: 12.sp,
        fontFamily: 'GraphikArabic',
        color: kColorsRedTow
    );
  }
/////////////////////////////////////////////////////////////////////////////////////
  static TextStyle TitleLargeWhitePrimary(BuildContext context){
    return TextStyle(
        fontSize: 19.sp,
        fontFamily: 'GraphikArabic',
        color: kColorsWhite,
        fontWeight: FontWeight.bold);
  }
  static TextStyle TitleMedumWhitePrimary(BuildContext context) {
    return TextStyle(
        fontSize: 14.sp,
        fontFamily: 'GraphikArabic',
        color: kColorsWhite
    );
  }
  static TextStyle TitleSmallWhitePrimary(BuildContext context) {
    return TextStyle(
        fontSize: 15.sp,
        fontFamily: 'GraphikArabic',
        color: kColorsWhite
    );
  }
  static TextStyle TitleSmallVeryWhitePrimary(BuildContext context) {
    return TextStyle(
        fontSize: 12.sp,
        fontFamily: 'GraphikArabic',
        color: kColorsWhite
    );
  }


////////////////////////////////////////////////////////////////////////////////
  static TextStyle TitleTabBarWhiteunselected(BuildContext context) {
    return TextStyle(
        fontSize: 13,
        color:  Color(0xff5A86C1),
        fontWeight: FontWeight.bold,
      fontFamily: 'GraphikArabic',
    );
  }
  static TextStyle TitleTabBarWhiteselected(BuildContext context) {
    return TextStyle(
        fontSize: 13,
        color: kColorsPrimaryFont,
        fontFamily: 'GraphikArabic',
        fontWeight: FontWeight.bold);
  }






}
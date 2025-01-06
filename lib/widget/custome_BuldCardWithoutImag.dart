import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Constants/colors.dart';
import 'package:projectmanagers/Constants/text_styles.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
class BuldCardWithoutImag extends StatelessWidget {
  BuldCardWithoutImag({ this.Text1,this.Text1Colore,this.TextValue1,this.TextValue1Colore,this.Text2,this.Text2Colore,this.TextValue2,this.TextValue2Colore}) ;
  String? Text1 ;
  Color? Text1Colore;
  String? TextValue1 ;
  Color? TextValue1Colore;
  String? Text2;
  Color? Text2Colore;
  String? TextValue2;
  Color? TextValue2Colore;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:  8.0.r),
      child: Row(

        children: <Widget>[
          Container(
            width: 0.48.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              boxShadow: [
                BoxShadow(
                  color: kColorsLightBlackLow.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5.r,
                  offset:Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              color: Colors.white,
              elevation: 1,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:  10.0.r,vertical: 20.0.r),
                  child: Text(
                    TextValue1!,
                    style:   TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: TextValue1Colore,
                    ),
                  ),
                ),
                Container(width: 1.w),
                Text(
                  Text1!,
                  style:   TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Text1Colore,
                  ),
                ),
                Container(height: 0.03.sw),
              ]),
            ),
          ),
          Container(
            width: 0.48.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              boxShadow: [
                BoxShadow(
                  color: kColorsLightBlackLow.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5.r,
                  offset:Offset(0, 2), // changes position of shadow
                ),
              ],
              //color: Colors.cyan
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              color: Colors.white,
              elevation: 1,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:  10.0.r,vertical: 15.0.r),
                  child: Text(
                    TextValue2!,
                    style:   TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: TextValue2Colore,
                    ),
                  ),
                ),
                Container(width: 1.w),
                Text(
                  Text2!,
                  style:   TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Text2Colore,
                  ),
                ),

                Container(height: 0.03.sw),
              ]),
            ),
          ),
        ],
      ),
    ) ;
  }
}
class BuldCardWithoutImagShimere extends StatelessWidget {
  BuldCardWithoutImagShimere() ;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:  8.0.r),
        child: Row(

          children: <Widget>[
            Container(
              width: 0.48.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                boxShadow: [
                  BoxShadow(
                    color: kColorsLightBlackLow.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5.r,
                    offset:Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                color: Colors.white,
                elevation: 1,
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:  10.0.r,vertical: 15.0.r),
                    child: Text(
                     "",
                      style:   TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: kColorsWhite,
                      ),
                    ),
                  ),
                  Container(width: 1.w),
                  Text(
                    "",
                    style:   TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: kColorsWhite,
                    ),
                  ),
                  Container(height: 0.03.sw),
                ]),
              ),
            ),
            Container(
              width: 0.48.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                boxShadow: [
                  BoxShadow(
                    color: kColorsLightBlackLow.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5.r,
                    offset:Offset(0, 2), // changes position of shadow
                  ),
                ],
                //color: Colors.cyan
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r)),
                color: Colors.white,
                elevation: 1,
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:  10.0.r,vertical: 15.0.r),
                    child: Text(
                      "",
                      style:   TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: kColorsWhite,
                      ),
                    ),
                  ),
                  Container(width: 1.w),
                  Text(
                    "",
                    style:   TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: kColorsWhite,
                    ),
                  ),

                  Container(height: 0.03.sw),
                ]),
              ),
            ),
          ],
        ),
      ),
    ) ;
  }
}
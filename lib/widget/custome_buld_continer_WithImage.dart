import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Constants/colors.dart';
import 'package:projectmanagers/Constants/text_styles.dart';
class BuldContinerWithImage extends StatelessWidget {
  BuldContinerWithImage({ this.text,this.textColore,this.TextMount,this.TextMountColore,this.ColorLain,this.IconBerore,this.IconColore,this.BackIconColore}) ;
  String? text ;
  Color? textColore;
  String? TextMount;
  Color? TextMountColore;
  String? IconBerore;
  Color? IconColore;
  Color? BackIconColore;
  Color? ColorLain;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal:  17.0.r ),
          child: Container(
             // height: 0.13.sh,
            decoration: BoxDecoration(
              color: kColorsWhite,
              borderRadius: BorderRadius.circular(7.r),
              boxShadow: [
                BoxShadow(
                  color: kColorsLightBlackLow.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 5.r,
                  offset:Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:  25.0.r ,vertical: 22.r),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(

                      height: 0.05.sh,
                      width: 0.11.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7.r)),
                        color: BackIconColore,
                      ),

                      child: Padding(
                        padding:  EdgeInsets.all( 4.0.r),
                        child: Image.asset(IconBerore!,
                          width: 24.r,
                          height: 24.r,
                          color: IconColore,),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: Padding(
                      padding:  EdgeInsets.only(left: 2.0.r,right: 10.0.r),
                      child: Text(
                          text.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: kColorsBlack,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Stack(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: 14.r),
                          child: Container(
                            decoration: BoxDecoration(
                              color:  ColorLain,
                              borderRadius: BorderRadius.all(Radius.circular(15.r)),
                              //color: Colors.cyan
                            ),
                            height: 8.h,
                            width:0.14.sw ,

                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right:  15.0.r),
                          child: Text(
                              TextMount.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: TextMountColore,
                                fontWeight: FontWeight.bold,
                              )),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 17.0.h,
        ),
      ],
    ) ;
  }
}
class BuldContinerWithImageShimere extends StatelessWidget {
  BuldContinerWithImageShimere() ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal:  17.0.r),
          child: Container(

            decoration: BoxDecoration(
              color: kColorsWhite,
              borderRadius: BorderRadius.circular(7.r),
              boxShadow: [
                BoxShadow(
                  color: kColorsLightBlackLow.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 5.r,
                  offset:Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:  17.0.r),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 0.13.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7.r)),
                        color: kColorsWhite,
                      ),

                      child: Padding(
                        padding:  EdgeInsets.all( 6.0.r),
                        child: Container(
                          width: 25.w,
                          height: 25.h,
                          color: kColorsWhite,),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding:  EdgeInsets.only(left: 7.0.r,right: 7.0.r),
                      child: Text(
                         "",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: kColorsBlack,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:  7.0.r,vertical: 8.0.r),
                      child: Stack(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 14.r),
                            child: Container(
                              decoration: BoxDecoration(
                                color:  Color(0xFFE8F4F7),
                                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                                //color: Colors.cyan
                              ),
                              height: 5.h,
                              width:0.09.sw ,

                            ),
                          ),
                          Text(
                              "",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: kColorsWhite,
                                fontWeight: FontWeight.bold,
                              )),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 17.0.h,
        ),
      ],
    ) ;
  }
}
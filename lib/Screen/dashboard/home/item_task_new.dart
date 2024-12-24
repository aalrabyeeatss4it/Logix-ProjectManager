
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Constants/my_text.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/custom_row_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class  ItemTaskNew  extends StatelessWidget {
  void select(BuildContext ctx){
  }
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: (){
        },
        child: Container(
          width: 0.68.sw,
          child: Row(
            children: [
              Container(
                color: kColorsPrimaryFont,
                width: 0.01.sw,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 0.64.sw,
                    decoration: BoxDecoration(
                      color: kColorsWhite,
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.0.r, bottom: 2.r,left: 5.0.r,right: 4.0.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRowText(text: 'المشروع'.tr,textStyle: TextStyle(fontFamily: 'GraphikArabic',fontSize: 12, color:kColorsPrimaryFont , fontWeight: FontWeight.w500,),textValue: "2022/2/2",textValueStyle: TextStyle(fontFamily: 'GraphikArabic',fontSize: 10, color: kColorsBlack,),backColor: kColorsLightBlackLow,),
                          CustomRowText(text: 'المهمه'.tr,textStyle: TextStyle(fontFamily: 'GraphikArabic',fontSize: 12, color:Color(0xff242424) , fontWeight: FontWeight.w500,),textValue: "2026/2/2",textValueStyle: TextStyle(fontFamily: 'GraphikArabic',fontSize: 10, color: kColorsBlack,),backColor: kColorsLightBlackLow,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal:  8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  color:kColorsPrimaryFont.withOpacity(0.1) ,
                                  borderRadius: BorderRadius.circular(7.r),
                                ),

                                child: Padding(
                                  padding:  EdgeInsets.all(4.0),
                                  child: Text('تنتهي في '.tr +'2024/12/12' +"  |  "+'متبقى :'.tr +'3 أيام ' ,  style: TextStyle(fontFamily: 'GraphikArabic',fontSize: 12, color:kColorsPrimaryFont , fontWeight: FontWeight.w500,)),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 0.03.sw,
              ),
            ],
          ),
        ),
      );
  }
}





class  ItemHomeShimmer extends StatelessWidget {


  void select(BuildContext ctx){
  }
  @override
  Widget build(BuildContext context) {
    return
      Shimmer(
        child:  Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 0.05.sw,right:  0.03.sw),
              child: Container(
                height:0.30.sh,
                width: 343.w,
                decoration: BoxDecoration(
                  color: kColorsWhite,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(width: 0.4.r,color:kColorsPrimaryFont.withOpacity(0.6) ),

                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0.r, bottom: 5.r,left: 5.0.r,right: 10.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRowText(text: " ",textStyle: TextStyle(fontSize: 12, color:kColorsWhite , fontWeight: FontWeight.w500,),textValue: "",textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: kColorsWhite,),
                      CustomRowText(text: "",textStyle: TextStyle(fontSize: 12, color:kColorsWhite , fontWeight: FontWeight.w500,),textValue: "",textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: kColorsWhite,),
                      CustomRowText(text: "",textStyle: TextStyle(fontSize: 12, color:kColorsWhite , fontWeight: FontWeight.w500,),textValue: " ",textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: kColorsWhite,),
                 ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12.0.h,
            ),
          ],
        ),
      );
  }
}



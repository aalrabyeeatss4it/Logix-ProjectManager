
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Constants/my_text.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/custom_row_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class  ItemHome extends StatelessWidget {
  // var data;
  // ItemHome ({ this.data});
  void select(BuildContext ctx){
  }
  int percentage = 50;
  @override
  Widget build(BuildContext context) {
  return
      Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 0.01.sw,right:  0.01.sw),
            child: Container(
              width: 343.w,
              decoration: BoxDecoration(
                color: kColorsWhite,
                borderRadius: BorderRadius.circular(7.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 5.0.r, bottom: 5.r,left: 5.0.r,right: 10.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color:kColorsWhite  ,
                              borderRadius: BorderRadius.circular(10.r)
                          ),
                          padding:  EdgeInsets.only(top:  2.0.r,right: 6.r,bottom: 2.r),
                          width: 0.99.sw,
                          child: Row(

                            children: [
                              Expanded(
                                  flex:9,
                                  child: Text('تركيب نظام لجهه خاصه'.tr,    style: TextStyle(
                                    color: Color(0xFF242424),
                                    fontSize: 14,
                                    fontFamily: 'GraphikArabic',
                                    fontWeight: FontWeight.w500,
                                    height: 1.17,
                                  ),)),
                              Expanded(
                                flex:5,
                                child: CustomButton(
                                  color:Color(0xffFF744A).withOpacity(0.3),
                                  borderRadius: 8.r,
                                  borderColor:  kColorsPrimaryFont,
                                  sizeHeight: 0.04.sh,
                                  sizeWidth: 0.30.sw,
                                  text:'متأخر بشكل بسيط'.tr,
                                  style: TextStyle(
                                    color: Color(0xFFFF744A),
                                    fontSize: 10,
                                    fontFamily: 'GraphikArabic',
                                    fontWeight: FontWeight.w500,
                                    height: 1.64,
                                  ),
                                  onPress: () {
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex:9,
                          child: Column(
                            children: [
                              CustomRowText(text: 'تاريخ البدايه'.tr,textStyle: TextStyle(     fontSize: 12,
                                fontFamily: 'GraphikArabic',
                                height: 1.37, color:Color(0xff242424) , fontWeight: FontWeight.w500,),textValue: "2022/2/2",textValueStyle: TextStyle( color: Color(0xFF242424).withOpacity(0.5),
              fontSize: 12,
              fontFamily: 'GraphikArabic',
              fontWeight: FontWeight.w400,),backColor: kColorsLightBlackLow,flex: 4,),
                              CustomRowText(text: ' تاريخ النهايه'.tr,textStyle: TextStyle( fontSize: 12,
                                fontFamily: 'GraphikArabic',
                                height: 1.37, color:Color(0xff242424) , fontWeight: FontWeight.w500,),textValue: "2024/05/01",textValueStyle: TextStyle( color: Color(0xFF242424).withOpacity(0.5),
              fontSize: 12,
              fontFamily: 'GraphikArabic',
              fontWeight: FontWeight.w400,),backColor: kColorsLightBlackLow,flex: 4,),
                              CustomRowText(text: 'مرحلة المشروع'.tr,textStyle: TextStyle(fontSize: 12,
                                fontFamily: 'GraphikArabic',
                                 color:Color(0xff242424) , fontWeight: FontWeight.w500,),textValue: "جمع المتطلبات",textValueStyle: TextStyle( color: Color(0xFF242424).withOpacity(0.5),
              fontSize: 12,
              fontFamily: 'GraphikArabic',
              fontWeight: FontWeight.w400,),backColor: kColorsLightBlackLow,flex: 4,),
                               ],
                          ),
                        ),
                        Expanded(
                          flex:4,
                          child:CircularPercentIndicator(
                            radius: 35.0,

                            lineWidth: 13.0,
                            animation: true,
                            percent: percentage / 100,
                            center: Text("$percentage%",   style: TextStyle(
                              color: Color(0xFF242424),
                              fontSize: 10,
                              fontFamily: 'GraphikArabic',
                              fontWeight: FontWeight.w400,
                              height: 1.64,
                            ),),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: kColorsPrimaryFont,
                            backgroundColor: kColorsPrimaryFont.withOpacity(0.2),
                          ),
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                        flex:14,
                        child: CustomRowText(text: 'مدير المشروع'.tr,textStyle: TextStyle(color: Color(0xFF242424),
                          fontSize: 12,
                          fontFamily: 'GraphikArabic',
                          fontWeight: FontWeight.w400,),textValue:"فارس سفيان الصلوي",textValueStyle: TextStyle(color: Color(0xFF242424).withOpacity(0.5),
                          fontSize: 12,
                          fontFamily: 'GraphikArabic',
                          fontWeight: FontWeight.w400,),backColor: kColorsLightBlackLow,flex: 3,)),
                        Expanded(
                          flex:2,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(RoutingApp.projects_details_screen);
                            },
                            child:
                            Padding(
                              padding:  EdgeInsets.all(3.0.r),
                              child: SvgPicture.asset(
                                "assets/Icon/arrow-square-left.svg",
                                width: 24 ,
                                height: 24 ,
                                color: kColorsBlack,
                              ),
                            ),
                          )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.01.sh,
          ),
        ],
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
                      CustomRowText(text: " ",textStyle: TextStyle(fontSize: 12, color:kColorsWhite , fontWeight: FontWeight.w500,),textValue: "",textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: kColorsWhite,),
                      CustomRowText(text: " ",textStyle: TextStyle(fontSize: 12, color:kColorsWhite , fontWeight: FontWeight.w500,),textValue: " ",textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: kColorsWhite,),
                      CustomRowText(text: "",textStyle: TextStyle(fontSize: 12, color:kColorsWhite , fontWeight: FontWeight.w500,),textValue: "  ",textValueStyle: TextStyle(fontSize: 10, color: kColorsBlack,),backColor: Color(0xffEBF1F8),),
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



import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Core/Utils/assets.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/custom_row_text.dart';
import 'package:projectmanagers/widget/custom_tow_row_text.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ItemUpdatePlan extends StatelessWidget {
  ItemUpdatePlan();

  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    debugInvertOversizedImages = true;

    return Padding(
      padding: EdgeInsets.only(left: 0.02.sw, right: 0.02.sw),
      child: Container(
        height: 0.24.sh,
        width: 0.95.sw,
        decoration: BoxDecoration(
          color: kColorsWhite,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: kColorsLightBlackLow.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 5.r,
              offset:Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 8,
              child: Padding(
                padding: EdgeInsets.only(top: 5.0.r, bottom: 5.r, ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:   EdgeInsets.only( left:isRtl!=true?5: 0.0,right:isRtl==true?5.0: 0.0),
                            child: Row(
                              children: [
                                Text('عنوان النشاط:'.tr+":",  style:  const TextStyle(
                                  color:kColorsBlack ,
                                  fontSize: 12,
                                  fontFamily: 'GraphikArabic',
                                  fontWeight: FontWeight.w400,
                                ),),
                                Text('  تدريب الأولي على النظام وأحذ المدخلات:'.tr ,  style:  const TextStyle(
                                  color: kColorsPrimaryFont,
                                  fontSize: 12,
                                  fontFamily: 'GraphikArabic',
                                  fontWeight: FontWeight.w400,
                                  height: 1.37,
                                ),),
                              ],
                            ),
                          ),

                          CustomTowRowText(
                            flex: 5,
                            text: 'تاريخ البداية:'.tr,
                            textStyle:    TextStyle(
                              color: kColorsBlack.withOpacity(0.7),
                              fontSize: 12,
                              fontFamily: 'GraphikArabic',
                              height: 1.37,
                            ),
                            textValue: "2021/4/5",
                            textValueStyle: TextStyle(
                              color: Color(0xFF242424).withOpacity(0.5),
                              fontSize: 12,
                              fontFamily: 'GraphikArabic',
                              fontWeight: FontWeight.w400,
                              height: 1.37,
                            ),
                            backColor: kColorsWhite,
                            text2: "تاريخ النهاية:".tr,
                            textValue2: "2024/10/10",

                          ),
                          CustomTowRowText(
                            flex: 5,

                            text: "بداية تاريخ الإنجاز:".tr,
                            textStyle:    TextStyle(
                              color: kColorsBlack.withOpacity(0.7),
                              fontSize: 12,
                              fontFamily: 'GraphikArabic',
                              height: 1.37,
                            ),
                            textValue: "2021/4/5",
                            textValueStyle:    TextStyle(
                              color: Color(0xFF242424).withOpacity(0.5),
                              fontSize: 12,
                        fontFamily: 'GraphikArabic',
                        fontWeight: FontWeight.w400,
                        height: 1.37,
                      ),
                      backColor: kColorsWhite,
                      text2: " نهاية تاريخ الإنجاز:".tr,
                      textValue2: "2024/10/10",
                    ),

                    Padding(
                      padding:   EdgeInsets.only(left:isRtl!=true?3: 0.0,right:isRtl==true?3.0: 0.0),
                      child: Row(
                        children: [
                          Text('  نسبة الإنجاز المخطط له '.tr+":",  style:   TextStyle(
                            color: kColorsBlack.withOpacity(0.7),
                            fontSize: 12,
                            fontFamily: 'GraphikArabic',
                            height: 1.37,
                          ),),
                          Text('  100 '.tr ,  style:    TextStyle(
                            color: Color(0xFF242424).withOpacity(0.5),
                            fontSize: 12,
                            fontFamily: 'GraphikArabic',
                            fontWeight: FontWeight.w400,
                            height: 1.37,
                          ),),
                        ],
                      ),
                    ),
                    CustomTowRowText(
                      flex: 6,
                      text: 'نسبة الإنجاز الفعلي'.tr,
                      textStyle:    TextStyle(
                        color: kColorsBlack.withOpacity(0.7),
                        fontSize: 12,
                        fontFamily: 'GraphikArabic',
                        height: 1.37,
                      ),
                      textValue: "100",
                      textValueStyle:    TextStyle(
                        color: Color(0xFF242424).withOpacity(0.5),
                        fontSize: 12,
                        fontFamily: 'GraphikArabic',
                        fontWeight: FontWeight.w400,
                        height: 1.37,
                      ),
                      backColor: kColorsWhite,
                      text2: "نسبة التأخير ".tr,
                      textValue2: "60",
                    ),


                  ],
                ),
              ),
            ),

            Expanded(
              flex:2,
              child: InkWell(
                onTap: () {
                  // Get.toNamed(RoutingApp.add_keeper_covenant_screen);
                },
                child: Container(
                  alignment: Alignment.center,
                  padding:const EdgeInsets.only(right:  8,left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 0.04.sh,
                            width:  0.88.sw,
                            decoration: BoxDecoration(
                                color: kColorsWhite,
                                border: Border.all(width: 0.6,color:kColorsPrimaryFont ),
                                borderRadius: BorderRadius.circular(5.r)

                            ),
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(RoutingApp.update_plan_project_screen);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(' تحديث المخطط الزمني'.tr,
                                    style: const TextStyle(fontFamily: 'GraphikArabic',color: kColorsPrimaryFont, fontSize: 14,fontWeight: FontWeight.w500),),
                                  Padding(
                                    padding:  EdgeInsets.all(6.0),
                                    child: SvgPicture.asset(
                                      AssestData.left,
                                      width: 20 ,
                                      height: 20 ,
                                      color: kColorsPrimaryFont,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}

class ItemUpdatePlanShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages = true;
    return Shimmer(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.05.sw, right: 0.03.sw),
            child: Container(
              height: 0.30.sh,
              width: 343.w,
              decoration: BoxDecoration(
                color: kColorsWhite,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                    width: 0.4.r, color: kColorsPrimaryFont.withOpacity(0.6)),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 5.0.r, bottom: 5.r, left: 5.0.r, right: 10.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRowText(
                      text: " ",
                      textStyle:  const TextStyle(
                        fontSize: 12,
                        color: kColorsWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      textValue: "",
                      textValueStyle:  const TextStyle(
                        fontSize: 10,
                        color: kColorsBlack,
                      ),
                      backColor: kColorsWhite,
                    ),
                    CustomRowText(
                      text: "",
                      textStyle:  const TextStyle(
                        fontSize: 12,
                        color: kColorsWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      textValue: "",
                      textValueStyle:  const TextStyle(
                        fontSize: 10,
                        color: kColorsBlack,
                      ),
                      backColor: kColorsWhite,
                    ),
                    CustomRowText(
                      text: "",
                      textStyle:  const TextStyle(
                        fontSize: 12,
                        color: kColorsWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      textValue: " ",
                      textValueStyle:  const TextStyle(
                        fontSize: 10,
                        color: kColorsBlack,
                      ),
                      backColor: kColorsWhite,
                    ),
                    CustomRowText(
                      text: " ",
                      textStyle:  const TextStyle(
                        fontSize: 12,
                        color: kColorsWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      textValue: "",
                      textValueStyle:  const TextStyle(
                        fontSize: 10,
                        color: kColorsBlack,
                      ),
                      backColor: kColorsWhite,
                    ),
                    CustomRowText(
                      text: " ",
                      textStyle:  const TextStyle(
                        fontSize: 12,
                        color: kColorsWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      textValue: " ",
                      textValueStyle:  const TextStyle(
                        fontSize: 10,
                        color: kColorsBlack,
                      ),
                      backColor: kColorsWhite,
                    ),
                    CustomRowText(
                      text: "",
                      textStyle:  const TextStyle(
                        fontSize: 12,
                        color: kColorsWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      textValue: "  ",
                      textValueStyle:  const TextStyle(
                        fontSize: 10,
                        color: kColorsBlack,
                      ),
                      backColor: Color(0xffEBF1F8),
                    ),
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

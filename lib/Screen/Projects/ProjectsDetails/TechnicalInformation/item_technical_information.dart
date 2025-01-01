import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/custom_row_text.dart';
import 'package:projectmanagers/widget/custom_tow_row_text.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ItemTechnicalInformation extends StatelessWidget {
  ItemTechnicalInformation();

  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages=true;
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return InkWell(
        onTap: (){
        },
      child: Column(
        children: [
          SizedBox(
            height: 0.01.sh,
          ),
          Padding(
            padding:  EdgeInsets.only(left: 0.03.sw,right:  0.03.sw),
            child: Container(

              width: 0.95.sw,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: kColorsLightBlackLow.withOpacity(0.4),
                    spreadRadius:2,
                    blurRadius: 5.r,
                    offset:Offset(0, 10), // changes position of shadow
                  ),
                ],
                color: kColorsWhite,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 5.0.r, bottom: 5.r, left:isRtl!=true? 10.0.r:0.0, right:isRtl==true? 10.0.r:0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CustomRowText(flex :3,text: ' اسم المخرج '.tr, textStyle:   TextStyle(fontSize: 12, color:kColorsPrimaryFont, fontWeight: FontWeight.w500,), textValue: " مصدر المستند", textValueStyle:   TextStyle(fontSize: 12, color: kColorsBlackTow.withOpacity(0.4),), backColor: kColorsWhite,),
                        CustomTowRowText(flex:4,text: ' رقم المخرج'.tr, textStyle:   TextStyle(fontSize: 12, color:  kColorsBlack.withOpacity(0.7), fontWeight: FontWeight.w500,), textValue: "256556", textValueStyle:   TextStyle(fontSize: 12, color: kColorsBlackTow.withOpacity(0.4),), backColor: kColorsWhite, text2: "    العدد".tr, textValue2: " 5325",),
                        CustomTowRowText(flex:4,text: 'العدد المعتمد سابقا'.tr, textStyle:   TextStyle(fontSize: 12, color:  kColorsBlack.withOpacity(0.7), fontWeight: FontWeight.w500,), textValue: "5555", textValueStyle:   TextStyle(fontSize: 12, color: kColorsBlackTow.withOpacity(0.4),), backColor: kColorsWhite, text2: "العدد في الميثاق".tr, textValue2: "56246",),
                        CustomRowText(text: ' الملاحظات'.tr, textStyle:   TextStyle(fontSize: 12, color:  kColorsBlack.withOpacity(0.7), fontWeight: FontWeight.w500,), textValue: " وصف المستند ", textValueStyle:   TextStyle(fontSize: 12, color: kColorsBlackTow.withOpacity(0.4),), backColor: kColorsWhite,),


                      ],
                    ),


                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.005.sh,
          ),
        ],
      ),
    );
  }
}

class ItemTechnicalInformationShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages=true;
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
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: kColorsWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      textValue: "",
                      textValueStyle: const TextStyle(
                        fontSize: 10,
                        color: kColorsBlack,
                      ),
                      backColor: kColorsWhite,
                    ),
                    CustomRowText(
                      text: "",
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: kColorsWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      textValue: "",
                      textValueStyle: const TextStyle(
                        fontSize: 10,
                        color: kColorsBlack,
                      ),
                      backColor: kColorsWhite,
                    ),
                    CustomRowText(
                      text: "",
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: kColorsWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      textValue: " ",
                      textValueStyle: const TextStyle(
                        fontSize: 10,
                        color: kColorsBlack,
                      ),
                      backColor: kColorsWhite,
                    ),
                    CustomRowText(
                      text: " ",
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: kColorsWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      textValue: "",
                      textValueStyle: const TextStyle(
                        fontSize: 10,
                        color: kColorsBlack,
                      ),
                      backColor: kColorsWhite,
                    ),
                    CustomRowText(
                      text: " ",
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: kColorsWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      textValue: " ",
                      textValueStyle: const TextStyle(
                        fontSize: 10,
                        color: kColorsBlack,
                      ),
                      backColor: kColorsWhite,
                    ),
                    CustomRowText(
                      text: "",
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: kColorsWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      textValue: "  ",
                      textValueStyle: const TextStyle(
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

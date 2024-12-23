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

class ItemKeeperCovenant extends StatelessWidget {
  ItemKeeperCovenant();

  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages=true;
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return InkWell(
      splashColor: kColorsWhite,
        onTap: (){
        },
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 0.03.sw,right:  0.03.sw),
            child: Container(
              height: 0.25.sh,
              width: 0.95.sw,
              decoration: BoxDecoration(
                color: kColorsWhite,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 5.0.r, bottom: 5.r, left:isRtl!=true? 10.0.r:0.0, right:isRtl==true? 10.0.r:0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        children: [
                          CustomTowRowText(flex: 2,text: 'الرقم '.tr,textStyle: const TextStyle(fontSize: 12, color: kColorsBlack, fontWeight: FontWeight.w500,), textValue:"14", textValueStyle: const TextStyle(fontSize: 12, color: kColorsBlackTow,), backColor: kColorsWhite, text2: 'نوع المصروف'.tr, textValue2: "",textValue2Style: const TextStyle(fontSize: 12, color: kColorsPrimaryFont, fontWeight: FontWeight.w500,),),
                          CustomTowRowText(text: 'اسم مركز التكلفه'.tr, textStyle: const TextStyle(fontSize: 12, color: kColorsBlack, fontWeight: FontWeight.w500,), textValue: "الإداره العامه", textValueStyle: const TextStyle(fontSize: 12, color: kColorsBlackTow,), backColor: kColorsWhite, text2: "رقم الفاتوره".tr, textValue2: "554",),
                          CustomTowRowText(text: "اسم المورد".tr, textStyle: const TextStyle(fontSize: 12, color: kColorsBlack, fontWeight: FontWeight.w500,), textValue: "سلامه رضوان", textValueStyle: const TextStyle(fontSize: 12, color: kColorsBlackTow,), backColor: kColorsWhite, text2: "الرقم الضريبي".tr, textValue2:"4474747454",),
                          CustomRowText(text:  'التاريخ'.tr, textStyle: const TextStyle(fontSize: 12, color: kColorsBlack, fontWeight: FontWeight.w500,), textValue: "2021/4/5", textValueStyle: const TextStyle(fontSize: 12, color: kColorsBlackTow,), backColor: kColorsWhite,),
                          CustomRowText(text:  'البيان'.tr, textStyle: const TextStyle(fontSize: 12, color: kColorsBlack, fontWeight: FontWeight.w500,), textValue: "مثال على بيان السطر", textValueStyle: const TextStyle(fontSize: 12, color: kColorsBlackTow,), backColor: kColorsWhite,),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color:  Color(0xff0692AC).withOpacity(0.2),
                        child: Padding(
                          padding:   EdgeInsets. only(left:isRtl==true?  20.0:4,right:isRtl==true? 4.0:20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("المبلغ :", style: TextStyle( fontSize: 12.0,color: kColorsBlack,),),
                                  Text("70.0%", style: TextStyle( fontSize: 12.0,color: kColorsPrimaryFont,),),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("الضريبه :", style: TextStyle( fontSize: 12.0,color: kColorsBlack,),),
                                  Text("70.0%", style: TextStyle( fontSize: 12.0,color: kColorsPrimaryFont,),),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("الإجمالي :", style: TextStyle( fontSize: 12.0,color: kColorsBlack,),),
                                  Text("70.0%", style: TextStyle( fontSize: 12.0,color: kColorsPrimaryFont,),),
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

class ItemKeeperCovenantShimmer extends StatelessWidget {
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
                    width: 0.4.r, color: kColorsPrimary.withOpacity(0.6)),
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

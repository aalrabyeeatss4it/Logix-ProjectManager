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
    debugInvertOversizedImages = true;
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return Padding(
      padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
      child: Container(
        height: 0.25.sh,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 5.0.r,
                    bottom: 5.r,
                    left: isRtl != true ? 10.0.r : 0.0,
                    right: isRtl == true ? 10.0.r : 0.0),
                child: Column(
                  children: [
                    CustomTowRowText(
                      flex: 2,
                      text: 'الرقم '.tr,
                      textStyle:    TextStyle(
                        color: kColorsBlack.withOpacity(0.7),
                        fontSize: 12,
                        fontFamily: 'GraphikArabic',
                        fontWeight: FontWeight.w400,
                        height: 1.37,
                      ),
                      textValue: "14",
                      textValueStyle:    TextStyle(
                        color: Color(0xFF242424).withOpacity(0.5),
                        fontSize: 12,
                        fontFamily: 'GraphikArabic',
                        fontWeight: FontWeight.w400,
                        height: 1.37,
                      ),
                      backColor: kColorsWhite,
                      text2: 'نوع المصروف'.tr,
                      textValue2: "بنزين",
                      textValue2Style:    TextStyle(
                        color: kColorsBlack.withOpacity(0.7),
                        fontSize: 12,

                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    CustomTowRowText(
                      text: 'اسم مركز التكلفه'.tr,
                      textStyle:    TextStyle(
                        color: kColorsBlack.withOpacity(0.7),
                        fontSize: 12,
                        fontFamily: 'GraphikArabic',
                        fontWeight: FontWeight.w400,
                        height: 1.37,
                      ),
                      textValue: "الإداره العامه",
                      textValueStyle:    TextStyle(
                        color: Color(0xFF242424).withOpacity(0.5),
                        fontSize: 12,
                        fontFamily: 'GraphikArabic',
                        fontWeight: FontWeight.w400,
                        height: 1.37,
                      ),
                      backColor: kColorsWhite,
                      text2: "رقم الفاتوره".tr,
                      textValue2: "554",
                    ),
                    CustomTowRowText(
                      text: "اسم المورد".tr,
                      textStyle:    TextStyle(
                        color: kColorsBlack.withOpacity(0.7),
                        fontSize: 12,
                        fontFamily: 'GraphikArabic',
                        fontWeight: FontWeight.w400,
                        height: 1.37,
                      ),
                      textValue: "سلامه رضوان",
                      textValueStyle:    TextStyle(
                        color: Color(0xFF242424).withOpacity(0.5),
                        fontSize: 12,
                        fontFamily: 'GraphikArabic',
                        fontWeight: FontWeight.w400,
                        height: 1.37,
                      ),
                      backColor: kColorsWhite,
                      text2: "الرقم الضريبي".tr,
                      textValue2: "4474747454",
                    ),
                    CustomRowText(
                      text: 'التاريخ'.tr,
                      textStyle:    TextStyle(
                        color: kColorsBlack.withOpacity(0.7),
                        fontSize: 12,
                        fontFamily: 'GraphikArabic',
                        fontWeight: FontWeight.w400,
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
                    ),
                    CustomRowText(
                      text: 'البيان'.tr,
                      textStyle:  const TextStyle(
                        fontSize: 12,
                        fontFamily: 'GraphikArabic',
                        fontWeight: FontWeight.w400,
                      ),
                      textValue: "مثال على بيان السطر",
                      textValueStyle:    TextStyle(
                        color: Color(0xFF242424).withOpacity(0.5),
                        fontSize: 12,
                        fontFamily: 'GraphikArabic',
                        fontWeight: FontWeight.w400,
                        height: 1.37,
                      ),
                      backColor: kColorsWhite,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Color(0xff0692AC).withOpacity(0.2),
                child: Padding(
                  padding: EdgeInsets.only(left: isRtl == true ? 20.0 : 8, right: isRtl == true ? 8.0 : 20),
                  child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "المبلغ :",
                            style: const TextStyle(
                              color: Color(0xFF242424),
                              fontSize: 12,
                              fontFamily: 'GraphikArabic',
                              fontWeight: FontWeight.w400,
                              height: 1.37,
                            ),
                          ),
                          Text(
                            "70.0%",
                            style: const TextStyle(
                              color: Color(0xFF0692AC),
                              fontSize: 12,
                              fontFamily: 'GraphikArabic',
                              fontWeight: FontWeight.w400,
                              height: 1.37,
                            ),
                          ),
                        ],
                      ),
                      Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "الضريبه :",
                            style: const TextStyle(
                              color: Color(0xFF242424),
                              fontSize: 12,
                              fontFamily: 'GraphikArabic',
                              fontWeight: FontWeight.w400,
                              height: 1.37,
                            ),
                          ),
                          Text(
                            "70.0%",
                            style: const TextStyle(
                              color: Color(0xFF0692AC),
                              fontSize: 12,
                              fontFamily: 'GraphikArabic',
                              fontWeight: FontWeight.w400,
                              height: 1.37,
                            ),
                          ),
                        ],
                      ),
                      Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "الإجمالي :",
                            style: const TextStyle(
                              color: Color(0xFF242424),
                              fontSize: 12,
                              fontFamily: 'GraphikArabic',
                              fontWeight: FontWeight.w400,
                              height: 1.37,
                            ),
                          ),
                          Text(
                            "70.0%",
                            style: const TextStyle(
                              color: Color(0xFF0692AC),
                              fontSize: 12,
                              fontFamily: 'GraphikArabic',
                              fontWeight: FontWeight.w400,
                              height: 1.37,
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

class ItemKeeperCovenantShimmer extends StatelessWidget {
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

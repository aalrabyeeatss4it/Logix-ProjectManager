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

class ItemArchivedDocumentsReport extends StatelessWidget {
  ItemArchivedDocumentsReport();

  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages = true;
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return Padding(
      padding: EdgeInsets.only(left: 0.03.sw, right: 0.03.sw),
      child: Container(
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
            Padding(
              padding: EdgeInsets.only(
                  top: 5.0.r,
                  bottom: 5.r, left: isRtl != true ? 10.0.r : 0.0, right: isRtl == true ? 10.0.r : 0.0),
              child: Column(
                children: [
                  CustomRowText(
                    flex: 3,
                    text: 'اسم المستند'.tr,
                    textStyle:  const TextStyle(
                      fontSize: 12,
                      fontFamily: 'GraphikArabic',
                      fontWeight: FontWeight.w400,
                    ),
                    textValue: " مثال على اسم مستند من تلاث اربع خمس كلمات",
                    textValueStyle:    TextStyle(
                      color: Color(0xFF242424).withOpacity(0.5),
                      fontSize: 12,
                      fontFamily: 'GraphikArabic',
                      fontWeight: FontWeight.w400,
                      height: 1.37,
                    ),
                    backColor: kColorsWhite,
                  ),
                  CustomTowRowText(
                    flex: 2,
                    text: 'رقم المرجع: '.tr,
                    textStyle:    TextStyle(
                      color: kColorsBlack.withOpacity(0.7),
                      fontSize: 12,
                      fontFamily: 'GraphikArabic',
                      fontWeight: FontWeight.w400,
                      height: 1.37,
                    ),
                    textValue: "22",
                    textValueStyle:    TextStyle(
                      color: Color(0xFF242424).withOpacity(0.5),
                      fontSize: 12,
                      fontFamily: 'GraphikArabic',
                      fontWeight: FontWeight.w400,
                      height: 1.37,
                    ),
                    backColor: kColorsWhite,
                    text2: ' التاريخ:  '.tr,
                    textValue2: "2024/12/10",
                    textValue2Style:    TextStyle(
                      color: kColorsBlack.withOpacity(0.7),
                      fontSize: 12,

                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CustomTowRowText(
                    text: 'النوع'.tr,
                    textStyle:    TextStyle(
                      color: kColorsBlack.withOpacity(0.7),
                      fontSize: 12,
                      fontFamily: 'GraphikArabic',
                      fontWeight: FontWeight.w400,
                      height: 1.37,
                    ),
                    textValue: "PDF",
                    textValueStyle:    TextStyle(
                      color: Color(0xFF242424).withOpacity(0.5),
                      fontSize: 12,
                      fontFamily: 'GraphikArabic',
                      fontWeight: FontWeight.w400,
                      height: 1.37,
                    ),
                    backColor: kColorsWhite,
                    text2: "المصدر".tr,
                    textValue2: "الرياض",
                  ),

                  CustomRowText(
                    text: 'تاريخ الإنتهاء'.tr,
                    textStyle:    TextStyle(
                      color: kColorsBlack.withOpacity(0.7),
                      fontSize: 12,
                      fontFamily: 'GraphikArabic',
                      fontWeight: FontWeight.w400,
                      height: 1.37,
                    ),
                    textValue: "2025/11/10",
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
                    text: 'الوصف:'.tr,
                    textStyle:  const TextStyle(
                      fontSize: 12,
                      fontFamily: 'GraphikArabic',
                      fontWeight: FontWeight.w400,
                    ),
                    textValue: "مثال نص على الوصف يكون في هذا المكان",
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

          ],
        ),
      ),
    );
  }
}

class ItemArchivedDocumentsReportShimmer extends StatelessWidget {
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

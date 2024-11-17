import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/kaye.dart';
import 'package:projectmanagers/Constants/my_text.dart';
import 'package:projectmanagers/language/controller/app_language.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/customButton.dart';

import '/Constants/Constants.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  int? selectedValue;


  int? select_coustmor;

  int? select_emploee;

  final AppLanguage controller = Get.put(AppLanguage());

  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return Container(
      padding: EdgeInsets.all(8.r),
      alignment: Alignment.topLeft,
      height: 0.29.sh,
      decoration: BoxDecoration(
          color: kColorsWhite,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(14.h),
          )),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(top:  8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 53.w,
                  ),
                  Text(
                    'Select your language'.tr,
                    style:
                    TextStyle(color: kColorsPrimary, fontSize: 16,fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(right: 6.0.r, left: 16.0.r, top: 6.0.r),
                    //child: Image.asset("assets/Icons/DirectionRight.png", width: 25, height: 25),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child:
                      SvgPicture.asset(
                        "assets/Icons/icone_exit.svg",
                        width: 20,
                        height: 20.r,

                      ),

                    ),
                  ),
                ]),
          ),


          SizedBox(
            height: 0.03.sh,
          ),
          GetBuilder<AppLanguage>(
              init: AppLanguage(),
              builder: (con) {
                return Material(
                  child: InkWell(
                      onTap: () async {
                      Get.back();
                      },
                      child:  Container(
                        height: 0.15.sh,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal:  12.0.r),
                                child: RadioListTile(
                                  title: Text('arabic language'.tr,style: TextStyle(
                                      fontSize: 16,
                                      color:kColorsPrimary,
                                      fontWeight: FontWeight.w600)),
                                  value: 1,
                                  groupValue:  isRtl ? 1 : 0,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value as int;
                                      con.changeLanguage(arabic);
                                      Get.updateLocale(Locale(con.appLocale.value));
                                      Get.back();
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal:  12.0.r),
                                child: RadioListTile(
                                  title: Text('English language'.tr,style: TextStyle(
                                      fontSize: 16,
                                      color: kColorsPrimary,
                                      fontWeight: FontWeight.w600)),
                                  value: 2,
                                  groupValue:  !isRtl ? 2 : 0,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value as int;
                                      con.changeLanguage(english);
                                      Get.updateLocale(Locale(con.appLocale.value));
                                      Get.back();
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),),
                );
              }),

          SizedBox(
            height: 0.03.sh,
          ),

        ],
      ),
    );
  }
}

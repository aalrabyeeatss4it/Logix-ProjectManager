import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/kaye.dart';
import 'package:projectmanagers/Constants/my_text.dart';
import 'package:projectmanagers/Core/Utils/assets.dart';
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
    return Center(
      child: Container(
        padding: EdgeInsets.all(3.r),
        height: 0.30.sh,
        width: 0.95.sw,
        decoration: BoxDecoration(
            color: kColorsWhite,
            borderRadius: BorderRadius.all(
                Radius.circular(30.h),
            )),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.only(top:  8.0),
              child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 0.01.sh,
                        ),
                        SizedBox(
                          width: 53.w,
                        ),
                        SvgPicture.asset(
                          AssestData.Languages_Icon,
                          width: 24,
                          height: 24,
                          color: kColorsPrimaryFont,
                        ),
                        SizedBox(
                          height: 0.005.sh,
                        ),
                        Text(
                          'Change the language'.tr,
                          style:
                          const TextStyle(color: kColorsBlack, fontSize: 16,fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ]),
            ),


            SizedBox(
              height: 0.01.sh,
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
                          height: 0.10.sh,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal:  12.0.r),
                                  child: RadioListTile(
                                    title: Text('arabic language'.tr,style: const TextStyle(
                                        fontSize: 16,
                                        color:kColorsBlack,
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
                                    title: Text('English language'.tr,style: const TextStyle(
                                        fontSize: 16,
                                        color: kColorsBlack,
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
            CustomButton(
              color: kColorsPrimaryFont,
              borderRadius: 8.r,
              sizeHeight: 0.045.sh,
              sizeWidth: 0.85.sw,
              text: 'تغيير'.tr,
              style: const TextStyle(
                  fontFamily: 'GraphikArabic',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kColorsWhite), onPress: () {


            },
            ),
            SizedBox(
              height: 0.01.sh,
            ),

          ],
        ),
      ),
    );
  }
}

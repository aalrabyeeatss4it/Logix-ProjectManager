import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/kaye.dart';
import 'package:projectmanagers/Constants/my_text.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/language/controller/app_language.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/customButton.dart';

import 'package:projectmanagers/widget/progisser_bar.dart';

import '/Constants/Constants.dart';

class CheackInternetScreen extends StatelessWidget {
  int? selectedValue;

  int? select_coustmor;

  int? select_emploee;

  final _formKey = GlobalKey<FormState>();

  final AppLanguage controller = Get.put(AppLanguage());

  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return Center(
      child: Container(
        margin: EdgeInsets.all(1.0.r),


        width: .9.sw,
        decoration: BoxDecoration(color: kColorsWhite,
            borderRadius: BorderRadius.circular(20.r)
        ),
        child: Column(
          children: [
            SizedBox(
              height: 0.04.sh,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 0.52.sw,
                      ),
                    ],
                  ),

                  // Text(':',style: MyText.TitleSmallblackPrimary(context),),
                  Padding(
                    padding: EdgeInsets.all(12.0.r),
                    //child: Image.asset("assets/Icons/DirectionRight.png", width: 25, height: 25),
                    child:
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding:  EdgeInsets.all(3.0.r),
                          child: Image.asset(
                            "assets/Icon/IconsHome/ico - 24 - arrows - back_ui.png",
                            width: 20.r,
                            height: 20.r,
                            color: kColorsBlack,),
                        )),
                  ),
                ]
            ),
            Container(

              padding: EdgeInsets.all(8.r),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // 'Enter Title'
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    Image.asset("assets/Icon/IconsHome/No connection-rafiki 1.png", width: 350.w, height: 350.h ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:  8.0.r),
                      child: Text(
                        'Sorry, it looks like you are offline. Please try again later when you are ready'.tr,
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: kColorsLightBlack,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 0.09.sh,
                    ),
                    CustomButton(
                      text: 'Try to call again'.tr,
                      borderRadius: 5.r,
                      color: kColorsRedTow,
                      borderColor: kColorsRedTow,
                      sizeHeight: 0.05.sh,
                      sizeWidth: .85.sw,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: kColorsWhiteButtonTow,) ,
                      onPress: () async {
                        if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
                          Get.dialog(Center(
                            child: LoadingIndicatorWidget(),
                          ));
                          print("Connection".tr);

                   Get.back();
                        }
                        else {
                          print("No Connection".tr);
                          Get.back();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


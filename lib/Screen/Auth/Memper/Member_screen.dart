import 'package:projectmanagers/Screen/Auth/Memper/member_controller.dart';
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'package:projectmanagers/widget/app_bar_esy_dox.dart';
import 'package:projectmanagers/widget/custom_textfeild.dart';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/input_text.dart';
import '/Constants/Constants.dart';

class MemberScreen extends StatelessWidget {
  final  controller = Get.find<MemberController>();
  final _formKeyMember = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    print("OpenAppOne in member"+ stg.read(OpenAppOne).toString());
    // TODO: implement build
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return Scaffold(
      backgroundColor:  kColorsPrimaryFont,
      appBar: PreferredSize(preferredSize: Size.fromHeight(0),
          child: Container(color: kColorsPrimaryFont)),
      body: Container(
        color: kColorsPrimaryFont,
        width: 1.0.sw,
        height: 1.0.sh,
        child: SingleChildScrollView(
          child: Column(

            children: [
              SizedBox(height: 0.03.sh,),
              Container(
                width:0.90.sw,
                height: 0.085.sh,

                decoration: BoxDecoration(
                    color: kColorsPrimaryFont,
                    image:DecorationImage(image:
                    AssetImage('assets/logooPng.png'

                    ),fit: BoxFit.scaleDown,)
                ),
              ),
              SizedBox(height: 0.02.sh,),
              Container(
                width: 1.0.sw,
                child: Stack(
                  alignment:  Alignment.center,
                  children: [
                    Container(
                      width: 0.90.sw,
                      height: 0.91.sh,
                      decoration: ShapeDecoration(
                        color: kColorsWhite.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),),),

                    ),
                    Positioned(
                      bottom: 6,
                      child: Container(
                        width: 1.0.sw,
                        height: 0.88.sh,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kColorsWhite,
                        ),
                        child:     Column(
                          children: <Widget>[
                            SizedBox(
                              height: 0.03.sh,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'أهلا بعودتك!'.tr,
                                  style: TextStyle(
                                      fontFamily: 'GraphikArabic',
                                      fontSize: 24,
                                      color: kColorsBlack,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'ادخل البيانات التالية لتتمكن من الوصول إلى حسابك!'
                                      .tr,
                                  style: TextStyle(
                                    fontFamily: 'GraphikArabic',
                                    fontSize: 14,
                                    color: kColorsBlack.withOpacity(0.4),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.04.sh,
                            ),
                            TextFieldWidgetAuth(
                              hint: 'L-5269877'.tr,
                              text: 'رقم العضويه'.tr,
                              edit: 1,
                              controller: Get.find<MemberController>().memberIdTextController,
                              requirement: true,
                              color: kColorsPrimaryFont,
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(
                              height: 0.03.sh,
                            ),
                            CustomButton(
                              isIconEnd: false,
                              text: 'Next'.tr,
                              borderRadius: 10.r,
                              sizeHeight: 0.06.sh,
                              sizeWidth: 0.96.sw,
                              color: kColorsPrimaryFont,
                              style:TextStyle(
                                  fontFamily: 'GraphikArabic',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: kColorsWhite
                              ),
                              onPress: () {
                                if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
                                  // if (_formKeyMember.currentState!.validate()) {
                                  if (Get.find<MemberController>().memberIdTextController.text == null || Get.find<MemberController>().memberIdTextController.text.isEmpty ||
                                      Get.find<MemberController>().memberIdTextController.text.length <= 2) {
                                    GetSnackMsg(msg: 'Enter Membership No'.tr, bgClr: kColorsRed, txClr: kColorsWhite).showTxt();
                                  } else {
                                    Get.find<MemberController>().memberApi();
                                  }
                                  // }
                                } else {
                                  print("No Connection".tr);
                                  GetSnackMsg(msg: "No Connection".tr, bgClr: kColorsRed, txClr: kColorsWhite).showTxt();
                                }
                              },
                            ),
                            SizedBox(
                              height: 0.495.sh,
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top:0.0.sh,),
                              child: Container(
                                  width:0.35.sw,
                                  height:  .005.sh,
                                  decoration: BoxDecoration(
                                    color: kColorsBlack,
                                    borderRadius: BorderRadius.circular(7.r),
                                  )

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

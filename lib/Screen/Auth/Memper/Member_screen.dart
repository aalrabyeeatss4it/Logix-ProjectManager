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
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/input_text.dart';
import '/Constants/Constants.dart';

class MemberScreen extends StatelessWidget {
  final zDMemberController = ZoomDrawerController();
  final  controller = Get.find<MemberController>();
  final _formKeyMember = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    print("OpenAppOne in member"+ stg.read(OpenAppOne).toString());
    // TODO: implement build
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return Scaffold(
      backgroundColor: kColorsWhite,
      body: SafeArea(
        bottom: false,
        child: ZoomDrawer(
          isRtl: isRtl ? true : false,
          controller: zDMemberController,
          style: DrawerStyle.style1,
          menuScreen: MenuWidgetDachbord(
            zoomDrawerController: zDMemberController,
          ),
          mainScreen: Scaffold(
            backgroundColor: kColorsWhite,
            // appBar:  MyAppBar(title:   'Sign in'.tr,zoomDrawerController: zDLoginController,EndIcon: false, colorfont: kColorsWhite,colorAll:kColorsPrimarySalse ),
            body: Padding(
              padding:  EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: AppBarEsyDox(title:'Membership registration'.tr, EndIcon: false,zoomDrawerController:  zDMemberController)),
                  Expanded(
                    flex: 11,
                    child: Form(
                      key: _formKeyMember,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 0.15.sh,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text( 'Membership registration'.tr,
                                  style: TextStyle(fontFamily: 'GraphikArabic',
                                      fontSize: 20,
                                      color: kColorsBlack,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.05.sh,
                            ),
                            TextFieldWidget(
                              hint:'Enter Membership No'.tr,
                              text: 'Membership'.tr,
                              edit: 1,
                              controller:Get.find<MemberController>().memberIdTextController,
                              requirement: true,
                              color: kColorsDeepWhite,
                              iconStart:Padding(
                                padding:  EdgeInsets.only(right:isRtl==true? 0.0.r:4.0.r,left: isRtl==true? 4.0.r:0.0.r),
                                child: Padding(
                                  padding:
                                  EdgeInsets.all(11.0.r),
                                  child:   SvgPicture.asset(
                                    "assets/Icons/member.svg",
                                    width: 20.r,
                                    height: 20.r,
                                    color: kColorsPrimary,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(
                              height: 0.02.sh,
                            ),
                            CustomButton(
                              isIconEnd:false,
                              text: 'Next'.tr,
                              borderRadius: 10.r,
                              sizeHeight: 0.06.sh,
                              sizeWidth: 0.93.sw,
                              style:TextStyle(fontFamily: 'GraphikArabic',
                                  fontSize: 16,
                                  color: kColorsWhite,
                                  fontWeight: FontWeight.w600),
                              onPress:() {

                                if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
                                  if (_formKeyMember.currentState!.validate()) {
                                    if (Get.find<MemberController>().memberIdTextController.text == null ||
                                        Get.find<MemberController>().memberIdTextController.text.isEmpty ||
                                        Get.find<MemberController>().memberIdTextController.text.length <= 2) {
                                      GetSnackMsg(msg: 'Enter Membership No'.tr, bgClr: kColorsRed, txClr: kColorsWhite)
                                          .showTxt();
                                    } else {
                                      Get.find<MemberController>().memberApi();
                                    }
                                  }
                                } else {
                                  print("No Connection".tr);
                                  GetSnackMsg(msg: "No Connection".tr, bgClr: kColorsRed,
                                      txClr: kColorsWhite)
                                      .showTxt();

                                }

                              },
                            ),
                            SizedBox(
                              height: 0.08.sh,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 0.50.sh,
                  // ),
                ],
              ),
            ),

          ),
          clipMainScreen: true,
          // slideWidth: MediaQuery.of(context).size.width * (isRtl == true ? .45 : 0.65),
          openCurve: Curves.slowMiddle,
          closeCurve: Curves.slowMiddle,
          borderRadius: 24.0,
          showShadow: true,
          angle: 0.0, slideWidth: MediaQuery.of(context).size.width * 0.65.w,
          shadowLayer1Color: kColorScafoold,
        ),
      ),
    );
  }
}

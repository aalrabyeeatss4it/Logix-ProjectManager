import 'package:projectmanagers/Screen/MenuDrawer/profile/profile_controller.dart';
import 'package:projectmanagers/widget/custom_textfeild.dart';
import 'package:projectmanagers/widget/input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'package:projectmanagers/widget/buttm_navigator_bar.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';

class ChangPasswordScreen extends StatefulWidget {
  @override
  State<ChangPasswordScreen> createState() => _ChangPasswordScreenState();
}

class _ChangPasswordScreenState extends State<ChangPasswordScreen> {
  final  controller = Get.put(ProfileController());
  final _formKey = GlobalKey<FormState>();
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
      controller.ClereControllar();
    }
    else{
      GetSnackMsg(msg: 'No internet connection '.tr,bgClr:kColorsRed ,txClr:kColorsWhite).showTxt();
    }

  }
  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return
      Obx(() =>
        Scaffold(
          appBar:  MyAppBar(title:    "change password".tr,colorfont:kColorsWhite ),
          drawer: Drawer(
            child: MenuWidgetDashboard(), // استخدام قائمة الـ Drawer المخصصة
          ),

          body: SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: 10.r),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(
                      height: 0.02.sh,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal:  20.r),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            TextFieldWidget(
                              EndIcon: IconButton(
                                icon: Icon(
                                    size: 24.r,
                                    controller
                                        .OldPassowrdvisable
                                        .value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: kColorsIcon),
                                onPressed: () {
                                  controller.onClickVisableOldPassowrd(
                                      controller.OldPassowrdController
                                          .text);
                                },
                              ),
                              text: 'Current Password'.tr,
                              edit: 1,
                              controller:controller.OldPassowrdController,
                              requirement: true,
                              keyboardType: TextInputType.visiblePassword,
                              color: kColorsDeepWhite,
                              isHidden: controller.NewPassowrdvisable.value ? true : false,
                            ),
                            SizedBox(height: 0.01.sh,),



                            TextFieldWidget(
                              EndIcon:  IconButton(
                                icon: Icon(
                                    size: 24.r,
                                    controller
                                        .NewPassowrdvisable
                                        .value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: kColorsIcon),
                                onPressed: () {
                                  controller.onClickVisableNewPassowrd(
                                      controller.NewPassowrdController
                                          .text);
                                },
                              ),
                              text: 'Current Password'.tr,
                              edit: 1,
                              controller:controller.NewPassowrdController,
                              requirement: true,
                              keyboardType: TextInputType.visiblePassword,
                              color: kColorsDeepWhite,
                              isHidden: controller.NewPassowrdvisable.value ? true : false,
                            ),


                            SizedBox(
                              height: 0.01.sh,
                            ),
                            TextFieldWidget(
                              EndIcon:  IconButton(
                                icon: Icon(
                                    size: 24.r,
                                    controller
                                        .ConfirmPassowrdvisable
                                        .value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: kColorsIcon),
                                onPressed: () {
                                  controller.onClickVisableConfirmPassowrd(
                                      controller.ConfirmPassowrdController
                                          .text);
                                },
                              ),
                              text:'confirm password'.tr,
                              edit: 1,
                              controller:controller.ConfirmPassowrdController,
                              requirement: true,
                              keyboardType: TextInputType.visiblePassword,
                              color: kColorsDeepWhite,
                              isHidden: controller.ConfirmPassowrdvisable.value ? true : false,
                            ),

                            SizedBox(
                              height: 0.03.sh,
                            ),
                            Padding(
                              padding:  EdgeInsets.only(right:  8.0.r),
                              child: CustomButton(
                                isIconEnd:false,
                                borderRadius: 8.r,
                                sizeHeight: 0.045.sh,
                                sizeWidth: 0.85.sw,
                                text:  "change password".tr,
                                style:  const TextStyle(fontSize: 14, color: kColorsWhiteButtonTow,   fontFamily: 'GraphikArabic',),
                                onPress: () async{
                                  print("userPassword="+stg.read(userPassword).toString());
                                  // if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
                                  //   if (_formKey.currentState!.validate()) {
                                  //     if (stg.read(userPassword).toString() == controller.OldPassowrdController.text.trim()    ){
                                  //       if (controller.OldPassowrdController.text.trim() != controller.NewPassowrdController.text.trim()) {
                                  //         if (controller.NewPassowrdController.text.trim()  == controller.ConfirmPassowrdController.text.trim() ) {
                                  //           if (stg.read(userPassword).toString() != controller.ConfirmPassowrdController.text.trim() ) {
                                  //             print("هناك انترنت ");
                                  //             await controller.ChangPassword();
                                  //           }
                                  //           else{
                                  //             GetSnackMsg(msg:   "The new password must not be equal to the previous password".tr, bgClr: kColorsRed, txClr: kColorsWhite).showTxt();
                                  //           }
                                  //         }
                                  //         else {
                                  //           print(  "The new password and its confirmation must be the same".tr);
                                  //           GetSnackMsg(msg:   "The new password and its confirmation must be the same".tr, bgClr: kColorsRed, txClr: kColorsWhite).showTxt();
                                  //         }
                                  //       }
                                  //       else {
                                  //         print("The old and new password must not be equal".tr);
                                  //         GetSnackMsg(msg: "The old and new password must not be equal".tr, bgClr: kColorsRed, txClr: kColorsWhite).showTxt();
                                  //       }
                                  //     }
                                  //     else {
                                  //       print('The old password is not correct'.tr);
                                  //       GetSnackMsg(msg: 'The old password is not correct'.tr, bgClr: kColorsRed, txClr: kColorsWhite).showTxt();
                                  //     }
                                  //   }
                                  // } else {
                                  //   print("ليس هناك انترنت ");
                                  //   GetSnackMsg(msg: 'No internet connection'.tr, bgClr: kColorsRed, txClr: kColorsWhite).showTxt();
                                  // }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ),
      );
  }
}

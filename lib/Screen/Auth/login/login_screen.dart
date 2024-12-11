import 'package:projectmanagers/Screen/Auth/login/login_controller.dart';
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/language/controller/app_language.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'package:projectmanagers/widget/app_bar_esy_dox.dart';
import 'package:projectmanagers/widget/custom_textfeild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/input_text.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen();
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final  controller = Get.find<LoginController>();
  final zDLoginController = ZoomDrawerController();
  final _formLogin = GlobalKey<FormState>();
  final AppLanguage controllerL = Get.put(AppLanguage());
  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return   Scaffold(
      backgroundColor: kColorsWhite,
      body: Obx(() =>
          SafeArea(
            bottom: false,
            child: ZoomDrawer(
              isRtl: isRtl ? true : false,
              controller: zDLoginController,
              style: DrawerStyle.style1,
              menuScreen: MenuWidgetDachbord(zoomDrawerController: zDLoginController),
              mainScreen: Scaffold(
                backgroundColor: kColorsWhite,
                body: Padding(
                  padding:  EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: AppBarEsyDox( EndIcon: false,zoomDrawerController:  zDLoginController)),
                      Expanded(
                        flex: 11,
                        child: Form(
                          key: _formLogin,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 0.02.sh,
                                ),
                                Text('Sign in'.tr,
                                  style: TextStyle(fontFamily: 'Regular',fontSize: 20, color: kColorsBlack,fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 0.05.sh,),
                                TextFieldWidget(
                                  hint: 'Enter your username'.tr,
                                  text: 'Username'.tr,
                                  edit: 1,
                                  controller:controller.userTextController,
                                  requirement: true,
                                  color: kColorsDeepWhite,
                                  iconStart: Padding(
                                    padding:  EdgeInsets.only(right:isRtl==true? 0.0.r:4.0.r,left: isRtl==true? 4.0.r:0.0.r),
                                    child: Padding(
                                      padding:
                                      EdgeInsets.all(11.0.r),
                                      child:   SvgPicture.asset(
                                        "assets/Icons/Group 1000001157.svg",
                                        width: 20.r,
                                        height: 20.r,
                                        color: kColorsIcon,
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(
                                  height: 0.02.sh,
                                ),
                                TextFieldWidget(
                                  hint: 'Enter Password'.tr,
                                  text: 'Password'.tr,
                                  edit: 1,
                                  controller:controller.passwordTextController,
                                  requirement: true,

                                  color:
                                  kColorsDeepWhite,
                                  EndIcon:IconButton(
                                    icon: Icon(
                                        size: 24.r,
                                        controller.passowrdvisable.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: kColorsIcon),
                                    onPressed: () {
                                      controller.onClickVisable(
                                          controller
                                              .passwordTextController
                                              .text);
                                    },
                                  ) ,
                                  iconStart: Padding(
                                    padding:  EdgeInsets.only(right:isRtl==true? 0.0.r:4.0.r,left: isRtl==true? 4.0.r:0.0.r),
                                    child: Padding(
                                      padding:
                                      EdgeInsets.all(11.0.r),
                                      child:   SvgPicture.asset(
                                        "assets/Icons/Lock_Password_Icon_UIA2.svg",
                                        width: 20.r,
                                        height: 20.r,
                                        color: kColorsIcon,
                                      ),
                                    ),
                                  ),
                                  isHidden:controller.passowrdvisable.value ? true : false,
                                  keyboardType: TextInputType.visiblePassword,

                                ),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 8.r),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          GetBuilder<LoginController>(init:
                                          LoginController(),
                                            tag: 'sac',
                                            builder: (memb) =>
                                                Padding(
                                                  padding:  EdgeInsets.all(5.0.r),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              3.r),
                                                          color: kColorsIcon,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:kColorsIcon,
                                                              spreadRadius: 1,),
                                                          ],
                                                        ),
                                                        height:15.h,
                                                        width:15.w,
                                                        child: Checkbox(
                                                          checkColor: kColorsIcon,
                                                          activeColor: kColorsWhite,
                                                          // value:widget.data.isSendInvet==1?true:false,
                                                          value:true,
                                                          onChanged: ( value) {
                                                            if(value != null){

                                                            }
                                                            setState(() {
                                                              print(value);
                                                              Get.put(LoginController()).checkValue = value!;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                          ),
                                          SizedBox(
                                            width: 0.01.sw,
                                          ),
                                          Text(
                                            'Remember me'.tr,
                                            style:TextStyle(fontFamily: 'Regular',
                                                fontSize: 12,
                                                color: kColorsIcon,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),

                                      Text(
                                        'Forget Password ?'.tr,
                                        style: TextStyle(fontFamily: 'Regular',fontSize: 12, color: kColorsPrimary, fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 0.05.sh,
                                ),
                                CustomButton(
                                  color: kColorsPrimary,
                                  borderRadius: 8.r,
                                  sizeHeight: 0.06.sh,
                                  sizeWidth: 0.93.sw,
                                  text: 'Sign in'.tr,
                                  style: TextStyle(fontFamily: 'Regular',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color:
                                      kColorsWhite),
                                  onPress: () async{
                                    stg.write(OpenScreenlogen, true);
                                    print("StartAuthntcit");
                                    if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
                                      if (_formLogin.currentState!.validate()) {
                                        print("Connection".tr);
                                        if (controller.userTextController.text == null || controller.userTextController.text.isEmpty || controller.userTextController.text.length <= 2) {
                                          GetSnackMsg(msg: 'Enter Email'.tr, bgClr: kColorsPrimarySalse, txClr: kColorsWhite).showTxt();
                                        }
                                        if (controller.passwordTextController.text == null || controller.passwordTextController.text.isEmpty || controller.passwordTextController.text.length <= 2) {
                                          GetSnackMsg(msg: 'Enter Password'.tr, bgClr: kColorsPrimarySalse, txClr: kColorsWhite).showTxt();
                                        } else {
                                          //stg.write(token,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJGdWxsTmFtZSI6Itin2K3ZhdivINio2YYg2KzYp9ixINin2YTZhNmHINin2YTYrdin2LHYq9mKIiwiRW1wX0NvZGUiOiIwIiwiRW1wX0lEIjoiMCIsIkdyb3VwX0lEIjoiMTAiLCJVU0VSX0lEIjoiMTgyNDEiLCJEZXB0X0lEIjoiMCIsIkJSQU5DSFNfSUQiOiIxIiwiQnJhbmNoX0lEIjoiMSIsIkxvY2F0aW9uIjoiMCIsIkZhY2lsaXR5X0lEIjoiMSIsIkZpbl9ZZWFyIjoiMSIsIkVycFVybCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTAwMSIsIlVzZXJfVHlwZSI6ImN1c3RvbWVyIiwiVXNlcl9UeXBlX0lEIjoiMiIsIkN1c3RvbWVyX0lEIjoiMTIzIiwiTWVtYmVySWQiOiIxNDQ0IiwiQ29ubmVjdGlvblN0cmluZyI6InNlcnZlcj0uO2RhdGFiYXNlPUxvZ2l4X1hfMjAyMjtUcnVzdGVkX0Nvbm5lY3Rpb249dHJ1ZTsiLCJleHAiOjI2NTAzNzI4NzF9.8LJKokV8XPT7aJIUL6d6JJkPjmUUdLf6fs6Jkw2miLo');
                                          //Get.toNamed(RoutingApp.dashboardRoute);
                                          print("loginController.loginApi");
                                          controller.loginApi();
                                        }
                                      }
                                    } else {
                                      print("No Connection".tr);
                                      GetSnackMsg(msg: "No Connection".tr, bgClr: kColorsRed, txClr: kColorsWhite).showTxt();
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
      ),

    );
  }
}

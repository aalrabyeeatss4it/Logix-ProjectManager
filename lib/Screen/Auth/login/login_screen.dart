import 'package:flutter/services.dart';
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
  final controller = Get.find<LoginController>();
  final _formLogin = GlobalKey<FormState>();
  final AppLanguage controllerL = Get.put(AppLanguage());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kColorsPrimaryFont, // اللون الخلفي لشريط الحالة
      statusBarIconBrightness: Brightness.light, // لون الأيقونات (فاتح أو داكن)
    ));
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return Scaffold(
      backgroundColor: kColorsPrimaryFont,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(color: kColorsPrimaryFont)),
      body: Obx(
        () => Container(
          color: kColorsPrimaryFont,
          width: 1.0.sw,
          height: 1.0.sh,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          child:    Form(
                            key: _formLogin,
                            child: Column(
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
                                  hint: 'mail0@gmail.com'.tr,
                                  text: 'Email'.tr,
                                  edit: 1,
                                  controller: controller.userTextController,
                                  requirement: true,
                                  color: kColorsDeepWhite,
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(
                                  height: 0.02.sh,
                                ),
                                TextFieldWidgetAuth(
                                  hint: '******'.tr,
                                  text: 'كلمة المرور'.tr,
                                  edit: 1,
                                  controller: controller.passwordTextController,
                                  requirement: true,
                                  color: kColorsDeepWhite,
                                  EndIcon: IconButton(
                                    icon: Icon(
                                        size: 24,
                                        controller.passowrdvisable.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: kColorsBlack.withOpacity(0.4)),
                                    onPressed: () {
                                      controller.onClickVisable(
                                          controller.passwordTextController.text);
                                    },
                                  ),
                                  isHidden:
                                  controller.passowrdvisable.value ? true : false,
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.r, horizontal: 12),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(),
                                      Text(
                                        'Forget Password ?'.tr,
                                        style: TextStyle(
                                            fontFamily: 'GraphikArabic',
                                            fontSize: 12,
                                            color: kColorsBlack,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 0.05.sh,
                                ),
                                SizedBox(
                                  height: 0.03.sh,
                                ),
                                CustomButton(
                                  color: kColorsPrimaryFont,
                                  borderRadius: 8.r,
                                  sizeHeight: 0.06.sh,
                                  sizeWidth: 0.93.sw,
                                  text: 'Sign in'.tr+"!",
                                  style: TextStyle(
                                      fontFamily: 'GraphikArabic',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: kColorsWhite),
                                  onPress: () async {
                                    stg.write(OpenScreenlogen, true);
                                    print("StartAuthntcit");
                                    if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
                                      if (_formLogin.currentState!.validate()) {
                                        print("Connection".tr);
                                        if (controller.userTextController.text == null || controller.userTextController.text.isEmpty || controller.userTextController.text.length <= 2) {
                                          GetSnackMsg(msg: 'Enter Email'.tr, bgClr: kColorsPrimaryFontSalse, txClr: kColorsWhite).showTxt();
                                        }
                                        if (controller.passwordTextController.text == null || controller.passwordTextController.text.isEmpty || controller.passwordTextController.text.length <= 2) {
                                          GetSnackMsg(msg: 'Enter Password'.tr, bgClr: kColorsPrimaryFontSalse, txClr: kColorsWhite).showTxt();
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
                                  height: 0.348.sh,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 0.0.sh,
                                  ),
                                  child: Container(
                                      width: 0.35.sw,
                                      height: .005.sh,
                                      decoration: BoxDecoration(
                                        color: kColorsBlack,
                                        borderRadius: BorderRadius.circular(7.r),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:projectmanagers/Screen/MenuDrawer/profile/profile_controller.dart';
import 'package:projectmanagers/widget/buttm_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'package:projectmanagers/widget/custom_textfeild.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ProfileScreen extends StatefulWidget {

  var show_tabBar;
  ProfileScreen({this.show_tabBar});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = Get.put(ProfileController());
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
      controller.Revrech();
      print("Connection".tr);
    }


    else {
      print('No internet connection '.tr);
      // Get.toNamed(RoutingApp.cheack_intrinet_screen);
      GetSnackMsg(msg: 'No internet connection '.tr,bgClr:kColorsRed ,txClr:kColorsWhite ).showTxt();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return
      Scaffold(
        appBar:  MyAppBar(
            title: 'Profile personly'.tr,

            colorfont: kColorsWhite),
        drawer: Drawer(
          child: MenuWidgetDashboard(), // استخدام قائمة الـ Drawer المخصصة
        ),

        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 20.r),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children:[
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20.r),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFieldWidget(
                            text: 'Employee Name'.tr,
                            sizeFontText: 12,
                            edit: 1,
                            // hint: "مدير النظام",
                            hintStyle:  TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                            maxLine: 1,
                            keyboardType: TextInputType.text,

                            controller:controller.EmployeeNameTextControll ,
                            read: true,
                          ),
                          SizedBox(
                            height: 0.01.sh,
                          ),
                          TextFieldWidget(
                            text:  'Username'.tr,
                            sizeFontText: 12,
                            edit: 1,
                            maxLine: 1,
                            // hint: "admin",
                            hintStyle:  TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                            keyboardType: TextInputType.text,

                            controller:controller.TheNameTextControll ,
                            read: true,
                          ),
                          SizedBox(
                            height: 0.01.sh,
                          ),
                          TextFieldWidget(
                            //hint: 'Enter Topic Title'.tr,
                            //  initialValue: profile?.dataProfile?.userEmail.toString(),
                            text: 'Email'.tr,
                            sizeFontText: 12,
                            // hint: "support@ss4it.com.sa",
                            hintStyle:  TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                            edit: 1,
                            maxLine: 1,
                            keyboardType: TextInputType.emailAddress,

                            controller:controller.EmaileTextControll ,
                            read: true,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(RoutingApp.change_password_screen);
                            },
                            child: Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 10.0.r),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffE8F3F7),
                                    borderRadius: BorderRadius.circular(7.r)),
                                height: 0.06.sh,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: SvgPicture.asset(
                                        "assets/Icons/passowrd2.svg",
                                        width: 24 ,
                                        height: 24 ,
                                        color: kColorsPrimaryFont,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: Text(
                                        "change password".tr,
                                        style: const TextStyle(fontFamily: 'GraphikArabic',
                                            fontSize: 13,
                                            color: kColorsPrimaryFont,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: SvgPicture.asset(
                                        "assets/Icons/arrow-left.svg",
                                        width: 6 ,
                                        height: 12 ,
                                        color: kColorsBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0.30.sh,
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

      );
  }
}

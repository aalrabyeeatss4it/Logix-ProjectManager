
import 'package:projectmanagers/Constants/kaye.dart';
import 'package:projectmanagers/Screen/MenuDrawer/AppInfo/Applcat_Info_Screen.dart';
import 'package:projectmanagers/Screen/MenuDrawer/AppInfo/contact_us_screen.dart';
import 'package:projectmanagers/Screen/MenuDrawer/profile/prpfile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Screen/MenuDrawer/language_bottom_sheetwidget.dart';
import 'package:projectmanagers/apiservice/logout.dart';
import 'package:projectmanagers/language/controller/app_language.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/CustomSubmitDialog.dart';

import '../dashboard/dashboard_screen.dart';

class MenuWidgetDachbord extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;

  MenuWidgetDachbord({Key? key, required this.zoomDrawerController})
      : super(key: key);

  String? selectedValue;

  late bool show_tabB=true;
  final AppLanguage controller = Get.put(AppLanguage());

  final controlle = Get.put(LogOutController());



  languageBottomSheetMenu(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: kColorsWhite,
        builder: (builder) {
          return LanguageBottomSheet();
        });
  }

  @override
  Widget build(BuildContext context) {
    print("OpenAppOne in menue"+ stg.read(OpenAppOne).toString());
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return Container(
      // color: kColorsLightBlackLow2,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topRight,
           end: Alignment.bottomLeft,
          colors: [Color(0xff3570B7), Color(0xff9BB7DA)])),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(

              //3570B7
              //9BB7DA
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 0.03.sh,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: 0.12.sw, left: isRtl ? 0.0.w : 38.0.w),
                    child: Row(
                      children: [
                        Container(
                          width: 0.32.sw,
                          height: 0.12.sh,
                          color: Color(0xFF3570B7),
                          child: Image.asset(
                            'assets/LogoColor.png',
                            width: 0.32.sw,
                            height: 0.12.sh,
                            color: kColorsWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.03.sh,
            ),
            Padding(
              padding: EdgeInsets.only(right: 0.05.sw),
              child: Divider(
                color: kColorsWhite,
                height: 1.h,
              ),
            ),
            SizedBox(
              height: 0.04.sh,
            ),
            stg.read(OpenAppOne)!=true? sliderItem(  'Membership registration'.tr,  "assets/Icons/member.svg", context, () {
              zoomDrawerController.close!();
          Get.offAllNamed(RoutingApp.member_screen);
            }, kColorsWhite, kColorsWhite, false, true):Container(),
            stg.read(OpenScreenMember)==true? sliderItem(stg.read(OpenScreenlogen) == true ? 'Home'.tr : 'Sign in'.tr, "assets/Icons/home-2.svg", context, () {
              // ZoomDrawer.of(context)?.toggle();
              zoomDrawerController.close!();
              stg.read(OpenScreenlogen) == true ? Get.to(() => DashboardScreen(pageIndex: 0,)) : Get.offAllNamed(RoutingApp.login_route);
            }, kColorsWhite, kColorsWhite, false, true):Container(),

            // stg.read(OpenScreenlogen)==true?sliderItem('Internal messaging'.tr, "assets/Icons/icon_sending.svg", context,(){
            //   Get.to(() => InternalMessagingScreen());
            // }, kColorsWhite, kColorsWhite, false, true):Container(),





            stg.read(OpenScreenlogen)==true?sliderItem('Profile personly'.tr, "assets/Icons/user.svg", context,(){
              Get.to(() => ProfileScreen());
            }, kColorsWhite, kColorsWhite, false, true):Container(),
            SizedBox(
              height: 0.01.sh,
            ),
            stg.read(OpenScreenlogen)==true?Padding(
              padding: EdgeInsets.only(right: 0.05.sw),
              child: Divider(
                color: kColorsWhite,
                height: 1.h,
              ),
            ):Container(),
            SizedBox(
              height: 0.01.sh,
            ),
            sliderItem( 'About the app'.tr, "assets/Icons/icon_about_app.svg", context, () {
              Get.to(() => ApplcatInfoScreen());
            }, kColorsWhite, kColorsWhite, false, true),
            sliderItem('Contact us'.tr, "assets/Icons/icon_contact_us.svg", context, () {
              Get.to(() => ContactUsScreen());
            }, kColorsWhite, kColorsWhite, false, true),
            stg.read(OpenScreenMember)==true?sliderItem('Change of establishment'.tr, "assets/Icons/chang_member.svg", context, () {
              showDialog(
                context: context,
                builder: (context) => CustomSubmitOptionDialog(
                  onPress: () {
                    controlle.LogOutChangestablishment();
                  },
                  text: 'Do you want to change the establishment ?'.tr,
                  Colore: kColorsWhite,
                  ColoreCleare: kColorsLightBlack,
                  backColor1: kColorsorangSignOut,
                  backColor2: kColorsWhite,
                  fontColortext1: Color(0xFFB6000D),
                  fontColortext2: kColorsPrimary,
                  text1: 'Yes'.tr,
                  text2: 'Back'.tr,
                ),
              );
            }, kColorsWhite, kColorsWhite, false, true):Container(),
            sliderItem('The Language'.tr,  "assets/Icons/translate.svg", context, () {
              languageBottomSheetMenu(context);
            }, kColorsWhite, kColorsWhite, false, true),
            SizedBox(height: 0.01.sh,),
            stg.read(OpenScreenlogen)==true?Padding(
              padding: EdgeInsets.only(right: 0.05.sw),
              child: Divider(
                color: kColorsWhite,
                height: 1.h,
              ),
            ):Container(),
            stg.read(OpenScreenlogen) == true ? Padding(
                    padding: EdgeInsets.only(
                        top: 30.0.r,
                        left: 12.0.r,
                        right: 12.0.r,
                        bottom: 20.0.r),
                    child: Container(
                      width: 0.56.sw,
                      height: 0.07.sh,
                      decoration: BoxDecoration(
                          color: kColorsorangSignOut,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: sliderItem(
                          'Sign Out'.tr,  "assets/Icons/logout.svg", context, () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomSubmitOptionDialog(
                            onPress: () {
                              controlle.LogOut();
                            },
                            text:   'Are you sure you want to log out?'.tr,
                            Colore: kColorsWhite,
                            ColoreCleare: kColorsLightBlack,
                            backColor1:Color(0xFFB6000D),
                            backColor2: kColorsWhite,
                            fontColortext1: kColorsWhite,
                            fontColortext2: Color(0xFFB6000D),
                            text1: 'Yes, log out'.tr,
                            text2: 'Back'.tr,
                          ),
                        );
                      }, kColorsRed, kColorsRed, true, false),
                    ),
                  ) : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget sliderItem(
      String title,
      String icons,
      BuildContext context,
      Function() onPress,
      Color FontColore,
      Color FontIcon,
      bool? isCenter,
      bool? isUnderFont) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return InkWell(
      onTap: onPress,
      child: Container(
         height: 0.06.sh,
        child: Column(
          children: [
            isCenter == true ? SizedBox(height: 0.01.sh,) : SizedBox(height: 0.0.sh,),
            Row(
              children: [
                isCenter == true
                    ? SizedBox(
                        width: 0.02.sw,
                      ) : SizedBox(
                        width: 0.0.sw,
                      ),
                Padding(
                  padding: EdgeInsets.only(right: isRtl ? 12.0.r : 0.r, left: isRtl ? 0.0.r : 12.r),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(right: isRtl ? 6.0.r : 0.r, left: isRtl ? 3.0.r : 6.r),
                    width: 31,
                    height: 31,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Colors.white.withOpacity(0.1),),
                      ),
                    ),
                    child: SvgPicture.asset(
                      icons,
                      width: 17,
                      height: 22,
                      color: FontIcon,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                SizedBox(
                  width: 0.04.sw,
                ),
                Text(title, style: TextStyle(fontFamily: 'Cairo',fontSize:  14.sp, color: FontColore, fontWeight: FontWeight.w700),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

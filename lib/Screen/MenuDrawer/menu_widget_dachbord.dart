
import 'package:projectmanagers/Constants/kaye.dart';
import 'package:projectmanagers/Core/Utils/assets.dart';
import 'package:projectmanagers/Screen/MenuDrawer/AppInfo/Applcat_Info_Screen.dart';
import 'package:projectmanagers/Screen/MenuDrawer/AppInfo/contact_us_screen.dart';
import 'package:projectmanagers/Screen/MenuDrawer/profile/prpfile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Screen/MenuDrawer/language_bottom_sheetwidget.dart';
import 'package:projectmanagers/Screen/Reports/reports_screen.dart';
import 'package:projectmanagers/apiservice/logout.dart';
import 'package:projectmanagers/language/controller/app_language.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/CustomSubmitDialog.dart';

import '../ElectronicServices/electronic_services_screen.dart';
import '../KeeperCovenant/keeper_covenant_screen.dart';
import '../dashboard/dashboard_screen.dart';


class MenuWidgetDashboard extends StatelessWidget {
  late bool show_tabB=true;

  final controlle = Get.put(LogOutController());


  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return Container(
      alignment: Alignment.topCenter,
        color:  Color(0xff0692AC),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 0.15.sh,
              width: 1.0.sw,

              decoration: BoxDecoration(
                color:kColorsWhite.withOpacity(0.2),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.r),
                  bottomRight: Radius.circular(15.r),
                ),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 0.05.sh,
                  ),
                  Row(

                    children: [
                      SizedBox(
                        width: 0.08.sw,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: 0.17.sw, left: isRtl ? 0.0.w : 38.0.w),
                        child: Row(
                          children: [
                            Image.asset(
                              AssestData.logooLogix,
                              width: 82,
                              height: 38,
                              color: kColorsWhite,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            SizedBox(
              height: 0.04.sh,
            ),
            stg.read(OpenScreenMember)!=true? sliderItem(  'Membership registration'.tr,  "assets/Icons/member.svg", context, () {

              Get.offAllNamed(RoutingApp.member_screen);
            }, kColorsWhite, kColorsWhite, false, true,false):Container(),
            stg.read(OpenScreenMember)==true? sliderItem(stg.read(OpenScreenlogen) == true ? 'مشاريعي'.tr : 'Sign in'.tr, AssestData.my_project, context, () {

              stg.read(OpenScreenlogen) == true ? Get.offAll(() => DashboardScreen(pageIndex: 0,)) : Get.offAllNamed(RoutingApp.login_route);
            }, kColorsWhite, kColorsWhite, false, true,false):Container(),

            // stg.read(OpenScreenlogen)==true?sliderItem('Internal messaging'.tr, "assets/Icons/icon_sending.svg", context,(){
            //   Get.to(() => InternalMessagingScreen());
            // }, kColorsWhite, kColorsWhite, false, true):Container(),


            stg.read(OpenScreenlogen)==true?sliderItem('الخدمات الإلكترونيه'.tr, AssestData.my_service, context,(){

              Get.to(() => ElectronicServicesScreen(show_tabBar: false,IsHome: false));
            }, kColorsWhite, kColorsWhite, false, true,false):Container(),
            SizedBox(
              height: 0.01.sh,
            ),    stg.read(OpenScreenlogen)==true?sliderItem('حافظة العهد '.tr, AssestData.my_bookmark, context,(){

              Get.to(() => KeeperCovenantScreen(show_tabBar: false,IsHome: false));
            }, kColorsWhite, kColorsWhite, false, true,false):Container(),
            SizedBox(
              height: 0.01.sh,
            ),    stg.read(OpenScreenlogen)==true?sliderItem('التقارير'.tr, AssestData.my_chart, context,(){

              Get.to(() => ReportsScreen(show_tabBar: false,IsHome: false));
            }, kColorsWhite, kColorsWhite, false, true,false):Container(),
            SizedBox(
              height: 0.01.sh,
            ),    stg.read(OpenScreenlogen)==true?sliderItem('Profile personly'.tr, "assets/Icons/user.svg", context,(){

              Get.to(() => ProfileScreen());
            }, kColorsWhite, kColorsWhite, false, true,false):Container(),
            SizedBox(
              height: 0.02.sh,
            ),
            stg.read(OpenScreenlogen)==true?Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 0.04.sw,
                    ),
                    Container(
                      height: 1.h, // ارتفاع الـ Divider
                      width: 0.60.sw,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [kColorsWhite.withOpacity(0.3), kColorsWhite.withOpacity(0.3)], // الألوان المستخدمة
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                    Container(
                      width: 0.05.sw,
                    ),

                  ],
                ),
                // العناصر الأخرى
              ],
            ):Container(),
            SizedBox(
              height: 0.03.sh,
            ),
            sliderItem( 'عن التطبيق'.tr, "assets/Icons/icon_about_app.svg", context, () {

              Get.to(() => ApplcatInfoScreen());
            }, kColorsWhite, kColorsWhite, false, true,false),
            sliderItem('Contact us'.tr, "assets/Icons/icon_contact_us.svg", context, () {

              Get.to(() => ContactUsScreen());
            }, kColorsWhite, kColorsWhite, false, true,false),
            stg.read(OpenScreenMember)==true?sliderItem('Change of establishment'.tr, "assets/Icons/chang_member.svg", context, () {
              showDialog(
                context: context,
                builder: (context) => CustomDialog(
                  onPress: () {

                    controlle.LogOutChangestablishment();
                  },
                  text: 'Do you want to change the establishment ?'.tr,
                  Colore: kColorsWhite,
                  ColoreCleare: kColorsLightBlack,
                  backColor1:Color(0xFFB6000D),
                  backColor2: kColorsWhite,
                  fontColortext1: kColorsWhite,
                  fontColortext2: kColorsPrimaryFont,
                  text1: 'Yes'.tr,
                  text2: 'Back'.tr,
                ),
              );
            }, kColorsWhite, kColorsWhite, false, true,false):Container(),
            sliderItem('Change the language'.tr,  AssestData.Languages_Icon, context,
                () async {
                  showDialog(
                    context: context,
                    builder: (context) =>
                    LanguageBottomSheet(),
                  );
                },
                kColorsWhite, kColorsWhite, false, true,false),
            SizedBox(height: 0.01.sh,),
            stg.read(OpenScreenlogen)==true?Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 0.04.sw,
                    ),
                    Container(
                      height: 1.h, // ارتفاع الـ Divider
                      width: 0.60.sw,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [kColorsWhite.withOpacity(0.3), kColorsWhite.withOpacity(0.3)], // الألوان المستخدمة
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                    Container(
                      width: 0.05.sw,
                    ),

                  ],
                ),
                // العناصر الأخرى
              ],
            ):Container(),
            stg.read(OpenScreenlogen) == true ? Padding(
              padding: EdgeInsets.only(
                  top: 30.0.r,
                  left: 12.0.r,
                  right: 12.0.r,
                  bottom: 20.0.r),
              child: Container(
                height: 0.06.sh,
                decoration: BoxDecoration(
                    color: kColorsorangSignOut,
                    borderRadius: BorderRadius.circular(8.r)),
                child: sliderItemLogOUt(
                    'Sign Out'.tr,  AssestData.logout, context,(){
                  showDialog(
                    context: context,
                    builder: (context) => CustomSubmitOptionDialog(
                      onPress: () {

                        controlle.LogOut();
                      },
                      text:   'Are you sure you want to log out?'.tr,
                      Colore: kColorsWhite,
                      ColoreCleare: kColorsLightBlack,
                      backColor1:Color(0xFFFF0606),
                      backColor2: kColorsWhite,
                      fontColortext1: kColorsWhite,
                      fontColortext2: kColorsPrimaryFont,
                      text1: 'نعم متأكد'.tr,
                      text2: 'لا رجوع'.tr,
                    ),
                  );
                }, kColorsRed, kColorsRed, true, false,true),
              ),
            ) : SizedBox(),
          ],
        ),
      ),
    );
  }
}

Widget sliderItem(
    String title,
    String icons,
    BuildContext context,
    Function() onPress,
    Color FontColore,
    Color FontIcon,
    bool? isCenter,
    bool? isUnderFont,
    bool? IsLOgOut,) {
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
                  ?
              IsLOgOut==true?SizedBox(width: 0.05.sw,):SizedBox(width: 0.02.sw,)


                  : SizedBox(
                width: 0.0.sw,
              ),
              Padding(
                padding:   EdgeInsets.only(right:isRtl ? 10.0.r : 0.r, left: isRtl ? 0.0.r : 10.r, ),
                child: SvgPicture.asset(
                  icons,
                  width: 17,
                  height: 22,
                  color: FontIcon,
                  alignment: Alignment.center,
                ),
              ),
              IsLOgOut==true?SizedBox(): SizedBox(
                width: 0.04.sw,
              ),
              Text(title, style:     TextStyle(fontFamily: 'Cairo',fontSize:  14, color: FontColore, fontWeight: FontWeight.w700),),
            ],
          ),
        ],
      ),
    ),
  );
}
Widget sliderItemLogOUt(
    String title,
    String icons,
    BuildContext context,
    Function() onPress,
    Color FontColore,
    Color FontIcon,
    bool? isCenter,
    bool? isUnderFont,
    bool? IsLOgOut,) {
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
              SizedBox(
                width: 0.15.sw,
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
                  ),
                ),
              ),
              IsLOgOut==true?SizedBox(): SizedBox(
                width: 0.04.sw,
              ),
              Text(title, style:TextStyle(fontFamily: 'Cairo',fontSize:  14, color: FontColore, fontWeight: FontWeight.w700),),
            ],
          ),
        ],
      ),
    ),
  );
}


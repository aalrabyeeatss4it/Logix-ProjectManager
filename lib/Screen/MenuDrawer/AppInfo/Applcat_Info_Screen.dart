
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectmanagers/Constants/my_text.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';
import '/Constants/Constants.dart';

class ApplcatInfoScreen extends StatelessWidget {
  final zDApplcatInfoController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return  GestureDetector(
      onTap: () {
        // إغلاق القائمة الجانبية عند الضغط على الشاشة
        zDApplcatInfoController.toggle!(); // أو zDMemberController.close!(); إذا كنت تريد الإغلاق فقط
      },
      child: Scaffold(
        backgroundColor: kColorsWhite,
        body: SafeArea(
          child: ZoomDrawer(
            isRtl: isRtl ? true : false,
            controller: zDApplcatInfoController,
            style: DrawerStyle.style1,
            menuScreen: MenuWidgetDachbord(
              zoomDrawerController: zDApplcatInfoController,
            ),
            mainScreen: Scaffold(
              backgroundColor: kColorsWhite,

              appBar: MyAppBar(title:  'About the app'.tr,zoomDrawerController: zDApplcatInfoController,colorAll:  kColorTab, colorfont: kColorsPrimary,),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(13.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(

                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
                        child: Padding(
                          padding: EdgeInsets.all(10.r),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 0.12.sh,
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: FadeInLeft(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(7.r),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        height: 140.h,
                                        width: 140.w,
                                        imageUrl: stg.read(url).toString() +
                                            stg.read(logo).toString(),
                                        placeholder: (context, url) =>    Image.asset(
                                          'assets/LogoColor.png',
                                          height: 140.h,
                                          width: 140.w,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          'assets/LogoColor.png',
                                          height: 140.h,
                                          width: 140.w,
                                        ),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0.r, right: 8.0.r, bottom: 8.0.r),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Our application provides integrated solutions for electronic archiving, transaction management, alerts, and task management. It enables you to save and share documents efficiently, manage all types of transactions easily, receive alerts in real time, and send customized group messages simply. Its design supports the organizational structure of the organization and facilitates the management of internal and external correspondence.".tr,
                                        style: TextStyle(fontFamily: 'Regular',
                                            fontSize: 14,
                                            color: kColorsPrimary,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      height: 0.05.sh,
                                    ),

                                    Text("1-  "+'Electronic archiving'.tr, style: TextStyle(fontFamily: 'Regular',fontSize: 15, color: kColorsBlack, fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      height: 0.02.sh,
                                    ),
                                    Text("2-  "+'Manage incoming and outgoing transactions'.tr, style: TextStyle(fontFamily: 'Regular',fontSize: 15, color: kColorsBlack, fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      height: 0.02.sh,
                                    ),
                                    Text("3-  "+'Alerts and notifications system'.tr, style: TextStyle(fontFamily: 'Regular',fontSize: 15, color: kColorsBlack, fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      height: 0.02.sh,
                                    ),
                                    Text("4-  "+'Task management'.tr, style: TextStyle(fontFamily: 'Regular',fontSize: 15, color: kColorsBlack, fontWeight: FontWeight.w500)),
                                  ],
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

  Column buildPaddingtext(BuildContext context, String text) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(text,
              maxLines: 4,
              style: TextStyle(fontFamily: 'Regular',fontSize: 14.sp, color: Colors.black)),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }

  Column buildTextTitle(BuildContext context, String text) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10.0.r),
          child: Text(
            text,
            style: MyText.TitleMedumColorePrimary(context),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
      ],
    );
  }

  Padding buildPaddingAdvintgs(
      BuildContext context, String txtSlach, String txtAdvintg) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Row(
        children: [
          Text(
            txtSlach,
            style: TextStyle(fontFamily: 'Regular',fontSize: 12.sp, color: kColorsPrimary),
          ),
          SizedBox(
            width: 5.w,
          ),
          Container(
            width: 280.w,
            child: Padding(
              padding: EdgeInsets.only(top: 3.0.r),
              child: Text(
            txtAdvintg,
            maxLines: 3,
            style: TextStyle(fontFamily: 'Regular',fontSize: 12.sp, color: kColorsPrimary),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}

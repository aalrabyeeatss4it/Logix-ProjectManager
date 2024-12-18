
import 'dart:ui';

import 'package:projectmanagers/Screen/dashboard/ElectronicServices/electronic_services_controller.dart';
import 'package:projectmanagers/widget/buttm_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'package:projectmanagers/widget/custom_textfeild.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ElectronicServicesScreen extends StatefulWidget {

  var show_tabBar;
  ElectronicServicesScreen({this.show_tabBar});
  @override
  State<ElectronicServicesScreen> createState() => _ElectronicServicesScreenState();
}

class _ElectronicServicesScreenState extends State<ElectronicServicesScreen> {
  final zDElectronicServicesController = ZoomDrawerController();
  final controller = Get.put(ElectronicServicesController());
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
      // controller.Revrech();
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
    return  Scaffold(

      body: SafeArea(
        child: ZoomDrawer(
          isRtl: isRtl ? true : false,
          controller: zDElectronicServicesController,
          style: DrawerStyle.style1,
          menuScreen: MenuWidgetDachbord(zoomDrawerController: zDElectronicServicesController,),
          mainScreen: Scaffold(

              appBar: MyAppBar(
                  title: 'الخدمات الإلكترونيه'.tr,
                  zoomDrawerController: zDElectronicServicesController,
                  colorfont: kColorsWhite),
              backgroundColor: kColorsWhite.withOpacity(0.5),
              body:   Container(
                color: kColorsWhite.withOpacity(0.1),
                margin: EdgeInsets.all(6),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Row(

                        children: [
                          buildContainer('English language'.tr,kColorsPrimary,kColorsWhite),
                          buildContainer('English language'.tr,kColorsPrimary,kColorsWhite),
                          buildContainer('English language'.tr,kColorsPrimary,kColorsWhite),
                        ],
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      Row(
                        children: [
                          buildContainer('English language'.tr,kColorsPrimary,kColorsWhite),
                          buildContainer('English language'.tr,kColorsPrimary,kColorsWhite),
                          buildContainer('English language'.tr,kColorsPrimary,kColorsWhite),
                        ],
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      Row(
                        children: [
                          buildContainer('English language'.tr,kColorsPrimary,kColorsWhite),
                          buildContainer('English language'.tr,kColorsPrimary,kColorsWhite),
                          buildContainer('English language'.tr,kColorsPrimary,kColorsWhite),

                        ],
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
          angle: 0.0,
          // drawerShadowsBackgroundColor: Colors.grey[300],
          slideWidth: MediaQuery.of(context).size.width * 0.65.w,
          shadowLayer1Color: kColorsorang,
        ),
      ),
    );
  }
  Widget buildContainer(String text, Color colortext,Color colorborder) {
    return  Row(
      children: [

        Container(
          width: 0.29.sw,
          height: 0.09.sh,
          decoration: BoxDecoration(
              color:kColorsWhite  ,
              borderRadius: BorderRadius.circular(6.r)
          ),
          child: Column(
            children: [
              Expanded(
               flex: 10,
                child: Padding(
                  padding:  EdgeInsets.only(top:  25.0),
                  child: Text(text.toString(),textAlign: TextAlign.center,style: TextStyle(
                      fontSize: 12,
                      color: colortext,
                      fontWeight: FontWeight.w500)),
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(

                    ),
                    Container(
                      width: 0.05.sw,
                      height: 0.07.sh,
                      decoration: BoxDecoration(
                          color: kColorsPrimaryFont ,
                          borderRadius: BorderRadius.only(topRight:Radius.circular(5) )
                      ),

                      child: Padding(
                        padding:  EdgeInsets.all(1.0.r),
                        child: SvgPicture.asset(
                          "assets/Icon/arrow-left2.svg",
                          width: 24.r ,
                          height: 24.r ,
                          color: kColorsWhite,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 0.03.sw,
        ),
      ],
    );
  }
}

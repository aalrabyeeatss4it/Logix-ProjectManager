

import 'package:projectmanagers/Screen/dashboard/Reports/reports_controller.dart';
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

class ReportsScreen extends StatefulWidget {

  var show_tabBar;
  ReportsScreen({this.show_tabBar});
  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final zDReportsController = ZoomDrawerController();
  final controller = Get.put(ReportsController());
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
    return Scaffold(
      backgroundColor: kColorsWhite,
      body: SafeArea(
        child: ZoomDrawer(
          isRtl: isRtl ? true : false,
          controller: zDReportsController,
          style: DrawerStyle.style1,
          menuScreen: MenuWidgetDachbord(zoomDrawerController: zDReportsController,),
          mainScreen: Scaffold(
              appBar: MyAppBar(
                  title: ' التقارير'.tr,
                  zoomDrawerController: zDReportsController,
                  colorfont: kColorsWhite),
              backgroundColor: kColorsWhite,
              body:  controller.obx((ite) =>
                  Container(
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


                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                onLoading:
                Shimmer(child:
                Container(
                  margin: EdgeInsets.only(top: 20.r),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [


                      ],
                    ),
                  ),
                ),
                ),
                onEmpty: Container(),
              )


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
}

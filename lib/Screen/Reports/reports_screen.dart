

import 'package:projectmanagers/Core/Utils/assets.dart';
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

import 'reports_controller.dart';

class ReportsScreen extends StatefulWidget {

  var show_tabBar;
  var IsHome;
  ReportsScreen({this.show_tabBar,    this.IsHome,});
  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
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
      GetSnackMsg(msg: 'No internet connection '.tr,bgClr:kColorsRed ,txClr:kColorsWhite).showTxt();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    widget.show_tabBar == null ? widget.show_tabBar = false : widget.show_tabBar;
    return
      Scaffold(
        appBar: MyAppBar(
            title: ' التقارير'.tr,
            colorfont: kColorsWhite, IsHome: widget.show_tabBar,IconeEnd: false,),
        drawer: Drawer(
          child: MenuWidgetDashboard(), // استخدام قائمة الـ Drawer المخصصة
        ),

        body: SafeArea(
          child: Container(
            color: kColorsWhite.withOpacity(0.1),
            margin: EdgeInsets.all(6),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Row(

                    children: [
                      buildContainer('تقرير بنسبة الإنجاز'.tr,kColorsBlack,kColorsWhite,(){ Get.toNamed(RoutingApp.completion_rate_report_screen);}),
                      buildContainer('تقرير في المهام المنجزة'.tr,kColorsBlack,kColorsWhite,(){ Get.toNamed(RoutingApp.report_completed_tasks_screen); }),
                      buildContainer('تقرير المستندات المؤرشفة'.tr,kColorsBlack,kColorsWhite,(){ Get.toNamed(RoutingApp.archived_documents_report_screen); }),
                    ],
                  ),
                  SizedBox(
                    height: 0.02.sh,
                  ),


                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar:widget.IsHome==true? Container(
          width: double.infinity,
          height: 0.00.sh,)
            :CustomBottomNavBar(selectedMenu: MenuState.home),

      );
  }
  Widget buildContainer(String text, Color colortext,Color colorborder,Function? onpress) {
    return  InkWell(
      onTap: () {
        onpress!();
      },
      child: Row(
        children: [

          Container(
            width: 0.29.sw,
            height: 0.09.sh,
            decoration: BoxDecoration(
              color:kColorsWhite  ,
              borderRadius: BorderRadius.circular(6.r),
              boxShadow: [
                BoxShadow(
                  color: kColorsLightBlackLow.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 5.r,
                  offset:Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 10,
                  child:

                  Center(
                    child: Padding(
                      padding:  EdgeInsets.only(top:  10.0,right: 10.0.r,left: 10.0.r),
                      child: Text(text.toString(),textAlign: TextAlign.center,  style: const TextStyle(
                        color: Color(0xFF242424),
                        fontSize: 12,
                        fontFamily: 'GraphikArabic',
                        fontWeight: FontWeight.w400,
                        height: 1.37,
                      ),),
                    ),
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
                            AssestData.arrow_left2,
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
      ),
    );
  }
}

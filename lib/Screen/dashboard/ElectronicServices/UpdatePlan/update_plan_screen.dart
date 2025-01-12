
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/UpdatePlan/item_update_plan.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/UpdatePlan/update_plan_controller.dart';
import 'package:projectmanagers/Screen/dashboard/home/itemhome.dart';
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
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/custom_date_paker.dart';
import 'package:projectmanagers/widget/custom_textfeild.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class UpdatePlanScreen extends StatefulWidget {

  var show_tabBar;
  UpdatePlanScreen({this.show_tabBar});
  @override
  State<UpdatePlanScreen> createState() => _UpdatePlanScreenState();
}

class _UpdatePlanScreenState extends State<UpdatePlanScreen> {
  final controller = Get.put(UpdatePlanController());
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
    return

      Scaffold(
        appBar:  MyAppBar(
            title: 'تحديث الخطة الزمنية'.tr,
            colorfont: kColorsWhite ),
        drawer: Drawer(
          child: MenuWidgetDashboard(), // استخدام قائمة الـ Drawer المخصصة
        ),

        body: SafeArea(
          child: Container(
            color: kColorsWhite.withOpacity(0.1),
            margin:const EdgeInsets.only(top: 2 ,bottom: 2,left: 8,right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.02.sh,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 0.015.sw,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RoutingApp.add_keeper_covenant_screen);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 0.05.sh,
                                  width:  0.93.sw,
                                  decoration: BoxDecoration(
                                      color: kColorsWhite,
                                      border: Border.all(width: 0.4,color:kColorsBlackTow.withOpacity(0.9) ),
                                      borderRadius: BorderRadius.circular(5.r)

                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(RoutingApp.add_keeper_covenant_screen);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 0.01.sw,
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.all(6.0),
                                          child: SvgPicture.asset(
                                            "assets/Icon/AddKeeper.svg",
                                            width: 14,
                                            height: 14,
                                            color: kColorsBlackTow.withOpacity(0.5),
                                          ),
                                        ),
                                        Text(
                                          'ابحث عن نشاط..'.tr,
                                          style:
                                            TextStyle(fontFamily: 'GraphikArabic',color: kColorsBlackTow.withOpacity(0.5), fontSize: 11,fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(
                              height: 0.005.sh,
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.015.sh,
                ),
                Expanded(
                  child:  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) =>
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ItemUpdatePlan(),
                              SizedBox(
                                height: 0.01.sh,
                              ),
                            ],
                          )),
                ),

              ],
            ),
          ),
        ),
      );

  }
}

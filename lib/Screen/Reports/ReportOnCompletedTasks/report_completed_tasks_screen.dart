

import 'package:projectmanagers/Core/Utils/assets.dart';
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
import 'package:projectmanagers/widget/input_text.dart';
import 'package:projectmanagers/widget/progisser_bar.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import 'filter_model.dart';
import 'item_report_completed_tasks.dart';
import 'report_completed_tasks_controller.dart';

class ReportOnCompletedTasksScreen extends StatefulWidget {

  var show_tabBar;
  var IsHome;
  ReportOnCompletedTasksScreen({this.show_tabBar,    this.IsHome,});
  @override
  State<ReportOnCompletedTasksScreen> createState() => _ReportOnCompletedTasksScreenState();
}

class _ReportOnCompletedTasksScreenState extends State<ReportOnCompletedTasksScreen> {
  final controller = Get.put(ReportOnCompletedTasksController());
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
    widget.show_tabBar == null ? widget.show_tabBar = false : widget.show_tabBar;
    return

      Scaffold(
        appBar:  MyAppBar(
            title: '  تقرير في المهام المنجزة'.tr,
            colorfont: kColorsWhite, IsHome:    widget.show_tabBar),
        drawer: Drawer(
          child: MenuWidgetDashboard(), // استخدام قائمة الـ Drawer المخصصة
        ),

        body: SafeArea(
          child: Container(
            color: kColorsWhite.withOpacity(0.1),
            margin:const EdgeInsets.only(top: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left:12.r, right:12.r,),
                  child: Text("المشروع", style:  const TextStyle(fontSize: 14, color: kColorsBlackTow,  ),
                  ),
                ),
                GetBuilder<ReportOnCompletedTasksController>(
                    init: ReportOnCompletedTasksController(),
                    builder: (co) {
                      return InkWell(
                          onTap: () async {
                            Get.dialog(LoadingIndicatorWidget(),);
                            Get.back();
                            onClickSessionsType(co, context, controller.typeFilterModel!.filter);
                          },
                          child: CustomTextInput(
                            iconEnd: Icon(Icons.keyboard_arrow_down, color: kColorsLightBlack,),
                            textAlign: TextAlign.start,
                            filled: true,
                            isEnabled: false,
                            isRequired: true,
                            labelText:  'undefined'.tr,
                            exText: 'تركيب نظام لجهة خاصة'.tr,
                            textEditingController: controller.TypeFilterTextControll,
                            styleText: const TextStyle(
                              fontSize: 13,
                              color: kColorsBlack,
                            ),
                            hintstyle: const TextStyle(fontSize: 12, color: kColorsLightBlackLow,),
                          ));
                    }),
                SizedBox(
                  height: 0.01.sh,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(RoutingApp.add_keeper_covenant_screen);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:4.0 ),
                            child: Container(
                              height: 0.05.sh,
                              width:  0.96.sw,
                              decoration: BoxDecoration(
                                  color: kColorsWhite,
                                  border: Border.all(width: 0.1,color:kColorsBlackTow ),
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
                                      width: 0.03.sw,
                                    ),
                                    SvgPicture.asset(
                                      AssestData.search,
                                      width: 14,
                                      height: 14,
                                      color: kColorsLightBlack,
                                    ),
                                    SizedBox(
                                      width: 0.03.sw,
                                    ),
                                    Text(
                                      'ابحث عن مهمه..'.tr,
                                      style:
                                      const TextStyle(fontFamily: 'GraphikArabic',color: kColorsLightBlack, fontSize: 12,fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),

                    ],
                  ),
                ),
                Expanded(
                  child:  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) =>
                          Column(
                            children: [
                              ItemReportOnCompletedTasks(),
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
        bottomNavigationBar:widget.IsHome==true? Container(
          width: double.infinity,
          height: 0.00.sh,)
            :CustomBottomNavBar(selectedMenu: MenuState.home),
      );

  }
  onClickSessionsType(
      ReportOnCompletedTasksController controller,
      BuildContext context,
      List<Filter> drop,
      ) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
            color: Get.isDarkMode ? ThemeData.dark().cardColor : Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r))),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: GetBuilder<ReportOnCompletedTasksController>(
              init: ReportOnCompletedTasksController(),
              builder: (buld) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            'Choose'.tr,
                            style: const TextStyle(
                                color: kColorsPrimaryFont,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0.r),
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child:    Image.asset(
                                AssestData.clear,
                                width: 20.r,
                                height: 20.r,
                                color: kColorsWhite,),),
                          ),
                        ],
                      ),
                    ),
                    ...drop.map((e) => InkWell(
                      onTap: () {
                        controller.onChanTypeFilter(e.name.toString(), e.id);
                        Get.back();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(1.0.r),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              side: BorderSide(
                                  width: 1,
                                  color:
                                  kColorsLightBlack.withOpacity(.3))),
                          child: Padding(
                            padding: EdgeInsets.all(8.0.r),
                            child: Text(
                              e.name.toString(),
                              style: const TextStyle(
                                  color: kColorsBlack,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ))
                  ],
                );
              }),
        ),
      )
      ,
      elevation: 2,
      isScrollControlled: true,
    );
  }
}

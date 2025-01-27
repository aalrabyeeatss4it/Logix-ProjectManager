

import 'package:percent_indicator/percent_indicator.dart';
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
import 'completion_rate_report_controller.dart';

class CompletionRateReportScreen extends StatefulWidget {

  var show_tabBar;
  var IsHome;
  CompletionRateReportScreen({this.show_tabBar,    this.IsHome,});
  @override
  State<CompletionRateReportScreen> createState() => _CompletionRateReportScreenState();
}

class _CompletionRateReportScreenState extends State<CompletionRateReportScreen> {
  final controller = Get.put(CompletionRateReportController());
  final _formKey = GlobalKey<FormState>();

  int percentage = 50;
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
    return Scaffold(
        appBar:  MyAppBar(
            title: '   تقرير بنسبة الإنجاز'.tr,
            colorfont: kColorsWhite, IsHome:    widget.show_tabBar),
        drawer: Drawer(
          child: MenuWidgetDashboard(), // استخدام قائمة الـ Drawer المخصصة
        ),
        body: SafeArea(
          child: Container(
            color: kColorsWhite.withOpacity(0.1),
            margin:const EdgeInsets.only(top: 2),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left:12.r, right:12.r,),
                    child: Text("المشروع", style:  const TextStyle(fontSize: 14, color: kColorsBlackTow,),
                    ),
                  ),
                  GetBuilder<CompletionRateReportController>(
                      init: CompletionRateReportController(),
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
                  SizedBox(height: 0.01.sh,),
              
                  Container(
                    width: 0.97.sw,
                    decoration: BoxDecoration(
                      color: kColorsWhite,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: kColorsLightBlackLow.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5.r,
                          offset:Offset(0, 7), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
              
                        Padding(
                          padding:  EdgeInsets.only(left: 0.01.sw,right:  0.01.sw),
                          child: Container(
                            decoration: BoxDecoration(
                              color: kColorsWhite,
                              borderRadius: BorderRadius.circular(7.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 5.0.r, bottom: 5.r,left: 5.0.r,right: 10.0.r),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 0.95.sw,
                                    height: 17,
                                    child: Row(
                                      children: [
                                        Text(
                                          'تاريخ البداية:',
                                          style: TextStyle(
                                            color: Color(0xFF242424),
                                            fontSize: 12,
                                            fontFamily: 'GraphikArabic',
                                       
                                          ),
                                        ),
                                        SizedBox(
                                          width: 0.02.sw,
                                        ),
                                        Text(
                                          '2024/05/01',
                                          style: TextStyle(
                                            color: Color(0xFF242424).withOpacity(0.6),
                                            fontSize: 12,
                                            fontFamily: 'GraphikArabic',
                                            height: 1.37,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 0.04.sw,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: kColorsBlackTow.withOpacity(0.5),
                                              shape: BoxShape.circle
                                          ),
                                          width: 6.r,
                                          height:6.r ,
                                        ),
                                        Container(
                                          color: kColorsBlackTow.withOpacity(0.5),
                                          alignment: Alignment.center,
                                          width: 0.12.sw,
                                          height:1.r ,
                                        ), Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: kColorsBlackTow.withOpacity(0.5),
                                              shape: BoxShape.circle
                                          ),
                                          width: 6.r,
                                          height:6.r ,
                                        ),
                                        SizedBox(
                                          width: 0.02.sw,
                                        ),
                                        Text(
                                          'تاريخ النهاية:',
                                          style: TextStyle(
                                            color: Color(0xFF242424),
                                            fontSize: 12,
                                            fontFamily: 'GraphikArabic',
                                          ),
                                        ),
              
                                        SizedBox(
                                          width: 0.02.sw,
                                        ),
                                        Text(
                                          '2024/05/01',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Color(0xFF242424).withOpacity(0.6),
                                            fontSize: 12,
                                            fontFamily: 'GraphikArabic',
                                            height: 1.37,
                                          ),
                                        ),
              
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 0.035.sh,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12.0, left:  12.0,),
                                    child: Container(
                                      height: 0.5.h, // ارتفاع الـ Divider
                                      decoration: BoxDecoration(
                                        color: kColorsBlackTow,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 0.025.sh,),
                                  Text("الأداء الفني", style: const TextStyle(
                                    color: kColorsPrimaryFont,
                                    fontSize: 14,
                                    fontFamily: 'GraphikArabic',
                                    fontWeight: FontWeight.w400,
                                    height: 1.64,
                                  ),),
                                  SizedBox(
                                    height: 0.025.sh,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircularPercentIndicator(
                                        radius: 65.0,
                                        lineWidth: 25.0,
                                        animation: true,
                                        percent: percentage / 100,
                                        center: Text("$percentage%",   style: const TextStyle(
                                          color: Color(0xFF242424),
                                          fontSize: 10,
                                          fontFamily: 'GraphikArabic',
                                          fontWeight: FontWeight.w400,
                                          height: 1.64,
                                        ),),
                                        circularStrokeCap: CircularStrokeCap.round,
                                        progressColor: kColorsPrimaryFont,
                                        backgroundColor: Color(0xFF0792AD).withOpacity(0.1),
                                      ),
              
                                      Column(
                                        children: [
                                          CustomButton(
                                            color:kColorsPrimaryFont.withOpacity(0.2),
                                            borderRadius: 8.r,
                                            borderColor: kColorsWhite,
                                            sizeHeight: 0.045.sh,
                                            sizeWidth: 0.50.sw,
                                            text:'الإنجاز: 50.00 %'.tr,
                                            style: const TextStyle(
                                              color: kColorsPrimaryFont,
                                              fontSize: 10,
                                              fontFamily: 'GraphikArabic',
                                              fontWeight: FontWeight.w500,
                                              height: 1.64,
                                            ),
                                            onPress: () {
                                            },
                                          ),
                                          SizedBox(
                                            height: 0.005.sh,
                                          ),
                                          CustomButton(
                                            color:Color(0xffFF4747).withOpacity(0.3),
                                            borderRadius: 8.r,
                                            borderColor: kColorsWhite,
                                            sizeHeight: 0.045.sh,
                                            sizeWidth: 0.50.sw,
                                            text:'التأخير: 0.00 %'.tr,
                                            style: const TextStyle(
                                              color: Color(0xffFF4747),
                                              fontSize: 10,
                                              fontFamily: 'GraphikArabic',
                                              fontWeight: FontWeight.w500,
                                              height: 1.64,
                                            ),
                                            onPress: () {
                                            },
                                          ),
                                          SizedBox(
                                            height: 0.005.sh,
                                          ),
                                          CustomButton(
                                            color:Color(0xff686868).withOpacity(0.2),
                                            borderRadius: 8.r,
                                            borderColor: kColorsWhite,
                                            sizeHeight: 0.045.sh,
                                            sizeWidth: 0.50.sw,
                                            text:'المتبقي: 0.00 %'.tr,
                                            style: const TextStyle(
                                              color: Color(0xff686868),
                                              fontSize: 10,
                                              fontFamily: 'GraphikArabic',
                                              fontWeight: FontWeight.w500,
                                              height: 1.64,
                                            ),
                                            onPress: () {
                                            },
                                          ),
                                        ],
                                      ),
              
              
              
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.02.sh,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:  12.0),
                          child: Container(
                            height: 0.10.h, // ارتفاع الـ Divider
                            decoration: BoxDecoration(
                            color: kColorsBlackTow,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.02.sh,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 0.01.sw,right:  0.01.sw),
                          child: Container(
                            decoration: BoxDecoration(
                              color: kColorsWhite,
                              borderRadius: BorderRadius.circular(7.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 5.0.r, bottom: 5.r,left: 5.0.r,right: 10.0.r),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("  الأداء المالي",   style: const TextStyle(
                                    color: Color(0xFFF9A61A),
                                    fontSize: 14,
                                    fontFamily: 'GraphikArabic',
                                    fontWeight: FontWeight.w500,
                                    height: 1.64,
                                  ),),
                                  SizedBox(
                                    height: 0.025.sh,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircularPercentIndicator(
                                        radius: 65.0,
                                        lineWidth: 25.0,
                                        animation: true,
                                        percent: percentage / 100,
                                        center: Text("$percentage%",   style: const TextStyle(
                                          color: Color(0xFF242424),
                                          fontSize: 10,
                                          fontFamily: 'GraphikArabic',
                                          fontWeight: FontWeight.w400,
                                          height: 1.64,
                                        ),),
                                        circularStrokeCap: CircularStrokeCap.round,
                                        progressColor: Color(0xFFF9A61A),
                                        backgroundColor: Color(0xFFF9A61A).withOpacity(0.1),
                                      ),
                                      Column(
                                        children: [
                                          CustomButton(
                                            color:Color(0xFFF9A61A).withOpacity(0.1),
                                            borderRadius: 8.r,
                                            borderColor: kColorsWhite,
                                            sizeHeight: 0.045.sh,
                                            sizeWidth: 0.50.sw,
                                            text:'الإنجاز: 50.00 %'.tr,
                                            style: const TextStyle(
                                              color: Color(0xFFF9A61A),
                                              fontSize: 10,
                                              fontFamily: 'GraphikArabic',
                                              fontWeight: FontWeight.w500,
                                              height: 1.64,
                                            ),
                                            onPress: () {
                                            },
                                          ),
                                          SizedBox(
                                            height: 0.005.sh,
                                          ),
                                          CustomButton(
                                            color:Color(0xffFF4747).withOpacity(0.3),
                                            borderRadius: 8.r,
                                            borderColor: kColorsWhite,
                                            sizeHeight: 0.045.sh,
                                            sizeWidth: 0.50.sw,
                                            text:'التأخير: 0.00 %'.tr,
                                            style: const TextStyle(
                                              color: Color(0xffFF4747),
                                              fontSize: 10,
                                              fontFamily: 'GraphikArabic',
                                              fontWeight: FontWeight.w500,
                                              height: 1.64,
                                            ),
                                            onPress: () {
                                            },
                                          ),
                                          SizedBox(
                                            height: 0.005.sh,
                                          ),
                                          CustomButton(
                                            color:Color(0xff686868).withOpacity(0.2),
                                            borderRadius: 8.r,
                                            borderColor: kColorsWhite,
                                            sizeHeight: 0.045.sh,
                                            sizeWidth: 0.50.sw,
                                            text:'المتبقي: 0.00 %'.tr,
                                            style: const TextStyle(
                                              color: Color(0xff686868),
                                              fontSize: 10,
                                              fontFamily: 'GraphikArabic',
                                              fontWeight: FontWeight.w500,
                                              height: 1.64,
                                            ),
                                            onPress: () {
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.015.sh,
                        ),
                      ],
                    ),
                  )
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
  onClickSessionsType(
      CompletionRateReportController controller,
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
          child: GetBuilder<CompletionRateReportController>(
              init: CompletionRateReportController(),
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

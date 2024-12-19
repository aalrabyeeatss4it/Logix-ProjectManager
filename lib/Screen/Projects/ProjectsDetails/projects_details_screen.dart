import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/projects_details_controller.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'package:projectmanagers/widget/buttm_navigator_bar.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/custom_row_text.dart';
import 'package:projectmanagers/widget/custom_textfeild.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ProjectsDetailsScreen extends StatefulWidget {

  var show_tabBar;
  ProjectsDetailsScreen({this.show_tabBar});
  @override
  State<ProjectsDetailsScreen> createState() => _ProjectsDetailsScreenState();
}

class _ProjectsDetailsScreenState extends State<ProjectsDetailsScreen> {
  final zDProjectsDetailsController = ZoomDrawerController();
  final controller = Get.put(ProjectsDetailsController());
  int percentage = 50;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {

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
          controller: zDProjectsDetailsController,
          style: DrawerStyle.style1,
          menuScreen: MenuWidgetDachbord(zoomDrawerController: zDProjectsDetailsController,),
          mainScreen: Scaffold(
            appBar: MyAppBar(
                title: 'تفاصيل المشروع'.tr,
                zoomDrawerController: zDProjectsDetailsController,
                colorfont: kColorsWhite),
            backgroundColor:kColorsWhite.withOpacity(0.5),
            body:     Container(
              color:  kColorsWhite.withOpacity(0.1),
              margin: EdgeInsets.only(top: 20.r),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children:[
                    SizedBox(
                      height: 0.01.sh,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 0.01.sw,right:  0.01.sw),
                          child: Container(
                            width: 343.w,
                            decoration: BoxDecoration(
                              color: kColorsWhite,
                              borderRadius: BorderRadius.circular(7.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 5.0.r, bottom: 5.r,left: 5.0.r,right: 10.0.r),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color:kColorsWhite  ,
                                            borderRadius: BorderRadius.circular(10.r)
                                        ),
                                        padding:  EdgeInsets.only(top:  2.0.r,right: 6.r,bottom: 2.r),
                                        width: 0.99.sw,
                                        child: Row(

                                          children: [
                                            Expanded(
                                                flex:9,
                                                child: Text('تركيب نظام لجهه خاصه'.tr,  style: TextStyle(fontFamily: 'Regular',fontSize: 14, color:kColorsBlack , fontWeight: FontWeight.w500,))),
                                            Expanded(
                                              flex:5,
                                              child: CustomButton(
                                                color:Color(0xffFF744A).withOpacity(0.3),
                                                borderRadius: 8.r,
                                                borderColor:  kColorsPrimary,
                                                sizeHeight: 0.04.sh,
                                                sizeWidth: 0.30.sw,
                                                text:'متأخر بشكل بسيط'.tr,
                                                style: TextStyle(fontFamily: 'Regular',
                                                    fontSize: 12,
                                                    color: Color(0xffFF744A)),
                                                onPress: () {
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex:9,
                                        child: Column(
                                          children: [
                                            CustomRowText(text: 'تاريخ البدايه'.tr,textStyle: TextStyle(fontFamily: 'Regular',fontSize: 12, color:Color(0xff242424) , fontWeight: FontWeight.w500,),textValue: "2022/2/2",textValueStyle: TextStyle(fontFamily: 'Regular',fontSize: 10, color: kColorsBlack,),backColor: kColorsLightBlackLow,flex: 4,),
                                            CustomRowText(text: ' تاريخ النهايه'.tr,textStyle: TextStyle( fontFamily: 'Regular',fontSize: 12, color:Color(0xff242424) , fontWeight: FontWeight.w500,),textValue: "2026/2/2",textValueStyle: TextStyle(fontFamily: 'Regular',fontSize: 10, color: kColorsBlack,),backColor: kColorsLightBlackLow,flex: 4,),
                                            CustomRowText(text: 'مرحلة المشروع'.tr,textStyle: TextStyle(fontFamily: 'Regular',fontSize: 12, color:Color(0xff242424) , fontWeight: FontWeight.w500,),textValue: "sgsgsg",textValueStyle: TextStyle(fontFamily: 'Regular',fontSize: 10, color: kColorsBlack,),backColor: kColorsLightBlackLow,flex: 4,),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex:4,
                                        child:CircularPercentIndicator(
                                          radius: 35.0,

                                          lineWidth: 15.0,
                                          animation: true,
                                          percent: percentage / 100,
                                          center: Text("$percentage%", style: TextStyle(fontSize: 12.0),),
                                          circularStrokeCap: CircularStrokeCap.round,
                                          progressColor: kColorsPrimaryFont,
                                          backgroundColor: kColorsPrimaryFont.withOpacity(0.2),
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.01.sh,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.01.sh,
                    ),
                    BuldContinerHR("المعلومات الماليه".tr, "assets/Icon/wallet.svg",kColorsPrimary,Color(0xffD4E8EF),(){Get.toNamed(RoutingApp.financial_information_screen);}),
                    BuldContinerHR("مكتبة المستندات".tr, "assets/Icon/folder-open.svg",kColorsPrimary,Color(0xffD4E8EF),(){Get.toNamed(RoutingApp.document_library_screen);}),
                    BuldContinerHR("المعلومات الفنيه".tr, "assets/Icon/document.svg",kColorsPrimary,Color(0xffD4E8EF),(){Get.toNamed(RoutingApp.technical_information_screen);}),
                    BuldContinerHR("المهام التي تنفيذها".tr, "assets/Icon/task-square.svg",kColorsPrimary,Color(0xffD4E8EF),(){Get.toNamed(RoutingApp.tasks_performed_screen);}),

                  ],
                ),
              ),
            ),
          ),
          clipMainScreen: true,
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
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home,),
    );
  }

  Widget BuldContinerHR(String TextChart ,String IconBerore,Color IconColore,Color ColorLain,Function()? Onpress1) {
    return
      InkWell(
          onTap:Onpress1,
          borderRadius:BorderRadius.circular(12.r) ,
          child:Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 17.0.r,right: 17.0.r),
                child: Container(
                  height: 0.07.sh,
                  decoration: BoxDecoration(
                    color: kColorsWhite,
                    borderRadius: BorderRadius.circular(7.r),
                    boxShadow: [
                      BoxShadow(
                        color: kColorsLightBlackLow.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 5.r,
                        offset:Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0.r, bottom: 10.r,left: 5.0.r ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            IconBerore!,
                            width: 24.r ,
                            height: 24.r ,
                            color: IconColore,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                              TextChart.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff242424),
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            "assets/Icon/arrow-left.svg",
                            width: 24.r ,
                            height: 24.r ,
                            color: kColorsBlack,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.01.sh,
              ),
            ],
          )
      )  ;

  }

}

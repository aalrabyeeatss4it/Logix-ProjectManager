import 'dart:ui';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Models/wizard.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widget/customButton.dart';
class CardWizardOverlapRoute extends StatefulWidget {

  CardWizardOverlapRoute();

  @override
  CardWizardOverlapRouteState createState() => new CardWizardOverlapRouteState();
}

class CardWizardOverlapRouteState extends State<CardWizardOverlapRoute> {
  static  const String screenRoute='CardWizardOverlapRouteState';
  List<Wizard> wizardData = getWizard() ;
  static List<Wizard> getWizard() {
    List<Wizard> items = [];
    List<String> wizard_title = [
      'Electronic archive'.tr,
      'Managing outgoing and incoming transactions'.tr,
      'Alerts and notifications system'.tr,
      'Task Management'.tr,
    ];
    const List<String> wizard_image = [
      "noun-folder-website-4378842 1.svg", "noun-data-transfer-5876010 1.svg","noun-notification-6748259 1.svg","noun-email-configuration-5867256 1.svg",
    ];
    List<String> wizard_brief = [
      'A comprehensive electronic archive for storing and sharing documents, supporting the archiving tree and organizational structure for managing outgoing and incoming correspondence and transactions.'.tr,
      'An integrated system that includes all types and forms of transactions and correspondence within institutions, whether internal or external administrative correspondence (outgoing and incoming).'.tr,
      "Stay on top of the action and keep employees informed of every update and every task assigned to them via an alerts and notifications system.".tr,
      "A system for sending personalized mass messages via email or text, with the ability to customize recipients and schedule sending for the future.".tr,
       ];
    List<Color> wizard_color = [
      kColorsPrimary,
      kColorsPrimary,
      kColorsPrimary,
      kColorsPrimary,
    ];
    for (int i = 0; i < wizard_title.length; i++) {
      Wizard obj = new Wizard();
      obj.image = wizard_image[i];
      obj.title = wizard_title[i];
      obj.brief = wizard_brief[i];
      obj.color = wizard_color[i];
      items.add(obj);
    }
    return items;
  }

  PageController pageController = PageController(
    initialPage: 0,
  );
  int page = 0;
  bool isLast = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:Colors.white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(0),
          child: Container(color: Colors.white)),
      body: Column(

        children: [
          Container(
            color:  Color(0xffD0DDED),
            child: Padding(
              padding:  EdgeInsets.only(top:  0.01.sh),
              child: Row(
                children: [
                  SizedBox(width: 0.70.sw,),
                  CustomButton(
                    IconEnd: SvgPicture.asset(
                      "assets/Icons/back.svg",
                      width: 15.r,
                      height: 15.r,
                      color: kColorsLightBlack,
                    ),
                    isIconEnd: true,
                    sizeWidth: 0.25.sw,
                    borderColor: Color(0xffD0DDED),
                    text: 'back'.tr,
                    color:Color(0xffD0DDED),
                    style:  TextStyle(fontFamily: 'Cairo',
                      color: Color(0xFF5C6672),
                      fontSize: 16,
                    ),
                    onPress: () {
                      print("OpenAppOne in Carz back"+ stg.read(OpenAppOne).toString());
                      setState(() {
                        stg.write(OpenCardWizard,'OpenCardWizard' );
                        Get.offAllNamed(RoutingApp.splashRoute);
                      });

                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 1.0.sw,
            height: 0.88.sh,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Container(
                  width: 1.0.sw,
                  height: 0.97.sh,
                  decoration: BoxDecoration(color: Color(0xffD0DDED)),
                ),
                PageView(
                  onPageChanged: onPageViewChange,
                  controller: pageController,
                  children: buildPageViewItem(),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  void onPageViewChange(int _page) {

    setState(() {
      page = _page;
      isLast = _page == wizardData.length-1;
    });
  }

  List<Widget> buildPageViewItem(){
    List<Widget> widgets = [];
    for(Wizard wz in wizardData){
      Widget wg = Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            left: 0.20.sw,
            top: 0.04.sh,
            child: Container(
              width: 0.58.sw,
              height: 0.40.sh,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 5, color: Color(0x423570B7)),
                  borderRadius: BorderRadius.circular(24),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 16,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child:  Container(
                width: 0.29.sw,
                height: 0.15.sh,
                child: Padding(
                  padding:  EdgeInsets.only(left: 48.r,right:  48.r,bottom:  0.03.sh.r),
                  child: SvgPicture.asset(
                    "assets/Icons/"+wz.image,
                    width: 0.29.sw,
                    height: 0.09.sh,
                    color: Color(0xFF3570B7),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            left: 0,
            top: 0.42.sh,
            child: Container(
              width: 1.0.sw,

              height: 0.65.sh,
              decoration: BoxDecoration(
              color: kColorsWhite,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x773570B7),
                    blurRadius: 44,
                    offset: Offset(0, -42),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(top:   0.50.sh,right: 10.r,left: 10.r),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 0.01.sh,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: buildDots(context),
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top:   0.27.sh,right: 10.r,left: 10.r),
            child: SizedBox(
              width: 0.90.sw,
              child:     Text(wz.title,
                // 'إدارة معاملات الصادر والوارد - Incoming / Export process',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Cairo',
                  color: Color(0xFF242424),
                  fontSize: 24,

                  fontWeight: FontWeight.w700,
                  height: 0.07,
                ),
              ),
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(top:   0.50.sh,right: 10.r,left: 10.r),
            child: Text(
              textAlign: TextAlign.center,
              wz.brief,
              style: TextStyle(fontFamily: 'Cairo',
                fontSize: 16,
                color: kColorsLightBlack,),

            ),
          ),

          Padding(
            padding:  EdgeInsets.only(top:0.80.sh,),
            child: CustomButton(
              sizeHeight: 0.06.sh,
              sizeWidth: 0.90.sw,
              text:isLast ? 'Get started now'.tr:'Next'.tr,
              color: Color(0xFF3570B7),
              style:  TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14.sp,
                  color: kColorsWhite
              ),
              onPress: () {
                print("OpenAppOne in Carz"+ stg.read(OpenAppOne).toString());
                setState(() {
                  print("isLastOut= "+isLast.toString());
                  if(isLast){
                    print("isLast= "+isLast.toString());
                    stg.write(OpenCardWizard, true);
                    Get.offAllNamed(RoutingApp.splashRoute);

                    return;
                  }
                  pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                });

              },
            ),
          ),

        ],
      );
      widgets.add(wg);
    }
    return widgets;
  }

  Widget buildDots(BuildContext context){
    Widget widget;
    List<Widget> dots = [];
    for(int i=0; i<wizardData.length; i++){
      Widget w = Container(
        margin: EdgeInsets.symmetric(horizontal: 3.r),
        height: 9.h,
        width:page == i ? 28 :8,
        decoration:page == i ? BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: kColorsPrimary,
        ):
        BoxDecoration(
          color: kColorbackgroundCard,
          borderRadius: BorderRadius.circular(4.r),
        ),


      );

      dots.add(w);
    }
    widget = Row(
      mainAxisSize: MainAxisSize.min,
      children: dots,
    );
    return widget;
  }
}


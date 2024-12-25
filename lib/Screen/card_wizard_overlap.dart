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
      'إدارة مشاريعك بمنتهى السهوله'.tr,
      'خدمات إلكترونيه متكامله'.tr,
      'تنظيم كامل للعهد'.tr,
      'تقارير وإحصائيات شامله'.tr,
    ];
    const List<String> wizard_image = [
      "wizard1.svg",
      "wiazrd2.svg",
      "wiazrd3.svg",
      "wiazrd4.svg",
    ];
    List<String> wizard_brief = [
      'تابع جميع تفاصيل مشاريعك وراقب تقدمها بمرونه, من المهام اليوميه إلى تصنيفات المشاريع. '.tr,
      'انجز طلباتك بسرعة وسهولة من خلال شاشة واحدة تضمن لك الكفاءة في العمل.'.tr,
      "احتفظ بجميع بيانات العهد الخاصة بك مُنظمة ومحدثة، لتسهيل إدارتها ومتابعتها.".tr,
      "استعرض أداء مشاريعك بوضوح عبر تقارير دقيقة وإحصائيات تدعم قراراتك.".tr,
       ];
    List<Color> wizard_color = [
      kColorsPrimaryFont,
      kColorsPrimaryFont,
      kColorsPrimaryFont,
      kColorsPrimaryFont,
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
      backgroundColor:  kColorsPrimaryFont,
      appBar: PreferredSize(preferredSize: Size.fromHeight(0),
          child: Container(color: kColorsPrimaryFont)),
      body: Container(
        color: kColorsPrimaryFont,
        width: 1.0.sw,
        height: 1.0.sh,
        child: SingleChildScrollView(
          child: Column(

            children: [
              SizedBox(height: 0.04.sh,),
              Padding(
                padding:   EdgeInsets.symmetric(horizontal:  18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:(){
                        pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeOut);
                      },
                      child: SvgPicture.asset(
                        "assets/Icon/arraw_rajhit.svg",
                        width: 24,
                        height: 24,
                        color: kColorsWhite,
                      ),
                    ),

                    CustomButton(
                      sizeHeight: 0.045.sh,
                      sizeWidth: 0.18.sw,
                      borderColor: kColorsWhite.withOpacity(0.1),
                      text: 'back'.tr,
                      color:kColorsWhite.withOpacity(0.1),
                      style:  TextStyle(fontFamily: 'GraphikArabic',
                        color: kColorsWhite,
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
              SizedBox(height: 0.03.sh,),
              Container(
                width: 1.0.sw,
                child: Stack(
                  alignment:  Alignment.center,
                  children: [
                    Container(
                      width: 0.90.sw,
                      height: 0.91.sh,
                      decoration: ShapeDecoration(
                        color: kColorsWhite.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),),),

                    ),
                    Positioned(
                      bottom: 6,
                      child: Container(
                        width: 1.0.sw,
                        height: 0.88.sh,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kColorsWhite,
                        ),
                        child:     PageView(
                          onPageChanged: onPageViewChange,
                          controller: pageController,
                          children: buildPageViewItem(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
      Widget wg = Column(
        children: <Widget>[
          SizedBox(
            height: 0.16.sh,
          ),
          Padding(
            padding:  EdgeInsets.only(right: 10.r,left: 10.r),
            child:SvgPicture.asset(
              "assets/"+wz.image,
              width: 0.29.sw,
              height: 0.13.sh,
            ),
          ),
          SizedBox(
            height: 0.06.sh,
          ),
          Padding(
            padding:  EdgeInsets.only(right: 10.r,left: 10.r),
            child: SizedBox(
              width: 0.90.sw,
              child:     Text(wz.title,
                // 'إدارة معاملات الصادر والوارد - Incoming / Export process',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'GraphikArabic',
                  color: Color(0xFF242424),
                  fontSize: 24,

                  fontWeight: FontWeight.w500,
                  height: 0.07,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.03.sh,
          ),
          Padding(
            padding:  EdgeInsets.only(right: 15.r,left: 15.r),
            child: Text(
              textAlign: TextAlign.center,
              wz.brief,
              style: TextStyle(fontFamily: 'GraphikArabic',
                fontSize: 14,
                color: kColorsLightBlack,),
            ),
          ),
          SizedBox(
            height: 0.065.sh,
          ),
          Padding(
            padding:  EdgeInsets.only(right: 10.r,left: 10.r),
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

          SizedBox(
            height: 0.140.sh,
          ),

          CustomButton(
            sizeHeight: 0.06.sh,
            sizeWidth: 0.90.sw,
            text:isLast ? 'تسجيل الدخول'.tr:'Next'.tr,
            color: kColorsPrimaryFont,
            style:  TextStyle(
                fontFamily: 'GraphikArabic',
                fontSize: 16,
                fontWeight: FontWeight.w500,
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
          SizedBox(
            height: 0.10.sh,
          ),
          Padding(
            padding:  EdgeInsets.only(top:0.0.sh,),
            child: Container(
                width:0.35.sw,
                height:  .005.sh,
                decoration: BoxDecoration(
                  color: kColorsBlack,
                  borderRadius: BorderRadius.circular(7.r),
                )

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
        margin: EdgeInsets.symmetric(horizontal: 6),
        height: 0.007.sh,
        width:0.18.sw,
        decoration:page == i ? BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: kColorsPrimaryFont,
        ):
        BoxDecoration(
          color: kColorbackgroundCard.withOpacity(0.5),
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


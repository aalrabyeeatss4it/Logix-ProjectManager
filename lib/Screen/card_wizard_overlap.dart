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
      appBar: PreferredSize(preferredSize: Size.fromHeight(0),
          child: Container(color: kColorsPrimaryFont)),
      body: Column(

        children: [
          Container(
            height: 0.15.sh,
            color:  kColorsPrimaryFont,
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
                    style:  TextStyle(fontFamily: 'GraphikArabic',
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
            height: 0.80.sh,
            decoration: BoxDecoration(color: kColorsPrimaryFont),
            child: Stack(
              children: [
                // Container الخلفية
                Container(
                  width: 1.0.sw,
                  height: 0.03.sh,

                ),
                Positioned(
                  top: -0.1.sh, // تحريك 10% للأعلى
                  left: 0.04.sw, // محاذاة للوسط
                  child: Container(
                    width: 0.92.sw,
                    height: 0.80.sh,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: kColorsRed,
                    ),
                  ),
                ),

                Container(
                  width: 1.0.sw,
                  height: 0.80.sh,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: kColorsWhite,
                  ),
                ),

                // Container ملون باللون الأحمر

                // PageView
                PageView(
                  onPageChanged: onPageViewChange,
                  controller: pageController,
                  children: buildPageViewItem(),
                ),

              ],
            ),
          )
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
      Widget wg = Column(
        children: <Widget>[
          SizedBox(
            height: 0.13.sh,
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
            height: 0.07.sh,
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
            height: 0.07.sh,
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
            height: 0.13.sh,
          ),

          CustomButton(
            sizeHeight: 0.06.sh,
            sizeWidth: 0.90.sw,
            text:isLast ? 'Get started now'.tr:'Next'.tr,
            color: kColorsPrimaryFont,
            style:  TextStyle(
                fontFamily: 'GraphikArabic',
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
          SizedBox(
            height: 0.11.sh,
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


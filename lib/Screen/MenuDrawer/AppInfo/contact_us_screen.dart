
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';
import 'package:url_launcher/url_launcher.dart';

import '/Constants/Constants.dart';
class ContactUsScreen extends StatelessWidget {
  final zDContactUsController=ZoomDrawerController();
  @override
  Widget build(BuildContext context) {

    final isRtl = Localizations.localeOf(context).languageCode=='ar';
    return  GestureDetector(
      onTap: () {
        // إغلاق القائمة الجانبية عند الضغط على الشاشة
        zDContactUsController.toggle!(); // أو zDMemberController.close!(); إذا كنت تريد الإغلاق فقط
      },
      child: Scaffold(
        backgroundColor: kColorsWhite,
        body:  SafeArea(
          child: ZoomDrawer(isRtl:isRtl?true: false,
            controller: zDContactUsController,
            style: DrawerStyle.style1,
            menuScreen: MenuWidgetDachbord(zoomDrawerController: zDContactUsController,),
            mainScreen:Scaffold(
            backgroundColor: kColorsWhite,
            appBar: MyAppBar(title:  'Contact us'.tr,zoomDrawerController: zDContactUsController,colorAll:  kColorTab, colorfont: kColorsPrimary,),
            body: Container(

                width: double.infinity,
               color: kColorsWhite,
                child: SingleChildScrollView(
                  child: Column(
                    children: [


                      SizedBox(
                        height: 0.02.sh,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal:  15.0.r),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            buildCardContact(context,'Website'.tr,'https://lijantech.com/',   "assets/Icons/icon_websaite.svg",   "assets/Icons/icon_websaite.svg",'Website'),
                            buildCardContact(context,'Unified number'.tr,'+966 50 020 2248',   "assets/Icons/icone_call.svg",   "assets/Icons/icone_call.svg",'Mobile'),
                            buildCardContact(context,'Email'.tr,'marketing@ss4it.com.sa',   "assets/Icons/icone_direct.svg",   "assets/Icons/icone_direct.svg",'Email'),
                            buildCardContact(context,'Location'.tr,'https://www.google.com/maps/place/%D8%A7%D9%84%D8%AD%D9%84%D9%88%D9%84+%D8%A7%D9%84%D9%82%D9%8A%D8%A7%D8%B3%D9%8A%D8%A9+%D9%84%D8%AA%D9%82%D9%86%D9%8A%D8%A9+%D8%A7%D9%84%D9%85%D8%B9%D9%84%D9%88%D9%85%D8%A7%D8%AA%E2%80%AD/@24.6819463,46.6926869,17z/data=!3m1!4b1!4m5!3m4!1s0x3e2f048a70fb455d:0x70ad30e932737f9b!8m2!3d24.681856!4d46.6905443',   "assets/Icons/icone_map.svg",   "assets/Icons/icone_map.svg",'Location'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.30.sh,
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

      ),
    );

  }

  Widget buildCardContact(BuildContext context,String txt,String url,String beforIcon,String afterIcon,String typeControllar) {
    final isRtl = Localizations.localeOf(context).languageCode=='ar';
    return Container(
        margin: EdgeInsets.only(top: 6.0.r, bottom: 4.0.r, left: 8.0.r, right:  8.0.r),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:kColorsLightBlack,
            blurRadius: 1,
            offset: Offset(0, -0),
            spreadRadius: 0,
          )
        ],
        borderRadius: BorderRadius.circular(10.r),
        color: kColorsWhite,
      ),

      child: Row(

        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding:  EdgeInsets.only(right:isRtl?  8.0.r: 0.0.r,left:isRtl?  0.0.r: 8.0.r ,top: 5.0.r,bottom: 5.0.r ),
              child: Container(
                  decoration: BoxDecoration(

                    color:kColorsPrimary.withOpacity(0.2),
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(5.r),topRight: Radius.circular(5.r),bottomLeft: Radius.circular(5.r),bottomRight: Radius.circular(5.r)),
                  ),
                  height: 41.h,
                  width: 41.w,
                  child: Padding(
                    padding:  EdgeInsets.all( 5.0.r,),
                    child:
                    SvgPicture.asset(
                      beforIcon,
                      width: 24.r,
                      height: 24.r,
                      color: kColorsPrimary,
                      alignment: Alignment.center,
                    ),


                  )
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:  8.0.r),
              child: Text(
                txt,
                textAlign: TextAlign.start,
                style:TextStyle(fontFamily: 'Cairo',
                  fontSize: 16,
                  color: kColorsLightBlack,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () =>typeControllar=='Mobile' ? showAlert(context,url) :typeControllar=='Email' ? launch('mailto:' + url)  : (){} ,
              child: SvgPicture.asset(
                "assets/Icons/arrow-angle-left.svg",
                width: 24.r,
                height: 24.r,
                color: kColorsLightBlack,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
         ),
    );
  }

  Widget BuldContainer(String text,String Icone,Color fontColor,Color iconeColore,Color backColore,Function onpress) {
    return Container(
      height: 0.10.sh,
      decoration: BoxDecoration(
          color: kColorsPrimary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5.r)),
      child: Padding(
        padding:  EdgeInsets.only(top:  9.0.r),
        child: InkWell(
          onTap: () async{
            onpress();
          },
          child: Column(
            children: [
              SvgPicture.asset(
                Icone.toString(),
                width: 27,
                height: 27.r,
                color: kColorsPrimary,
              ),
              Padding(
                padding:  EdgeInsets.only(top:  8.0),
                child: Text(
                  text,
                  style:
                  TextStyle(fontFamily: 'Cairo',color: fontColor, fontSize: 13,fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  showAlert(BuildContext context,String phoneNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Card(
            child: Container(
              alignment: Alignment.center,
              height: 0.20.sh,
              width: 0.9.sw,
              decoration: BoxDecoration(
                  color: kColorsWhite, borderRadius: BorderRadius.circular(20.r)),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top:  8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      SizedBox(
                        width: 53.w,
                      ),
                          Text(
                            'Contact us'.tr,
                            style:
                            TextStyle(fontFamily: 'Cairo',color: kColorsPrimary, fontSize: 16,fontWeight: FontWeight.w500),
                          ),
                      Padding(
                        padding:
                        EdgeInsets.only(right: 6.0.r, left: 16.0.r, top: 6.0.r),
                        //child: Image.asset("assets/Icons/DirectionRight.png", width: 25, height: 25),
                        child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child:
                            SvgPicture.asset(
                              "assets/Icons/icone_exit.svg",
                              width: 20,
                              height: 20.r,

                            ),

                          ),
                      ),
                    ]),
                  ),


                  SizedBox(
                    height: 0.03.sh,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(2.r),
                    child: Form(

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(

                            children: [
                              Expanded(
                                flex:1,
                                child: SizedBox(),
                              ),
                              Expanded(
                                  flex:6,
                                  child: BuldContainer("رسالة نصية".tr,  "assets/Icons/icone_message-text.svg",kColorsPrimary,kColorsPrimary,kColorGrayCard,(){launch('sms:' + phoneNumber);}
                                  )),
                              Expanded(
                                flex:1,
                                child: SizedBox(

                                ),
                              ),
                              Expanded(
                                  flex:6,
                                  child: BuldContainer('connection'.tr, "assets/Icons/icone_call-add.svg",kColorsPrimary,kColorsPrimary,kColorGrayCard,(){launch('tel:' + phoneNumber);})
                              ),
                              Expanded(
                                flex:1,
                                child: SizedBox(

                                ),
                              ),
                              Expanded(
                                flex:6,
                                child: BuldContainer( 'WhatsApp'.tr, "assets/Icons/icone_whatsapp.svg" ,kColorsPrimary,kColorsPrimary,kColorGrayCard,(){launch('https://wa.me/' + phoneNumber);}),
                              ),
                              Expanded(
                                flex:1,
                                child: SizedBox(
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}

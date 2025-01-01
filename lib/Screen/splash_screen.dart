import 'dart:async';
import 'package:flutter/services.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '/Constants/Constants.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("on start app from timer");
    Timer(
         Duration(seconds: 2 ), () {
      stg.read(OpenCardWizard) == null ?Get.offAllNamed( RoutingApp.cardWizardOverlapScreenRoute)  : stg.read(OpenScreenMember) == null ? Get.offAllNamed(
        RoutingApp.member_screen,) : stg.read(OpenScreenlogen) == null ?
      Get.offAllNamed(RoutingApp.login_route,) : Get.offAllNamed(RoutingApp.dashboardRoute);


    });
    print("on start app from timer");
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kColorsPrimaryFont, // اللون الخلفي لشريط الحالة
      statusBarIconBrightness: Brightness.light, // لون الأيقونات (فاتح أو داكن)
    ));
    return Scaffold(
      body:   Container(
        width: double.infinity,
        height: 1.0.sh,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Stack(
             children: [
               Container(
                 width:double.infinity,
                 height: 1.0.sh,
                 decoration: BoxDecoration(
                     color: kColorsPrimaryFont,
                     image:DecorationImage(image:
                     AssetImage('assets/logooPng.png'

                     ),fit: BoxFit.scaleDown,)
                 ),
               ),
               Positioned(
                 top: 853,
                 right: 135,
                 child: Container(

                     width:0.35.sw,

                     height:  .004.sh,
                     decoration: BoxDecoration(
                       color: kColorsWhite,
                       borderRadius: BorderRadius.circular(7.r),
                     )

                 ),
               ),
             ],



            ),




          ],
        ),
      ),
    );
  }
}

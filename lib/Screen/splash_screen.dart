import 'dart:async';
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
         Duration(seconds: 2), () {
      stg.read(OpenCardWizard) == null ?Get.offAllNamed( RoutingApp.cardWizardOverlapScreenRoute)  : stg.read(OpenScreenMember) == null ? Get.offAllNamed(
        RoutingApp.member_screen,) : stg.read(OpenScreenlogen) == null ?
      Get.offAllNamed(RoutingApp.login_route,) : Get.offAllNamed(RoutingApp.dashboardRoute);
    });
    print("on start app from timer");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            width: double.infinity,
            height: 1.0.sh,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Container(
                  width: 0.80.sw,
                  height: 0.79.sh,
                  decoration: BoxDecoration(
                    // color: kColorsPrimarySalseBlack,
                      image:DecorationImage(image:
                      AssetImage('assets/LogoColor.png'),fit: BoxFit.scaleDown,)
                  ),
                ),
                SizedBox( height:0.07.sh,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:0.0.r),
                  child:  Container(
                    width: double.infinity,
                    child: Stack(
                      children: [

                        Container(
                          width: double.infinity,
                          height:0.11.sh,
                          decoration: ShapeDecoration(
                            color: Color(0xFF9BB7DA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),),),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  15.r),
                          child: Container(
                            width: double.infinity,
                            height:0.11.sh,
                            decoration: ShapeDecoration(
                              color: Color(0xFF3570B7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),
                              ),
                            ),
                            child: Padding(
                              padding:
                              EdgeInsets.only(right:      15.0.r,bottom:  10.0.r,top:  25.0.r,left:  15.0.r),
                              child:  SvgPicture.asset(
                                "assets/Icons/loading.svg",
                                width: 43,
                                height: 40.r,
                                color: kColorsWhite,
                              ),
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

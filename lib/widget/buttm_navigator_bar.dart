

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Screen/dashboard/dashboard_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    Key ?key,
    // this.IsHome,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;
  // final bool? IsHome;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return  Container(

      width:double.infinity,
      height: 0.12.sh,
      decoration: BoxDecoration(
          border: Border.all(width:0.5,color:kColorsLightBlack ),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 0.10.sh,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    child: SizedBox(
                      height: 0.10.sh,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/Icons/home-2.svg",
                            width: 24.r,
                            height: 24.r,
                            color: MenuState.home == widget.selectedMenu
                                ? kColorsPrimary :kColorsLightBlack,
                          ),
                          Text("Home".tr,style: MenuState.home == widget.selectedMenu?TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: kColorsPrimary):TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: kColorsLightBlack),)
                        ],
                      ),
                    ),
                    onPressed: () {
                      Get.offAll(DashboardScreen(pageIndex: 0),   transition: Transition.noTransition,);
                    }
                ),
                TextButton(
                  child:SizedBox(
                    height: 0.10.sh,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/Icons/notification.svg",
                          width: 24.r,
                          height: 24.r,
                          color: MenuState.Notifications == widget.selectedMenu
                              ? kColorsPrimary :kColorsLightBlack,
                        ),
                        Text( 'Notifications'.tr,style: MenuState.Notifications == widget.selectedMenu?TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: kColorsPrimary):TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: kColorsLightBlack),),

                      ],
                    ),
                  ),
                  onPressed: () {
                    Get.offAll(DashboardScreen(pageIndex: 1),transition: Transition.noTransition,);
                  },
                ),

                TextButton(
                  child:SizedBox(
                    height: 0.10.sh,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          "assets/Icons/direct.svg",
                          width: 24.r,
                          height: 24.r,
                          color: MenuState.profile == widget.selectedMenu
                              ? kColorsPrimary :kColorsLightBlack,
                        ),
                        Text(  'Profile personly'.tr,style: MenuState.profile == widget.selectedMenu?TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: kColorsPrimary):TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: kColorsLightBlack),)
                      ],
                    ),
                  ),
                  onPressed: () {

                    Get.offAll(DashboardScreen(pageIndex: 3),transition: Transition.noTransition,);

                  },
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
            ),
            width: 0.45.sw,
            height: 0.006.sh,

          ),
        ],
      ),
    );
  }
}

enum MenuState {
  home,
  Notifications,
  profile,
}
class NoCustomBottomNavBar extends StatefulWidget {
  const NoCustomBottomNavBar({
    Key ?key,
  }) : super(key: key);



  @override
  State<NoCustomBottomNavBar> createState() => _NoustomBottomNavBarState();
}

class _NoustomBottomNavBarState extends State<NoCustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 0.00.sh,
    );
  }
}

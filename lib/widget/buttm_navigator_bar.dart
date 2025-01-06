

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Core/Utils/assets.dart';
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
      height: 0.10.sh,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(20.r),
            topRight: Radius.circular(20.r),
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 0.10.sh,

            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    child: SizedBox(
                      height: 0.10.sh,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            AssestData.my_project,
                            width: 24.r,
                            height: 24.r,
                            color: MenuState.home == widget.selectedMenu
                                ? kColorsPrimaryFont :kColorsLightBlack,
                          ),
                          Text("مشاريعي".tr,style: MenuState.home == widget.selectedMenu?const TextStyle(   fontFamily: 'GraphikArabic',fontSize: 14,color: kColorsPrimaryFont):const TextStyle(   fontFamily: 'GraphikArabic',fontSize: 12,fontWeight: FontWeight.w600,color: kColorsLightBlack),)
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
                          AssestData.my_service,
                          width: 24.r,
                          height: 24.r,
                          color: MenuState.ElectronicServices == widget.selectedMenu
                              ? kColorsPrimaryFont :kColorsLightBlack,
                        ),
                        Text( 'الخدمات الإلكترونيه'.tr,style: MenuState.ElectronicServices == widget.selectedMenu?const TextStyle(   fontFamily: 'GraphikArabic',fontSize: 12,fontWeight: FontWeight.w600,color: kColorsPrimaryFont):const TextStyle(   fontFamily: 'GraphikArabic',fontSize: 14,color: kColorsLightBlack),),

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
                          AssestData.my_bookmark,
                          width: 24.r,
                          height: 24.r,
                          color: MenuState.KeeperCovenant == widget.selectedMenu
                              ? kColorsPrimaryFont :kColorsLightBlack,
                        ),
                        Text( ' حافظة العهده'.tr,style: MenuState.KeeperCovenant == widget.selectedMenu?const TextStyle(   fontFamily: 'GraphikArabic',fontSize: 14,color: kColorsPrimaryFont):const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: kColorsLightBlack),),
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
                          AssestData.my_chart,
                          width: 24.r,
                          height: 24.r,
                          color: MenuState.Reports == widget.selectedMenu
                              ? kColorsPrimaryFont :kColorsLightBlack,
                        ),
                        Text(  'التقارير'.tr,style: MenuState.Reports == widget.selectedMenu?const TextStyle(fontSize: 14,color: kColorsPrimaryFont):const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: kColorsLightBlack),)
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
        ],
      ),
    );
  }
}

enum MenuState {
  home,
  ElectronicServices,
  KeeperCovenant,
  Reports
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

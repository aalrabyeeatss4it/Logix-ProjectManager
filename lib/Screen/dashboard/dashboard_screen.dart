import 'dart:async';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Core/Utils/assets.dart';
import 'package:projectmanagers/Screen/ElectronicServices/electronic_services_screen.dart';
import 'package:projectmanagers/Screen/KeeperCovenant/keeper_covenant_screen.dart';
import 'package:projectmanagers/Screen/MenuDrawer/profile/prpfile_screen.dart';
import 'package:projectmanagers/Screen/Notifcation/notifcation_screen.dart';
import 'package:projectmanagers/Screen/Reports/reports_screen.dart';
import 'package:projectmanagers/Screen/dashboard/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/binding/binding.dart';


class DashboardScreen extends StatefulWidget {
  final int pageIndex;
  const DashboardScreen({Key? key, required this.pageIndex}) : super(key: key);

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  PageController? _pageController;
  int _pageIndex = 0;
  late List<Widget> _screens;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
  bool _canExit = GetPlatform.isWeb ? true : false;
  late int currentIndex;

  @override
  void initState() {
    super.initState();

    currentIndex = 0;
    _pageIndex = widget.pageIndex;
    _pageController = PageController(initialPage: widget.pageIndex);
    _screens = [
      HomeScreen(),
      ElectronicServicesScreen(show_tabBar: false,IsHome: true),
      KeeperCovenantScreen(show_tabBar: false,IsHome: true),
      ReportsScreen(show_tabBar: false,IsHome: true),
    ];

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });

    /*if(GetPlatform.isMobile) {
      NetworkInfo.checkConnectivity(_scaffoldKey.currentContext);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
        onWillPop: () async {
          if (_pageIndex != 0) {
            _setPage(0);
            return false;
          } else {
            if(_canExit) {
              return true;
            }else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Click again to exit'.tr, style: const   TextStyle(fontFamily: 'GraphikArabic',color: Colors.white)),
                behavior: SnackBarBehavior.floating,
                backgroundColor: kColorsRed,
                duration: const Duration(seconds: 2),
                margin:  EdgeInsets.all(8),
              ));
              _canExit = true;
              Timer(const Duration(seconds: 2), () {
                _canExit = false;
              });
              return false;
            }
          }
        },
        child: Scaffold(

          key: _scaffoldKey,
          bottomNavigationBar: Container(

            width: double.infinity,
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
                                SvgPicture.asset( AssestData.my_project, width: 24, height: 24, color:_pageIndex==0?kColorsPrimaryFont :kColorsLightBlack,),
                                SizedBox(
                                  height: 0.01.sh,
                                ),
                                Text("مشاريعي".tr,style:  _pageIndex==0?const TextStyle( color: Color(0xFF242424),
              fontSize: 14,
              fontFamily: 'GraphikArabic',
              fontWeight: FontWeight.w400,):const TextStyle(fontFamily: 'GraphikArabic',fontSize: 12,fontWeight: FontWeight.w600,color: kColorsLightBlack),),
                                SizedBox(
                                  height: 0.010.sh,
                                ),
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
                                width: 24,
                                height: 24,
                                color: _pageIndex==1?kColorsPrimaryFont :kColorsLightBlack,
                              ),

                              SizedBox(
                                height: 0.01.sh,
                              ),
                              Text( 'الخدمات الإلكترونيه'.tr,style: _pageIndex==1?const TextStyle( color: kColorsPrimaryFont,
              fontSize: 14,
              fontFamily: 'GraphikArabic',
              fontWeight: FontWeight.w400,):const TextStyle(fontFamily: 'GraphikArabic',fontSize: 12,fontWeight: FontWeight.w600,color: kColorsLightBlack),),
                              SizedBox(
                                height: 0.010.sh,
                              ),
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
                                width: 24,
                                height: 24,
                                color: _pageIndex==2?kColorsPrimaryFont :kColorsLightBlack,
                              ),
                              SizedBox(
                                height: 0.01.sh,
                              ),
                              Text( ' حافظة العهده'.tr,style: _pageIndex==2?const TextStyle( color: kColorsPrimaryFont,
              fontSize: 14,
              fontFamily: 'GraphikArabic',
              fontWeight: FontWeight.w400,):const TextStyle(fontFamily: 'GraphikArabic',fontSize: 12,fontWeight: FontWeight.w600,color: kColorsLightBlack),),
                              SizedBox(
                                height: 0.010.sh,
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Get.offAll(DashboardScreen(pageIndex: 2),transition: Transition.noTransition,);
                        },
                      ),
                      TextButton(
                        child:SizedBox(
                          height: 0.10.sh,
                          child: Column(
                            children: [
                              SvgPicture.asset(
                             AssestData.my_chart,
                                width: 24,
                                height: 24,
                                color:_pageIndex==3?kColorsPrimaryFont:kColorsLightBlack,
                              ),
                              SizedBox(
                                height: 0.01.sh,
                              ),
                              Text(  'التقارير'.tr,style:_pageIndex==3?const TextStyle( color:kColorsPrimaryFont,
              fontSize: 14,
              fontFamily: 'GraphikArabic',
              fontWeight: FontWeight.w400,):const TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: kColorsLightBlack),),
                              SizedBox(
                                height: 0.010.sh,
                              ),
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
          )
          ,
          body:  PageView.builder(
            controller: _pageController,
            itemCount: _screens.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {return _screens[index];
            },
          ),
        ),
      );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController!.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}


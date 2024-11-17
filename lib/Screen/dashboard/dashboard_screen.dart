import 'dart:async';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Screen/dashboard/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


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
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),

      // ProfileScreen(show_tabBar: true,),
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
                content: Text('Click again to exit'.tr, style: const TextStyle(fontFamily: 'Cairo',color: Colors.white)),
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
                                  color:_pageIndex==0?kColorsPrimary :kColorsLightBlack,
                                ),
                                Text("Home".tr,style:  _pageIndex==0?TextStyle(fontFamily: 'Cairo',fontSize: 12,fontWeight: FontWeight.w600,color: kColorsPrimary):TextStyle(fontFamily: 'Cairo',fontSize: 12,fontWeight: FontWeight.w600,color: kColorsLightBlack),)
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
                                color: _pageIndex==1?kColorsPrimary :kColorsLightBlack,
                              ),
                              Text( 'Notifications'.tr,style: _pageIndex==1?TextStyle(fontFamily: 'Cairo',fontSize: 12,fontWeight: FontWeight.w600,color: kColorsPrimary):TextStyle(fontFamily: 'Cairo',fontSize: 12,fontWeight: FontWeight.w600,color: kColorsLightBlack),),

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
                                "assets/Icons/document-text.svg",
                                width: 24.r,
                                height: 24.r,
                                color: _pageIndex==2?kColorsPrimary :kColorsLightBlack,
                              ),
                              Text( 'Follow-ups'.tr,style:_pageIndex==2?TextStyle(fontFamily: 'Cairo',fontSize: 12,fontWeight: FontWeight.w600,color: kColorsPrimary):TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: kColorsLightBlack),),

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
                                "assets/Icons/direct.svg",
                                width: 24.r,
                                height: 24.r,
                                color:_pageIndex==3?kColorsPrimary:kColorsLightBlack,
                              ),
                              Text( 'Messages'.tr,style:_pageIndex==3?TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: kColorsPrimary):TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: kColorsLightBlack),)
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
          )
          // Container(
          //   decoration: BoxDecoration(
          //       border: Border.all(width: 0.11,color:kColorsLightBlack ),
          //       color: Colors.white),
          //   width: double.infinity,
          //   height: 0.10.sh,
          //
          //   child: Column(
          //     children: [
          //       BottomNavigationBar(
          //           backgroundColor: kColorsWhite,
          //           type: BottomNavigationBarType.fixed,
          //           iconSize: 24.r,
          //           selectedItemColor:kColorsPrimary ,
          //           selectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: kColorsPrimary),
          //           unselectedLabelStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: kColorsLightBlack),
          //           unselectedItemColor:Colors.black54,
          //           currentIndex: currentIndex,
          //           onTap: (index){
          //             setState(() {
          //               _setPage(index);
          //               currentIndex=index;
          //             });
          //           },
          //           items: <BottomNavigationBarItem>[
          //             BottomNavigationBarItem(
          //               icon: SvgPicture.asset(
          //                 "assets/Icons/home-2.svg",
          //                 width: 24.r,
          //                 height: 24.r,
          //                 color:_pageIndex==0?kColorsPrimary :kColorsLightBlack,
          //               ),
          //               label: "Home".tr,
          //             ),
          //             BottomNavigationBarItem(
          //               icon: SvgPicture.asset(
          //                 "assets/Icons/notification.svg",
          //                 width: 24.r,
          //                 height: 24.r,
          //                 color:_pageIndex==1?kColorsPrimary :kColorsLightBlack,
          //               ),
          //               label: 'Notifications'.tr,
          //             ),
          //             BottomNavigationBarItem(
          //               icon: SvgPicture.asset(
          //                 "assets/Icons/document-text.svg",
          //                 width: 24.r,
          //                 height: 24.r,
          //                 color:_pageIndex==2?kColorsPrimary :kColorsLightBlack,
          //               ),
          //               label: 'Follow-ups'.tr,
          //             ),
          //             BottomNavigationBarItem(
          //               icon: SvgPicture.asset(
          //                 "assets/Icons/document-text.svg",
          //                 width: 24.r,
          //                 height: 24.r,
          //                 color:_pageIndex==3?kColorsPrimary :kColorsLightBlack,
          //               ),
          //               label: 'Messages'.tr,
          //             ),
          //           ]),
          //       Container(
          //         width: 0.45.sw,
          //         height: 0.01.sh,
          //         color: Colors.black,
          //       ),
          //     ],
          //   ),
          // )
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


import 'package:projectmanagers/Constants/kaye.dart';
import 'package:projectmanagers/Screen/dashboard/home/home_controller.dart';
import 'package:projectmanagers/Screen/dashboard/home/itemhome.dart';
import 'package:projectmanagers/widget/custom_continer_with_tow_icon.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/router/route_constants.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final zoomDrawerController = ZoomDrawerController();
   final controller = Get.put(HomeController());
  late bool show_tabB=true;
  @override
  initState() {
    if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
      print("Connection".tr);
      controller.Revrech();
    }
    else {
      print("No Connection".tr);
      //Get.toNamed(RoutingApp.cheack_intrinet_screen);
    }
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return Scaffold(
      backgroundColor: kColorsWhite,
      body:  SafeArea(
        child: ZoomDrawer(
          isRtl: isRtl ? true : false,
          controller: zoomDrawerController,
          style: DrawerStyle.style1,
          menuScreen: MenuWidgetDachbord(zoomDrawerController: zoomDrawerController,),
          mainScreen: Scaffold(
            appBar:  MyAppBar(title:'Home'.tr,zoomDrawerController: zoomDrawerController,IsHome: true,),
            backgroundColor: kColorsWhite,
            body:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 0.02.sw),
                    Container(
                        padding: EdgeInsets.only(right:isRtl==true? 6.r:0),
                        child: Text(
                          'Welcome to'.tr,
                          style:  TextStyle(fontFamily: 'Cairo',color: kColorsBlack,fontSize: 16,fontWeight: FontWeight.w500),)
                    ),
                    Container(
                        padding: EdgeInsets.only(left:2.r, right:4.r),
                        child: Text(
                          'Easy Docs app!'.tr,
                          style:  TextStyle(fontFamily: 'Cairo',color: kColorsPrimary,fontSize: 16,fontWeight: FontWeight.w500),)
                    ),
                  ],
                ),
                SizedBox(height: 0.03.sh),
                controller.obx(
                      (tranction) =>Column(
                        children: [
                  ],
                ),
                onLoading: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GrideRow(isRtl: isRtl,text: "".tr,Icone: "assets/Icons/chat_paste_go.svg",onpress:(){
                        }),
                        GrideRow(isRtl: isRtl,text: " ".tr,Icone: "assets/Icons/move_to_inbox.svg",onpress:(){  }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GrideRow(isRtl: isRtl,text: "".tr,Icone: "assets/Icons/outbox.svg",onpress:(){ }),
                        GrideRow(isRtl: isRtl,text: "".tr,Icone: "assets/Icons/NotificationBox.svg",onpress:(){  }),

                      ],
                    ),
                  ],
                ),
                onEmpty: Column(
                    children: [

                    ],
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     GrideRow(isRtl: isRtl,text: "شاشة للتجربه ".tr,Icone: "assets/Icons/outbox.svg",onpress:(){  Get.toNamed(RoutingApp.Exampole);}),
                //     GrideRow(isRtl: isRtl,text: "شاشة للتجربه ".tr,Icone: "assets/Icons/NotificationBox.svg",onpress:(){  Get.toNamed(RoutingApp.Exampole);}),
                //
                //   ],
                // ),




                SizedBox(height: 0.03.sh),

              ],
            ),
          ),
          clipMainScreen: true,
          // slideWidth: MediaQuery.of(context).size.width * (isRtl == true ? .45 : 0.65),
          openCurve: Curves.slowMiddle,
          closeCurve: Curves.slowMiddle,
          borderRadius: 24.0,
          showShadow: true,
          angle: 0.0, slideWidth: MediaQuery.of(context).size.width * 0.65.w,
          shadowLayer1Color: kColorScafoold,
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home,),
    );



  }

}

enum ChangeColor {
  ticket,
  propertyManagement,
  maintenance,
}
class GrideRow extends StatelessWidget {
  const GrideRow({

    super.key,
    required this.isRtl,
    required this.text,
    required this.Icone,
    required this.onpress,
     this.Count,


  });

  final bool isRtl;
  final String text;
  final String Icone;
  final int? Count;

  final Function() onpress;

  @override
  Widget build(BuildContext context) {
    print("Count="+Count.toString());
    return InkWell(
      onTap: () {
        onpress();
      },
      child: Padding(
        padding: EdgeInsets.only(
          top: 10.r,
          right: isRtl == true ? 8.0.r : 8.0.r,
          left: isRtl != true ? 8.0.r : 8.0.r,
        ),
        child: Stack(
          children: [
            Container(
              height: 0.16.sh,
              width: 0.45.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: kColorsPrimary.withOpacity(0.3),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 0.07.sh,
                      width: 0.14.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.r),
                        color: kColorsPrimary,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14.0.r),
                        child: SvgPicture.asset(
                          Icone.toString(),
                          width: 30.r,
                          height: 30.r,
                          color: kColorsWhite,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 7.0.r, right: 7.0.r, top: 7.0.r),
                      child: Text(
                        text.toString(),
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 14,
                          color: Color(0xff242424),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 5.r, // المسافة من الجهة اليسرى
              top: 5.r,  // المسافة من الأعلى
              child: Container(
                padding: EdgeInsets.all(4.r), // padding حول الرقم
                decoration: BoxDecoration(
                  color:  Count==null? kColorsPrimary.withOpacity(0.0):Colors.red, // لون الخلفية
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  Count==null?"":Count.toString(),
                  style: TextStyle(
                    color: Colors.white, // لون الرقم
                    fontSize: 16.sp, // حجم الخط
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
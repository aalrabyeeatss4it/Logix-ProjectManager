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
            body:Padding(
              padding:  EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 0.03.sh),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              left:2.r, right:10.r,
                              bottom:1.r),
                          child: Text(
                            "ملخص المشاريع".tr,
                            style: TextStyle(color:kColorsBlack,fontSize: 20,fontWeight: FontWeight.w600),)
                      ),
                    ],
                  ),
                  SizedBox(height: .02.sh),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: .15.sh,
                        color: kColorsLightBlackLow,

                        child: Column(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(right:isRtl==true? 8.0.r:0.0.r,left: isRtl!=true? 8.0.r:0.0.r),
                                child: Text(
                                  "84",
                                  style: TextStyle(
                                    color:kColorsBlack ,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                "عدد المشاريع الإجمالي",
                                style: TextStyle(
                                  color:kColorsBlack ,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                      ),
                    ),
                      SizedBox(width: 5.0),
                      Expanded(
                        flex: 6,
                      child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 5.0),
                                Container(
                                  color: kColorsLightBlackLow,
                                  padding: EdgeInsets.symmetric(horizontal:  2,vertical: 2,),
                                  child: Text(
                                    " عدد المشاريع"+"    84",
                                    style: TextStyle(
                                      color:kColorsBlack ,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),


                                SizedBox(width: 20.0),
                                Container(
                                  color: kColorsLightBlackLow,
                                  padding: EdgeInsets.symmetric(horizontal:  2,vertical: 2,),
                                  child: Text(
                                    " عدد المشاريع"+"    84",
                                    style: TextStyle(
                                      color:kColorsBlack ,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              children: [
                                SizedBox(width: 5.0),
                                Container(
                                  color: kColorsLightBlackLow,
                                  padding: EdgeInsets.symmetric(horizontal:  2,vertical: 2,),
                                  child: Text(
                                    " عدد المشاريع"+"    84",
                                    style: TextStyle(
                                      color:kColorsBlack ,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),


                                SizedBox(width: 20.0),
                                Container(
                                  color: kColorsLightBlackLow,
                                  padding: EdgeInsets.symmetric(horizontal:  2,vertical: 2,),
                                  child: Text(
                                    " عدد المشاريع"+"    84",
                                    style: TextStyle(
                                      color:kColorsBlack ,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              color: kColorsLightBlackLow,
                              padding: EdgeInsets.symmetric(horizontal:  2,vertical: 2,),
                              child: Row(
                                children: [
                                  Text(
                                    "عدد المشاريع",
                                    style: TextStyle(
                                      color:kColorsBlack ,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "84",
                                    style: TextStyle(
                                      color:kColorsBlack ,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                    ),
                    ],
                  ),
                  SizedBox(height: .02.sh),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(
                              left:2.r, right:10.r,
                              bottom:1.r),
                          child: Text(
                            "مشاريعي".tr,
                            style: TextStyle(color:kColorsBlack,fontSize: 20,fontWeight: FontWeight.w600),)
                      ),
                    ],
                  ),

                ],
              ),
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
  Widget _buildInfoCard(String title, String value) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressSection(String title, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        LinearProgressIndicator(
          value:value/ 100,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      ],
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
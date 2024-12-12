import 'package:flutter/services.dart';
import 'package:projectmanagers/Constants/kaye.dart';
import 'package:projectmanagers/Constants/my_text.dart';
import 'package:projectmanagers/Screen/dashboard/home/categoriesScreen.dart';
import 'package:projectmanagers/Screen/dashboard/home/home_controller.dart';
import 'package:projectmanagers/Screen/dashboard/home/item_task_new.dart';
import 'package:projectmanagers/Screen/dashboard/home/item_task_old.dart';
import 'package:projectmanagers/Screen/dashboard/home/itemhome.dart';
import 'package:projectmanagers/Screen/dashboard/home/tabBar_controller.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';


class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final zoomDrawerController = ZoomDrawerController();
   final controller = Get.put(HomeController());
  final controllerTabBarController = Get.put(TabBarController());
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
            appBar:  MyAppBar(title:'مشاريعي'.tr,zoomDrawerController: zoomDrawerController,IsHome: true,),
            backgroundColor: kColorsWhite,
            body:Padding(
              padding:  EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(height: 0.03.sh),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(
                                left:2.r, right:10.r,
                                bottom:1.r),
                            child: Text(
                              "ملخص المشاريع".tr,
                              style: TextStyle(   fontFamily: 'Regular',color:kColorsBlack,fontSize: 12,fontWeight: FontWeight.w500),)
                        ),
                      ],
                    ),
                    SizedBox(height: .02.sh),
                    Container(
                      decoration: BoxDecoration(
                          color: kColorsPrimaryFont,
                          borderRadius: BorderRadius.circular(5.r)),
                      height: .05.sh,
                      width: double.infinity,
                
                
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:  8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                
                            Text(
                              "عدد المشاريع الإجمالي",
                              style: TextStyle(
                                fontFamily: 'Regular', color:kColorsWhite ,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                          "84"+   "  ",
                              style: TextStyle(
                                fontFamily: 'Regular',
                                color:kColorsWhite ,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: .005.sh),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildContainer("لم يبدأ التنفيذ","17",kColorsPrimaryFont,kColorsPrimaryFont),
                            buildContainer("وفق الخطه","2",Color(0xff28A745),Color(0xff28A745)),
                            buildContainer("مكتمل","12",Color(0xffF4A261),Color(0xffF4A261)),
                          ],
                        ),
                
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            buildContainer("متعثر","11",Color(0xffEA6652),Color(0xffEA6652)),
                            SizedBox(width: 8.0),
                            buildContainer("متأخر بشكل بسيط","16",Color(0xffF0CA00),Color(0xffF0CA00)),
                          ],
                        ),
                        SizedBox(height: 8.0),
                      ],
                    ),
                     // GetBuilder<HomeController>(
                     //    init: HomeController(),
                     //    builder: (fileController) =>Categories()),
                    Container(
                      height: 0.25.sh,
                      color: kColorsWhiteTow,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.0),
                              child: Container(
                                padding: EdgeInsets.all(4),
                                width: 0.91.sw,
                                decoration: BoxDecoration(
                                  color: Color(0xffEBEBEB),
                                  borderRadius: BorderRadius.circular(7.r),
                                ),
                                child: DefaultTabController(
                                  initialIndex: controllerTabBarController.selectedIndexReferral,
                                  length: 2,
                                  child: Column(
                                    children: <Widget>[
                                      // The AppBar with TabBar at the top
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                                        ),
                                        height: 0.045.sh,
                                        width: 0.90.sw,
                                        child: AppBar(
                                          backgroundColor: kColorBone,
                                          bottom: TabBar(
                                            onTap: (index) {
                                              controllerTabBarController.selectedIndexReferral = index;
                                            },
                                            isScrollable: true,
                                            labelColor: kColorsWhite,
                                            labelStyle: MyText.TitleTabBarWhiteselected(context),
                                            unselectedLabelColor: Color(0xff6F6F6F),
                                            unselectedLabelStyle: MyText.TitleTabBarWhiteunselected(context),
                                            indicatorSize: TabBarIndicatorSize.label,
                                            dividerColor: kColorBone,
                                            indicator: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.r),
                                              color: Color(0xff0692AC),
                                            ),
                                            tabs: [
                                              Container(
                                                width: 0.22.sw,
                                                height: 0.04.sh,
                                                child: Tab(text: 'مهام الشهر الحالي'.tr),
                                              ),
                                              Container(
                                                width: 0.22.sw,
                                                height: 0.04.sh,
                                                child: Tab(text: 'المهام المستقبليه'.tr),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      // TabBarView for the tabs
                                      Expanded(
                                        child: TabBarView(
                                          children: [
                                            ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              padding: EdgeInsets.symmetric(vertical: 10.r),
                                              itemCount: 3,
                                              itemBuilder: (context, index) => ItemTaskOld(),
                                            ),
                                            ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              padding: EdgeInsets.symmetric(vertical: 10.r),
                                              itemCount: 3,
                                              itemBuilder: (context, index) => ItemTaskNew(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: .01.sh),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(
                                left:2.r, right:10.r,
                                bottom:1.r),
                            child: Text(
                              "مشاريعي".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontFamily: 'Regular',color:kColorsBlack,fontSize: 14,fontWeight: FontWeight.w500),)
                        ),

                      ],
                    ),
                    SizedBox(height: .01.sh),
                    Container(
                      color: kColorsWhiteTow,
                      width: double.infinity,
                      height: 0.48.sh,
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 4),
                                shrinkWrap: true,
                                itemCount: 3,
                                itemBuilder: (context, index) =>
                                    ItemHome()),
                          ),
                        ],
                      ),
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
          angle: 0.0, slideWidth: MediaQuery.of(context).size.width * 0.65.w,
          shadowLayer1Color: kColorScafoold,
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home,),
    );



  }
  Widget buildContainer(String text, String value,Color colorvalue,Color colorborder) {
    return  Container(
      width: .30.sw,
      decoration: BoxDecoration(
          color: kColorsWhiteTow,
          border: Border.all(color: colorborder),
          borderRadius: BorderRadius.circular(5.r)),

      child:  Padding(
        padding:  EdgeInsets.only(top: 8,bottom: 8, right: 6.0.r,left: 6.0.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text+" :", style: TextStyle(   fontFamily: 'Regular',color:kColorsBlack,fontSize:10.0, fontWeight: FontWeight.bold,),
            ),
            Text(value, style: TextStyle(   fontFamily: 'Regular',color:colorvalue,fontSize:10.0, fontWeight: FontWeight.bold,),
            ),
          ],
        ),
      ),
    );
  }
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
          right: isRtl == true ? 4.0.r : 4.0.r,
          left: isRtl != true ? 4.0.r : 4.0.r,
        ),
        child: Stack(
          children: [
            Container(
             height: 0.05.sh,
              // width: 0.45.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: kColorsPrimary.withOpacity(0.3),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 7.0.r, right: 7.0.r, top: 7.0.r),
                      child: Text(
                        text.toString(),
                        style: TextStyle(
                          fontFamily: 'Regular',
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
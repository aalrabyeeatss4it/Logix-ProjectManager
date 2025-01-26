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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kColorsWhite, // اللون الخلفي لشريط الحالة
      statusBarIconBrightness: Brightness.dark, // لون الأيقونات (فاتح أو داكن)
    ));
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return
      Scaffold(
        appBar:   MyAppBar(title:'مشاريعي'.tr, IsHome: true,IconeEnd: false),
        drawer: Drawer(
          child: MenuWidgetDashboard(), // استخدام قائمة الـ Drawer المخصصة
        ),

        body: SafeArea(
          child: Container(
            color: kColorsWhite.withOpacity(0.1),
            child: Padding(
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
                              style: const TextStyle(
                                color: Color(0xFF242424),
                                fontSize: 12,
                                fontFamily: 'GraphikArabic',
                                fontWeight: FontWeight.w500,
                                height: 1.37,
                              ),)
                        ),
                      ],
                    ),
                    SizedBox(height: .01.sh),
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
                              style: const TextStyle(
                                fontFamily: 'GraphikArabic', color:kColorsWhite ,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text("84"+   "  ", style: const TextStyle(
                              fontFamily: 'GraphikArabic',
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
                            buildContainer("لم يبدأ التنفيذ","84",kColorsPrimaryFont,kColorsPrimaryFont),
                            buildContainer("وفق الخطه","84",Color(0xff28A745),Color(0xff28A745)),
                            buildContainer("مكتمل","84",Color(0xffF4A261),Color(0xffF4A261)),
                          ],
                        ),

                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            buildContainer("متعثر","84",Color(0xffEA6652),Color(0xffEA6652)),
                            SizedBox(width: 8.0),
                            buildContainer("متأخر بشكل بسيط","84",Color(0xffF0CA00),Color(0xffF0CA00)),
                          ],
                        ),
                        SizedBox(height: 8.0),
                      ],
                    ),
                    SizedBox(height: 0.01.sh),
                    Container(
                      height: 0.19.sh,
                      color: kColorsWhiteTow,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(top: 2, bottom: 2),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 4,vertical: 2),
                                width: 0.91.sw,
                                decoration: BoxDecoration(
                                  color: kColorsWhiteTow,
                                  borderRadius: BorderRadius.circular(7.r),
                                ),
                                child: DefaultTabController(
                                  initialIndex: controllerTabBarController.selectedIndexReferral,
                                  length: 2,
                                  child: Column(
                                    children: <Widget>[
                                      // TabBar aligned to the right
                                      Align(
                                        alignment: Alignment(2, 2),
                                        child: Container(
                                          color: kColorBone,
                                          height: 0.051.sh,
                                          width: 0.72.sw, // أو يمكن ضبط عرض مخصص
                                          child: TabBar(
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
                                                width: 0.24.sw,
                                                height: 0.04.sh,
                                                child: Tab(text: 'مهام الشهر الحالي'.tr),
                                              ),
                                              Container(
                                                width: 0.24.sw,
                                                height: 0.04.sh,
                                                child: Tab(text: 'المهام المستقبليه'.tr),
                                              ),
                                            ],
                                          ),
                                        ),),

                                      // TabBarView for the tabs
                                      Expanded(
                                        child: TabBarView(
                                          children: [
                                            ListView.builder(

                                              scrollDirection: Axis.horizontal,
                                              padding: EdgeInsets.symmetric(vertical: 4),
                                              itemCount: 3,
                                              itemBuilder: (context, index) => ItemTaskOld(),
                                            ),
                                            ListView.builder(

                                              scrollDirection: Axis.horizontal,
                                              padding: EdgeInsets.symmetric(vertical: 4),
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
                                style: const TextStyle(
                                  color: Color(0xFF242424),
                                  fontSize: 14,
                                  fontFamily: 'GraphikArabic',
                                  fontWeight: FontWeight.w500,
                                  height: 1.17,
                                ),)
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
                                shrinkWrap: true,
                                itemCount: 3,
                                itemBuilder: (context, index) =>
                                    ItemHome()),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0.30.sh),
                  ],
                ),
              ),
            ),
          ),
        ),

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
            Text(text+" :", style: const TextStyle(   fontFamily: 'GraphikArabic',color:kColorsBlack,fontSize:10.0, fontWeight: FontWeight.bold, height: 1.37,),
            ),
            Text(value, style:   TextStyle(   fontFamily: 'GraphikArabic',color:colorvalue,fontSize:12.0, fontWeight: FontWeight.w600, height: 1.37,),
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
                color: kColorsPrimaryFont.withOpacity(0.3),
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
                        style: const TextStyle(
                          fontFamily: 'GraphikArabic',
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
                  color:  Count==null? kColorsPrimaryFont.withOpacity(0.0):Colors.red, // لون الخلفية
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  Count==null?"":Count.toString(),
                  style: const TextStyle(
                    color: Colors.white, // لون الرقم
                    fontSize: 16, // حجم الخط
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
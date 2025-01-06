import 'dart:convert';
 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:intl/intl.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Constants/my_text.dart';
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/DocumentLibrary/document_library_controller.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/DocumentLibrary/item_document_library.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/DocumentLibrary/tabBar_document_library_controller.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'package:projectmanagers/widget/buttm_navigator_bar.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';

class DocumentLibraryScreen extends StatefulWidget {
  @override
  State<DocumentLibraryScreen> createState() => _DocumentLibraryScreenState();
}

class _DocumentLibraryScreenState extends State<DocumentLibraryScreen> {
  final controller = Get.put(DocumentLibraryController());
  final controllerTabBarDocumentLibrary = Get.put(TabBarDocumentLibraryController());
  bool? selectedValue=false;
  bool value1 = true; // القيمة الأولى
  bool value2 = false; // القيمة الثانية


  @override
  initState() {
    super.initState();
    if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
    } else {
      GetSnackMsg(msg: 'No internet connection '.tr, bgClr: kColorsRed, txClr: kColorsWhite).showTxt();
    }
    print("initState Called");
  }

  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages=true;

    final isRtl = Localizations
        .localeOf(context)
        .languageCode == 'ar';
    return DefaultTabController(
      initialIndex: controllerTabBarDocumentLibrary.selectedIndex,
      length: 3,
      child:  Scaffold(
          appBar: MyAppBar(
        title: 'مكتبة المستندات'.tr,

      ),

        body: SafeArea(
          child: Container(
            color:kColorsWhite.withOpacity(0.1),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 0.02.sh,
                ),
                Container(
                  height: 0.06.sh,
                  width: 0.94.sw,

                  child:Align(
                    alignment: Alignment(1,1),
                    child: Container(
                      decoration: BoxDecoration(
                          color: kColorBone,
                          borderRadius: BorderRadius.circular(10.r)),

                      height: 0.061.sh,
                      width: 0.94.sw, // أو يمكن ضبط عرض مخصص
                      child: TabBar(
                        onTap: (index) {controllerTabBarDocumentLibrary.selectedIndex = index;},
                        controller: controllerTabBarDocumentLibrary.controllerTabBar,
                        isScrollable: true,
                        labelColor: kColorsWhite,
                        labelStyle: MyText.TitleTabBarWhiteselected(context),
                        unselectedLabelColor:kColorsBlackTow,
                        unselectedLabelStyle: MyText.TitleTabBarWhiteunselected(context),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: kColorsPrimaryFont,
                        ),
                        padding: EdgeInsets.only(bottom:3.0.r),
                        dividerColor:Color(0xffF2F2F2) ,
                        tabs: [
                          Container(
                            width: 0.25.sw,
                            height: 0.04.sh,
                            child: Tab(text:   "فواتير".tr),
                          ),
                          Container(
                              width: 0.28.sw,
                              height: 0.04.sh,
                              child: Tab(text: 'تقارير'.tr)),
                          Container(
                              width: 0.25.sw,
                              height: 0.04.sh,
                              child: Tab(text: 'جميع المستندات'.tr)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: controllerTabBarDocumentLibrary.controllerTabBar,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 0.02.sh,
                          ),
                          Expanded(
                            child:  ListView.builder(
                                shrinkWrap: true,
                                itemCount: 1,
                                itemBuilder: (context, index) =>
                                    ItemDocumentLibrary()),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 0.02.sh,
                          ),
                          Expanded(
                            child:  ListView.builder(
                                shrinkWrap: true,
                                itemCount: 2,
                                itemBuilder: (context, index) =>
                                    ItemDocumentLibrary()),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 0.02.sh,
                          ),
                          Expanded(
                            child:  ListView.builder(
                                shrinkWrap: true,
                                itemCount: 3,
                                itemBuilder: (context, index) =>
                                    ItemDocumentLibrary()),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:   CustomBottomNavBar(selectedMenu: MenuState.home),
      ),
    );
  }

  Widget BuldTabbBar() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.r),
          child: Row(
            children: [
              Container(
                child: Container(
                  width: 0.08.sw,
                  height: 0.05.sh,
                  decoration: ShapeDecoration(
                    color: kColorsPrimaryFont,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF9BB7DA)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "1",
                      style:   const TextStyle(
                          fontSize: 12,
                          color: kColorsWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                width: 0.07.sw,
                height: 0.002.sh,
                color: controller.selectedIndextab1 == 1
                    ? kColorsPrimaryFont
                    : kColorsPrimaryFontLow,
              ),
              Container(
                width: 0.08.sw,
                height: 0.05.sh,
                child: Container(
                  decoration: ShapeDecoration(
                    color: controller.selectedIndextab2 == 1
                        ? kColorsPrimaryFont
                        : kColorsPrimaryFontLow,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF9BB7DA)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "2",
                      style:   const TextStyle(
                          fontSize: 12,
                          color: kColorsWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                width: 0.07.sw,
                height: 0.002.sh,
                color: controller.selectedIndextab2 == 1
                    ? kColorsPrimaryFont
                    : kColorsPrimaryFontLow,
              ),
              Container(
                width: 0.08.sw,
                height: 0.05.sh,
                child: Container(
                  decoration: ShapeDecoration(
                    color: controller.selectedIndextab3 == 1
                        ? kColorsPrimaryFont
                        : kColorsPrimaryFontLow,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF9AB7DB)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "3",
                      style:   const TextStyle(
                          fontSize: 12,
                          color: kColorsWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                width: 0.07.sw,
                height: 0.002.sh,
                color: controller.selectedIndextab3 == 1
                    ? kColorsPrimaryFont
                    : kColorsPrimaryFontLow,
              ),
              Container(
                width: 0.08.sw,
                height: 0.05.sh,
                child: Container(
                  decoration: ShapeDecoration(
                    color: controller.selectedIndextab4 == 1
                        ? kColorsPrimaryFont
                        : kColorsPrimaryFontLow,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF9AB7DB)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "4",
                      style:  const TextStyle(
                          fontSize: 12,
                          color: kColorsWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                width: 0.07.sw,
                height: 0.002.sh,
                color: controller.selectedIndextab4 == 1
                    ? kColorsPrimaryFont
                    : kColorsPrimaryFontLow,
              ),
              Container(
                width: 0.08.sw,
                height: 0.05.sh,
                child: Container(
                  decoration: ShapeDecoration(
                    color: controller.selectedIndextab5 == 1
                        ? kColorsPrimaryFont
                        : kColorsPrimaryFontLow,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF9AB7DB)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "5",
                      style:  const TextStyle(
                          fontSize: 12,
                          color: kColorsWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                width: 0.07.sw,
                height: 0.002.sh,
                color: controller.selectedIndextab5 == 1
                    ? kColorsPrimaryFont
                    : kColorsPrimaryFontLow,
              ),
              Container(
                width: 0.08.sw,
                height: 0.05.sh,
                child: Container(
                  decoration: ShapeDecoration(
                    color: controller.selectedIndextab6 == 1
                        ? kColorsPrimaryFont
                        : kColorsPrimaryFontLow,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF9AB7DB)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "6",
                      style:  const TextStyle(
                          fontSize: 12,
                          color: kColorsWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "بيانات رسالة",
                style:   TextStyle(
                    fontSize: 12,
                    color: controller.selectedIndextab1 == 1
                        ? kColorsPrimaryFont
                        : kColorsPrimaryFontLow,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0.r),
                child: Text(
                  "Options".tr,
                  style:   TextStyle(
                      fontSize: 12,
                      color: controller.selectedIndextab2 == 1
                          ? kColorsPrimaryFont
                          : kColorsPrimaryFontLow,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0.r),
                child: Text(
                  "نسخة إلى",
                  style:    TextStyle(
                      fontSize: 12,
                      color: controller.selectedIndextab3 == 1
                          ? kColorsPrimaryFont
                          : kColorsPrimaryFontLow,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0.r),
                child: Text(
                  "Attachments".tr,
                  style:    TextStyle(
                      fontSize: 12,
                      color: controller.selectedIndextab4 == 1
                          ? kColorsPrimaryFont
                          : kColorsPrimaryFontLow,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0.r),
                child: Text(
                  "Attachments".tr,
                  style:    TextStyle(
                      fontSize: 12,
                      color: controller.selectedIndextab4 == 1
                          ? kColorsPrimaryFont
                          : kColorsPrimaryFontLow,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 2.0.r),
                child: Text(
                  "Attachments".tr,
                  style:    TextStyle(
                      fontSize: 12,
                      color: controller.selectedIndextab4 == 1
                          ? kColorsPrimaryFont
                          : kColorsPrimaryFontLow,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


}
Widget TeaxtLableRow(BuildContext context,  String? text,String? textvalue) {
  final isRtl = Localizations.localeOf(context).languageCode == 'ar';
  return Padding(
    padding:  EdgeInsets.only(bottom:  8.0,top:  8.0,left:isRtl==true?6.0: 15.0,right:isRtl==true?15.0: 6.0),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(text??""+" :",
              style:  const TextStyle(fontSize: 12, color: kColorsBlack, fontWeight: FontWeight.w500,)
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(textvalue??"",
              style:  const TextStyle(fontSize: 11, color:  Color(0xffA4A4A4)),
            overflow: TextOverflow.visible, // تأكد من أن النص يظهر بدون قص
            softWrap: true, // تفعيل التفاف النص
          ),
        ),
      ],
    ),
  );
}


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
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/TasksPerformed/item_tasks_performed.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/TasksPerformed/tasks_performed_controller.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'package:projectmanagers/widget/buttm_navigator_bar.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';

class TasksPerformedScreen extends StatefulWidget {
  @override
  State<TasksPerformedScreen> createState() => _TasksPerformedScreenState();
}

class _TasksPerformedScreenState extends State<TasksPerformedScreen> {
  final controller = Get.put(TasksPerformedController());
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
    return
      Scaffold(
        appBar: MyAppBar(
          title: 'المهام التي تم تنفيذها'.tr,

        ),
        drawer: Drawer(
          child: MenuWidgetDashboard(), // استخدام قائمة الـ Drawer المخصصة
        ),

        body: SafeArea(
          child: Container(
            color:kColorsWhite.withOpacity(0.1),
            child:  Column(
              children: [
                SizedBox(
                  height: 0.02.sh,
                ),
                Expanded(
                  child:  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) =>
                          ItemTasksPerformed()),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:   CustomBottomNavBar(selectedMenu: MenuState.home),
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


import 'dart:convert';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/DropDownLIst/user_name_model.dart';
import 'package:projectmanagers/Screen/Examploe/examole_controller.dart';
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/apiservice/file_piker.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'package:projectmanagers/widget/buttm_navigator_bar.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/custom_textfeild.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';
import 'package:projectmanagers/widget/fileupload_widget.dart';
import 'package:projectmanagers/widget/input_text.dart';
import 'package:projectmanagers/widget/progisser_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:dio/dio.dart' as dio;

class ExamoleScreen extends StatefulWidget {
  @override
  State<ExamoleScreen> createState() => _ExamoleScreenState();
}

class _ExamoleScreenState extends State<ExamoleScreen> {
  final controller = Get.put(ExamoleController());

  final _formKeyDataAdd1 = GlobalKey<FormState>();


  @override
  initState() {
    super.initState();
    controller.fetchData();

    print("initState Called");
  }
  @override
  void dispose() {
    controller.dispose(); // إزالة المتحكم (Controller) عند التخلص من الصفحة
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                //==================================================================
                CircularPercentIndicator(
                  radius: 120.0,
                  lineWidth: 13.0,
                  animation: true,
                  percent: 0.7,
                  center: Text(
                    "70.0%",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  footer: Text(
                    "Sales this week",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.purple,
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}




import 'dart:convert';

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
  final zDExamoleController = ZoomDrawerController();
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
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return  Scaffold(
      backgroundColor: kColorsWhite,
      body: SafeArea(
        child: ZoomDrawer(
          isRtl: isRtl ? true : false,
          controller: zDExamoleController,
          style: DrawerStyle.style1,
          menuScreen: MenuWidgetDachbord(
            zoomDrawerController: zDExamoleController,
          ),
          mainScreen: Scaffold(
            backgroundColor: kColorsWhite,
            appBar: MyAppBar(
              title: 'شاشة للتجربه'.tr,
              zoomDrawerController: zDExamoleController,
            ),
            body: Column(
              children: <Widget>[
                GetBuilder<ExamoleController>(
                    init: ExamoleController(),
                    builder: (buld) {
                      return  Expanded(
                        child: Container(
                          color: kColorsWhite,
                          padding: EdgeInsets.only(left:   12.r,right: 12.r),
                          child: Form(
                            key: _formKeyDataAdd1,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 0.006.sh,
                                  ),

                                  GetBuilder<ExamoleController>(
                                      init: ExamoleController(),
                                      tag: "yes",
                                      builder: (co) {
                                        return InkWell(
                                            onTap: () async {
                                              Get.dialog(
                                                LoadingIndicatorWidget(),
                                              );
                                              Get.back();
                                              // onClickDropDwonRequest(co, context, controller.userNameModel!.dataUserName!,tag: "yes");
                                            },
                                            child: CustomTextInput(
                                              iconEnd: Icon(Icons.keyboard_arrow_down, color: kColorsLightBlack,),
                                              textAlign: TextAlign.start,
                                              text:  'Send to'.tr,
                                              filled: true,
                                              isEnabled: false,
                                              isRequired: true,
                                              labelText: 'Choose'.tr,
                                              exText: 'Choose'.tr,
                                              textEditingController: controller.UserFullNameController,
                                              styleText: TextStyle(fontFamily: 'Cairo',
                                                fontSize: 13.sp,
                                                color: kColorsBlack,
                                              ),
                                            ));
                                      }),
                                  SizedBox(
                                    height: 0.03.sh,
                                  ),



                                  SizedBox(
                                    height: 0.45.sh,
                                  ),
                                ],),
                            ),
                          ),
                        ),
                      );
                    }),

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
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home,),
    );
  }


}

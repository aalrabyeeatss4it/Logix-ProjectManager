

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Core/Utils/assets.dart';
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/LessonsProject/add_lisince_project_controller.dart';
import 'package:projectmanagers/Screen/dashboard/KeeperCovenant/AddKeeperCovenant/filter_model.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/apiservice/file_piker.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'package:projectmanagers/widget/CustomSubmitDialog.dart';
import 'package:projectmanagers/widget/add_dilog.dart';
import 'package:projectmanagers/widget/buttm_navigator_bar.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/custom_date_paker.dart';
import 'package:projectmanagers/widget/custom_textfeild.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';
import 'package:projectmanagers/widget/fileupload_widget.dart';
import 'package:projectmanagers/widget/input_text.dart';
import 'package:projectmanagers/widget/progisser_bar.dart';

class AddLessonsProjectScreen extends StatefulWidget {

  var show_tabBar;
  AddLessonsProjectScreen({this.show_tabBar});
  @override
  State<AddLessonsProjectScreen> createState() => _AddLessonsProjectScreenState();
}

class _AddLessonsProjectScreenState extends State<AddLessonsProjectScreen> {
  final controller = Get.put(AddLessonsProjectController());
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {

      print("Connection".tr);
    }
    else {
      print('No internet connection '.tr);
      // Get.toNamed(RoutingApp.cheack_intrinet_screen);
      GetSnackMsg(msg: 'No internet connection '.tr,bgClr:kColorsRed ,txClr:kColorsWhite ).showTxt();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return
      Scaffold(
        appBar:  MyAppBar(
            title: 'الدروس المستفادة من المشروع'.tr,

            colorfont: kColorsWhite),
        drawer: Drawer(
          child: MenuWidgetDashboard(), // استخدام قائمة الـ Drawer المخصصة
        ),

        body: SafeArea(
          child: Container(

            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric( horizontal:  8),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          SizedBox(
                            height: 0.01.sh,
                          ),
                          TextFieldWidget(
                            text:  '     رقم الدرس   '.tr,
                            hint: 'أدخل      رقم الدرس     '.tr,
                            sizeFontText: 12,
                            edit: 1,
                            maxLine: 1,
                            hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                            keyboardType: TextInputType.text,

                          ),
                          SizedBox(
                            height: 0.01.sh,
                          ),



                          CustomDatePaker(
                            text: 'التاريخ  '.tr ,
                            hint: '2025/2/8',
                            edit: 1,
                            reqeurment: false,
                            colorborder: kColorsBlackporder,
                          ),
                          SizedBox(height: 0.01.sh,),
                          GetBuilder<AddLessonsProjectController>(
                              init: controller,
                              builder: (co) {
                                return InkWell(
                                    onTap: () async {
                                      Get.dialog(
                                        LoadingIndicatorWidget(),
                                      );
                                      Get.back();
                                      onClickTypeMasroff( co, context, controller.filterModel!.dataFilter);
                                    },
                                    child: CustomTextInput(
                                      iconEnd: Icon(Icons.keyboard_arrow_down, color: kColorsLightBlack,),
                                      textAlign: TextAlign.start,
                                      text:  '  فئة الدرس المستفاد  '.tr,
                                      filled: true,
                                      isEnabled: false,
                                      isRequired: true,
                                      labelText: 'Choose'.tr,
                                      exText: 'Choose'.tr,
                                      textEditingController: controller.FilterNameController,
                                      styleText:  TextStyle(fontFamily: 'Cairo',
                                        fontSize: 14,
                                        color: kColorsBlack,
                                      ),
                                    ));
                              }),
                          SizedBox(height: 0.01.sh,),
                          GetBuilder<AddLessonsProjectController>(
                              init: controller,
                              builder: (co) {
                                return InkWell(
                                    onTap: () async {
                                      Get.dialog(
                                        LoadingIndicatorWidget(),
                                      );
                                      Get.back();
                                      onClickTypeMasroff( co, context, controller.filterModel!.dataFilter);
                                    },
                                    child: CustomTextInput(
                                      iconEnd: Icon(Icons.keyboard_arrow_down, color: kColorsLightBlack,),
                                      textAlign: TextAlign.start,
                                      text:  '  نوع الأثر الحاصل      '.tr,
                                      filled: true,
                                      isEnabled: false,
                                      isRequired: true,
                                      labelText: 'Choose'.tr,
                                      exText: 'Choose'.tr,
                                      textEditingController: controller.FilterNameController,
                                      styleText:  TextStyle(fontFamily: 'Cairo',
                                        fontSize: 14,
                                        color: kColorsBlack,
                                      ),
                                    ));
                              }),
                          SizedBox(height: 0.01.sh,),
                          GetBuilder<AddLessonsProjectController>(
                              init: controller,
                              builder: (co) {
                                return InkWell(
                                    onTap: () async {
                                      Get.dialog(
                                        LoadingIndicatorWidget(),
                                      );
                                      Get.back();
                                      onClickTypeMasroff( co, context, controller.filterModel!.dataFilter);
                                    },
                                    child: CustomTextInput(
                                      iconEnd: Icon(Icons.keyboard_arrow_down, color: kColorsLightBlack,),
                                      textAlign: TextAlign.start,
                                      text:  ' نوع الإجراءات المتبعة '.tr,
                                      filled: true,
                                      isEnabled: false,
                                      isRequired: true,
                                      labelText: 'Choose'.tr,
                                      exText: 'Choose'.tr,
                                      textEditingController: controller.FilterNameController,
                                      styleText:  TextStyle(fontFamily: 'Cairo',
                                        fontSize: 14,
                                        color: kColorsBlack,
                                      ),
                                    ));
                              }),
                          SizedBox(height: 0.01.sh,),
                          GetBuilder<AddLessonsProjectController>(
                              init: controller,
                              builder: (co) {
                                return InkWell(
                                    onTap: () async {
                                      Get.dialog(LoadingIndicatorWidget(),);
                                      Get.back();
                                      onClickTypeMasroff( co, context, controller.filterModel!.dataFilter);
                                    },
                                    child: CustomTextInput(
                                      iconEnd: Icon(Icons.keyboard_arrow_down, color: kColorsLightBlack,),
                                      textAlign: TextAlign.start,
                                      text:  'متابعة التطبيق والتطوير'.tr,
                                      filled: true,
                                      isEnabled: false,
                                      isRequired: true,
                                      labelText: 'Choose'.tr,
                                      exText: 'Choose'.tr,
                                      textEditingController: controller.FilterNameController,
                                      styleText:  TextStyle(fontFamily: 'Cairo',
                                        fontSize: 14,
                                        color: kColorsBlack,
                                      ),
                                    ));
                              }),
                          SizedBox(
                            height: 15.h,
                          ),
                          TextFieldWidget(
                            text: 'اسم الموظف'.tr,
                            hint: 'أدخل اسم الموظف'.tr,
                            sizeFontText: 12,
                            hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                            edit: 1,

                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          TextFieldWidget(
                            text: 'وصف التجربة / الحدث'.tr,
                            hint: '   وصف التجربة / الحدث...'.tr,
                            sizeFontText: 12,
                            hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                            edit: 1,
                            maxLine: 4,
                            minLine: 4,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          TextFieldWidget(
                            text: 'وصف الأثر الحاصل على المشروع'.tr,
                            hint: '   وصف الأثر الحاصل على المشروع...'.tr,
                            sizeFontText: 12,
                            hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                            edit: 1,
                            maxLine: 4,
                            minLine: 4,
                          ),SizedBox(
                            height: 15.h,
                          ),
                          TextFieldWidget(
                            text: 'مسببات الأثر الحاصل'.tr,
                            hint: '   مسببات الأثر الحاصل...'.tr,
                            sizeFontText: 12,
                            hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                            edit: 1,
                            maxLine: 4,
                            minLine: 4,
                          ),SizedBox(
                            height: 15.h,
                          ),
                          TextFieldWidget(
                            text: 'المقترحات والحلول'.tr,
                            hint: '  المقترحات والحلول ..'.tr,
                            sizeFontText: 12,
                            hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                            edit: 1,
                            maxLine: 4,
                            minLine: 4,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          TextFieldWidget(
                            text: 'الدروس المستفادة'.tr,
                            hint: '   الدروس المستفادة...'.tr,
                            sizeFontText: 12,
                            hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                            edit: 1,
                            maxLine: 4,
                            minLine: 4,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          TextFieldWidget(
                            text: 'الملاحظات'.tr,
                            hint: ' الملاحظات ...'.tr,
                            sizeFontText: 12,
                            hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                            edit: 1,
                            maxLine: 4,
                            minLine: 4,
                          ),
                          SizedBox(
                            height: 0.03.sh,
                          ),


                          SizedBox(
                            height: 0.03.sh,
                          ),
                          CustomButton(
                            color: kColorsPrimaryFont,
                            borderRadius: 8.r,
                            sizeHeight: 0.05.sh,
                            sizeWidth: 0.93.sw,
                            text: 'إرسال الطلب'.tr,
                            isIconEnd: true,
                            IconEnd: SvgPicture.asset(
                              AssestData.left,
                              width: 24 ,
                              height: 24 ,
                              color: kColorsWhite,
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'GraphikArabic',
                              fontWeight: FontWeight.w500,
                              height: 1.71,),
                            onPress: () async {
                              showDialog(
                                context: context,
                                builder: (context) => CustomSubmitOptionDialog(
                                  onPress: (){
                                    Get.back();
                                    Get.dialog(AddSuccsessDialog());
                                  },
                                  text:   'هل أنت متأكد من إرسال الطلب؟'.tr,
                                  Colore: kColorsWhite,
                                  ColoreCleare: kColorsLightBlack,
                                  backColor1:kColorsPrimaryFont,
                                  backColor2: kColorsWhite,
                                  fontColortext1: kColorsWhite,
                                  fontColortext2: kColorsPrimaryFont,
                                  borderColor2: kColorsPrimaryFont,
                                  text1: 'نعم متأكد'.tr,
                                  text2: 'تراجع'.tr,
                                  heightContainer: 0.17,
                                ),
                              );

                            },
                          ),
                          SizedBox(
                            height: 0.30.sh,
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar:   CustomBottomNavBar(selectedMenu: MenuState.home),

      );
  }
  onClickTypeMasroff(AddLessonsProjectController controller, BuildContext context,       List<DataFilter> drop,) {
    Get.bottomSheet(
      StatefulBuilder(
          builder: (context, setState) {
            return
              Container(
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? ThemeData
                      .dark()
                      .cardColor : Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: GetBuilder<AddLessonsProjectController>(
                  init: controller,
                  builder: (_c) {
                    return SizedBox(
                      height: 0.60.sh,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 20),
                                Text(
                                  'Choose'.tr,
                                  style:  TextStyle(
                                      color: kColorsPrimaryFont,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4.0.r),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Image.asset(
                                      AssestData.clear2,
                                      width: 25.r,
                                      height: 25.r,
                                      color: kColorsPrimaryFont,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 0.0),
                            child: SizedBox(
                              height: 45,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 9,
                                    child: TextField(
                                      controller: _c.searchCustomerController,
                                      style:  TextStyle(
                                          color: kColorsBlack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                      cursorColor: kColorsPrimaryFont,
                                      decoration: InputDecoration(
                                        hintText: 'search'.tr,
                                        hintStyle:  TextStyle(
                                            color: kColorsPrimaryFont,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                        prefixIcon: Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: kColorsBackDelete.withOpacity(.3)),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        _c.update(); // Trigger a rebuild
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                      icon: Icon(Icons.add),
                                      color: kColorsDeepPrimary,
                                      onPressed: () {

                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: drop!.where((e) =>
                                    e.name!.toLowerCase().contains(
                                        _c.searchCustomerController.text.toLowerCase()))
                                    .map((e) =>
                                    SizedBox(
                                      width: double.infinity,
                                      child: InkWell(
                                        onTap: () {
                                          controller.onChangeCustomerName(
                                              e.name.toString(), e.id);
                                          Get.back();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12.0),
                                          child: Card(
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              side: BorderSide(width: 1,
                                                  color: kColorsBackDelete.withOpacity(
                                                      .3)),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                e.name.toString(),
                                                style:  TextStyle(
                                                    color: kColorsBlack,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )).toList(),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    );
                  },
                ),
              );
          } ),
      elevation: 2,
      isScrollControlled: true,
    );

  }
}


import 'package:projectmanagers/Core/Utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/apiservice/file_piker.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'package:projectmanagers/widget/CustomSubmitDialog.dart';
import 'package:projectmanagers/widget/buttm_navigator_bar.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/custom_date_paker.dart';
import 'package:projectmanagers/widget/custom_textfeild.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';
import 'package:projectmanagers/widget/fileupload_widget.dart';
import 'package:projectmanagers/widget/input_text.dart';
import 'package:projectmanagers/widget/progisser_bar.dart';

import 'add_dilog.dart';
import 'add_keeper_covenant_controller.dart';
import 'filter_model.dart';

class AddKeeperCovenantScreen extends StatefulWidget {

  var show_tabBar;
  AddKeeperCovenantScreen({this.show_tabBar});
  @override
  State<AddKeeperCovenantScreen> createState() => _AddKeeperCovenantScreenState();
}

class _AddKeeperCovenantScreenState extends State<AddKeeperCovenantScreen> {
  final controller = Get.put(AddKeeperCovenantController());
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
            title: 'حافظة عهده جديده'.tr,

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
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: TextFieldWidget(
                                  text: 'رقم مركز التكلفه'.tr,
                                  sizeFontText: 12,
                                  edit: 1,
                                  hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                                  maxLine: 1,
                                  keyboardType: TextInputType.number,
                                ),
                              ),

                              Expanded(
                                flex: 5,
                                child: TextFieldWidget(
                                  text:  'اسم مركز التكلفه'.tr,
                                  sizeFontText: 12,
                                  edit: 1,
                                  maxLine: 1,
                                  hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                                  keyboardType: TextInputType.text,

                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0.01.sh,
                          ),
                          CustomDatePaker(
                            text: 'التاريخ'.tr ,
                            edit: 1,
                            reqeurment: false,
                            colorborder: kColorsBlackporder,
                          ),
                          SizedBox(height: 0.01.sh,),
                          GetBuilder<AddKeeperCovenantController>(
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
                                      text:  ' نوع المصروف'.tr,
                                      filled: true,
                                      isEnabled: false,
                                      isRequired: true,
                                      labelText: 'Choose'.tr,
                                      exText: 'Choose'.tr,
                                      textEditingController: controller.FilterNameController,
                                      styleText: const TextStyle(fontFamily: 'Cairo',
                                        fontSize: 14,
                                        color: kColorsBlack,
                                      ),
                                    ));
                              }),
                          SizedBox(
                            height: 0.01.sh,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: TextFieldWidget(
                                  text: ' المبلغ '.tr,
                                  hint: 'أدخل المبلغ'.tr,
                                  sizeFontText: 12,
                                  edit: 1,
                                  hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                                  maxLine: 1,
                                  keyboardType: TextInputType.number,

                                ),
                              ),

                              Expanded(
                                flex: 5,
                                child: TextFieldWidget(
                                  text:  ' الضريبه'.tr,
                                  hint: 'أدخل الضريبه '.tr,
                                  sizeFontText: 12,
                                  edit: 1,
                                  maxLine: 1,
                                  hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                                  keyboardType: TextInputType.text,

                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0.01.sh,
                          ),
                          TextFieldWidget(
                            text:  ' الإجمالي '.tr,
                            hint: 'أدخل الإجمالي  '.tr,
                            sizeFontText: 12,
                            edit: 1,
                            maxLine: 1,
                            hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                            keyboardType: TextInputType.text,

                          ),
                          SizedBox(
                            height: 0.01.sh,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: TextFieldWidget(
                                  text: ' الرقم الضريبي '.tr,
                                  hint: 'أدخل الرقم الضريبي '.tr,
                                  sizeFontText: 12,
                                  edit: 1,
                                  hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                                  maxLine: 1,
                                  keyboardType: TextInputType.number,

                                ),
                              ),

                              Expanded(
                                flex: 5,
                                child: TextFieldWidget(
                                  text:  ' رقم الفاتورة'.tr,
                                  hint: 'أدخل رقم الفاتورة  '.tr,
                                  sizeFontText: 12,
                                  edit: 1,
                                  maxLine: 1,
                                  hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                                  keyboardType: TextInputType.text,

                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0.01.sh,
                          ),

                          TextFieldWidget(
                            text: 'المورد'.tr,
                            hint: 'أدخل   المورد   '.tr,
                            sizeFontText: 12,
                            // hint: "support@ss4it.com.sa",
                            hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                            edit: 1,
                            maxLine: 1,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          TextFieldWidget(
                            text: 'البيان'.tr,
                            hint: '  البيان..'.tr,
                            sizeFontText: 12,
                            hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                            edit: 1,
                            maxLine: 5,
                            minLine: 5,
                          ),
                          SizedBox(
                            height: 0.03.sh,
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(
                                      left:2.r, right:10.r,
                                      bottom:1.r),
                                  child: Text(
                                    "المرفقات".tr,
                                    style: const TextStyle(    fontSize: 14,
                                      fontFamily: 'GraphikArabic',
                                      fontWeight: FontWeight.w600,
                                      height: 1.14,color:kColorsPrimaryFont, ),)
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0.02.sh,
                          ),
                          TextFieldWidget(
                            text: ' اسم المستند'.tr,
                            hint: ' ادخل اسم المستند'.tr,
                            sizeFontText: 12,
                            hintStyle: TextStyle(    fontSize: 14,
                                fontFamily: 'GraphikArabic',
                                fontWeight: FontWeight.w400,
                                height: 1.14,color:Colors.black.withOpacity(0.4)  ),
                            edit: 1,
                          ),
                          SizedBox(
                            height: 0.03.sh,
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(
                                      left:2.r, right:10.r,
                                      bottom:1.r),
                                  child: Text(
                                    "مسار الملف".tr,
                                    style: const TextStyle(     fontSize: 14,
                                      fontFamily: 'GraphikArabic',
                                      fontWeight: FontWeight.w400,
                                      height: 1.14,color:kColorsBlackTow, ),)
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0.02.sh,
                          ),
                          GetBuilder<FilePickerController>(
                              init: FilePickerController(),
                              builder: (fileController) {
                                return FileUploadCustom(controller: fileController,name: fileController.name,);
                              }
                          ),
                          SizedBox(
                            height: 0.03.sh,
                          ),
                          CustomButton(
                            color: kColorsPrimaryFont,
                            borderRadius: 8.r,
                            sizeHeight: 0.045.sh,
                            sizeWidth: 0.93.sw,
                            text: 'إضافه'.tr,
                            style: const TextStyle(
                                fontFamily: 'GraphikArabic',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: kColorsWhite),
                            onPress: () async {
                              showDialog(
                                context: context,
                                builder: (context) => CustomSubmitOptionDialog(
                                  onPress: () {
                                    Get.back();
                                    Get.dialog(AddDialog());

                                  },
                                  text:   'هل أنت متأكد '.tr,
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
  onClickTypeMasroff(AddKeeperCovenantController controller, BuildContext context,       List<DataFilter> drop,) {
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
                child: GetBuilder<AddKeeperCovenantController>(
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
                                  style: const TextStyle(
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
                                      style: const TextStyle(
                                          color: kColorsBlack,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                      cursorColor: kColorsPrimaryFont,
                                      decoration: InputDecoration(
                                        hintText: 'search'.tr,
                                        hintStyle: const TextStyle(
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
                                                style: const TextStyle(
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

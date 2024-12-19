import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/TasksPerformed/tasks_performed_controller.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/custom_row_text.dart';
import 'package:projectmanagers/widget/custom_textfeild.dart';
import 'package:projectmanagers/widget/custom_tow_row_text.dart';
import 'package:projectmanagers/widget/input_text.dart';
import 'package:projectmanagers/widget/progisser_bar.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ItemTasksPerformed extends StatelessWidget {
  ItemTasksPerformed();
  final _formKeyChing = GlobalKey<FormState>();
  final _formKeyAdd = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages=true;
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return InkWell(
        onTap: (){
        },
      child: Column(
        children: [
          SizedBox(
            height: 0.01.sh,
          ),
          Padding(
            padding:  EdgeInsets.only(left: 0.03.sw,right:  0.03.sw),
            child: Container(

              width: 0.95.sw,
              decoration: BoxDecoration(
                color: kColorsWhite,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 5.0.r, bottom: 5.r, left:isRtl!=true? 10.0.r:0.0, right:isRtl==true? 10.0.r:0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CustomRowText(text: 'المهمه'.tr, textStyle: const TextStyle(fontSize: 12, color: kColorsPrimaryFont, fontWeight: FontWeight.w500,), textValue: " مصدر المستند", textValueStyle: const TextStyle(fontSize: 12, color: kColorsBlackTow,), backColor: kColorsWhite,),

                        CustomTowRowText(flex:4,text: 'المسؤؤل'.tr, textStyle: const TextStyle(fontSize: 12, color: kColorsBlack, fontWeight: FontWeight.w500,), textValue: "حذيفه المجيدي", textValueStyle: const TextStyle(fontSize: 12, color: kColorsBlackTow,), backColor: kColorsWhite, text2: "الحاله".tr, textValue2: "لم يتم البدء",),
                        CustomTowRowText(flex:4,text: 'رقم النشاط '.tr, textStyle: const TextStyle(fontSize: 12, color: kColorsBlack, fontWeight: FontWeight.w500,), textValue: "5555", textValueStyle: const TextStyle(fontSize: 12, color: kColorsBlackTow,), backColor: kColorsWhite, text2: "إنجاز المخطط".tr, textValue2: "95%",),
                        CustomTowRowText(flex:4,text: 'تاريخ البدايه الفعلي '.tr, textStyle: const TextStyle(fontSize: 12, color: kColorsBlack, fontWeight: FontWeight.w500,), textValue: "2023/5/8", textValueStyle: const TextStyle(fontSize: 12, color: kColorsBlackTow,), backColor: kColorsWhite, text2: "تاريخ النهايه الفعلي ".tr, textValue2: " 2028/5/9",),
                        CustomTowRowText(flex:4,text: 'نسبة المهمه من المشروع'.tr, textStyle: const TextStyle(fontSize: 12, color: kColorsBlack, fontWeight: FontWeight.w500,), textValue: "56%", textValueStyle: const TextStyle(fontSize: 12, color: kColorsBlackTow,), backColor: kColorsWhite, text2: "نسبة الإنجاز الفعلي".tr, textValue2: "23%",),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            CustomButton(
                              color: kColorsPrimaryFont,
                              borderRadius: 6.r,
                              sizeHeight: 0.06.sh,
                              sizeWidth: 0.40.sw,
                              text: 'تغيير الحاله'.tr,
                              style: TextStyle(fontFamily: 'Regular',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color:
                                  kColorsWhite),
                              onPress: () async{
                                Get.bottomSheet(
                                  Container(
                                    margin:const EdgeInsets.all(1.0 ),
                                    // height: .42.sh,
                                    height: 0.70.sh,
                                    width: 1.0.sw,
                                    decoration:const BoxDecoration(color: kColorsWhite,
                                      borderRadius: BorderRadius.only(topLeft:Radius.circular(30 ),topRight: Radius.circular(30 )),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(),
                                              Text('search'.tr ,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: kColorsPrimary,
                                                    fontWeight: FontWeight.w500
                                                ),),
                                              Padding(
                                                padding:const EdgeInsets.all(16.0 ),
                                                child:
                                                GestureDetector(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      height: 20.h,
                                                      width: 20.w,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(25.r),
                                                        color: kColorsLightBlackLow,
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(3.0 ),
                                                        child:
                                                        Image.asset(
                                                          "assets/Icon/clear.png",
                                                          width: 20.r,
                                                          height: 20.r,
                                                          color: kColorsWhite,),

                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            padding:const EdgeInsets.all(8 ),
                                            child: Form(
                                              key: _formKeyChing,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[

                                                  SizedBox(
                                                    height: 0.02.sh,
                                                  ),
                                                  GetBuilder<
                                                      TasksPerformedController>(
                                                      init:
                                                      TasksPerformedController(),
                                                      builder: (co) {
                                                        return InkWell(
                                                            onTap:
                                                                () async {
                                                              Get.dialog(
                                                                LoadingIndicatorWidget(),
                                                              );
                                                              Get.back();
                                                              onClick(co,context);
                                                            },
                                                            child:
                                                            CustomTextInput(
                                                              iconEnd: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down,
                                                                color:
                                                                kColorsLightBlack,
                                                              ),
                                                              textAlign: TextAlign.start,
                                                              text: 'Search b'.tr,
                                                              filled: true,
                                                              isEnabled: false,
                                                              readOnly:true ,
                                                              isRequired: true,
                                                              labelText: 'undefined'.tr,
                                                              exText: 'undefined'.tr,
                                                              // textEditingController: controller.TypeFilterTextControll,
                                                              styleText:   TextStyle(
                                                                fontSize:
                                                                13.sp,
                                                                color:
                                                                kColorsBlack,
                                                              ),
                                                              hintstyle: const TextStyle(
                                                                fontSize:
                                                                12,
                                                                color:
                                                                kColorsLightBlackLow,
                                                              ),
                                                            ));
                                                      }),
                                                  SizedBox(
                                                    height: 0.02.sh,
                                                  ),
                                                  // GetBuilder<FollowUpsController>(
                                                  //     init: FollowUpsController(),
                                                  //     builder: (co) {
                                                  //       return InkWell(
                                                  //           onTap: () async {
                                                  //             Get.dialog(
                                                  //               LoadingIndicatorWidget(),
                                                  //             );
                                                  //             Get.back();
                                                  //             onClickSideType(co, context, controller.sideModel!.dataSide!,tag: "yes");
                                                  //           },
                                                  //           child: CustomTextInput(
                                                  //
                                                  //             iconEnd: Icon(Icons.keyboard_arrow_down, color: kColorsLightBlack,),
                                                  //             textAlign: TextAlign.start,
                                                  //             text: 'Side'.tr,
                                                  //             filled: true,
                                                  //             isEnabled: false,
                                                  //             labelText: 'Choose'.tr,
                                                  //             exText: 'Choose'.tr,
                                                  //             textEditingController: controller.SideController,
                                                  //             styleText:   TextStyle(
                                                  //               fontSize: 13.sp,
                                                  //               color: kColorsBlack,
                                                  //             ),
                                                  //             hintstyle: const TextStyle(
                                                  //               fontSize: 12,
                                                  //               color: kColorsLightBlackLow,
                                                  //             ),
                                                  //           ));
                                                  //     }),
                                                  // SizedBox(
                                                  //   height: 0.02.sh,
                                                  // ),
                                                  CustomButton(
                                                    color:kColorsPrimaryFont ,

                                                    text: 'search'.tr,
                                                    isIconEnd: true,
                                                    IconEnd: SvgPicture.asset(
                                                      "assets/Icons/left.svg",
                                                      width: 24.r ,
                                                      height: 24.r ,
                                                      color: kColorsWhite,
                                                    ),
                                                    borderRadius: 10.r,
                                                    sizeHeight: 0.06.sh,
                                                    sizeWidth: 0.94.sw,
                                                    onPress: () async {
                                                      if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
                                                        // if (_formKey.currentState!.validate()) {
                                                        print("Connection".tr);
                                                        Get.back();
                                                        // await  controller.getDataFollowUpsApi();
                                                        //   }
                                                        // } else {
                                                        //   print("No Connection".tr);
                                                        //   GetSnackMsg(msg: "No Connection".tr, bgClr: kColorsRed, txClr: kColorsWhite).showTxt();
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  elevation: 2,
                                  isScrollControlled: true,
                                );
                              },
                            ),
                            Padding(
                              padding:   EdgeInsets. only(left: isRtl==true? 8.0.r:0.0.r,right: isRtl!=true? 8.0.r:0.0.r),
                              child: CustomButton(
                                color: kColorsWhite,
                                borderRadius: 6.r,
                                sizeHeight: 0.06.sh,
                                sizeWidth: 0.40.sw,

                                borderColor: kColorsPrimaryFont,
                                text: 'إضافة ملاحظه'.tr,
                                style: TextStyle(fontFamily: 'Regular',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color:
                                    kColorsPrimaryFont),
                                onPress: () async{
                                  Get.bottomSheet(
                                    Container(
                                      margin:const EdgeInsets.all(1.0 ),
                                      // height: .42.sh,
                                      height: 0.70.sh,
                                      width: 1.0.sw,
                                      decoration:const BoxDecoration(color: kColorsWhite,
                                        borderRadius: BorderRadius.only(topLeft:Radius.circular(30 ),topRight: Radius.circular(30 )),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(),
                                                Text('search'.tr ,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: kColorsPrimary,
                                                      fontWeight: FontWeight.w500
                                                  ),),
                                                Padding(
                                                  padding:const EdgeInsets.all(16.0 ),
                                                  child:
                                                  GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: Container(
                                                        height: 20.h,
                                                        width: 20.w,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(25.r),
                                                          color: kColorsLightBlackLow,
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(3.0 ),
                                                          child:
                                                          Image.asset(
                                                            "assets/Icon/clear.png",
                                                            width: 20.r,
                                                            height: 20.r,
                                                            color: kColorsWhite,),

                                                        ),
                                                      )),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              padding:const EdgeInsets.all(8 ),
                                              child: Form(
                                                key: _formKeyAdd,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[

                                                    TextFieldWidget(

                                                      text: 'رقم الفاتوره'.tr,
                                                      edit: 1,
                                                      // controller:controller.SubjectController,
                                                      keyboardType: TextInputType.number,
                                                      color: kColorsDeepWhite,
                                                    ),



                                                    SizedBox(
                                                      height: 0.02.sh,
                                                    ),
                                                    // GetBuilder<FollowUpsController>(
                                                    //     init: FollowUpsController(),
                                                    //     builder: (co) {
                                                    //       return InkWell(
                                                    //           onTap: () async {
                                                    //             Get.dialog(
                                                    //               LoadingIndicatorWidget(),
                                                    //             );
                                                    //             Get.back();
                                                    //             onClickSideType(co, context, controller.sideModel!.dataSide!,tag: "yes");
                                                    //           },
                                                    //           child: CustomTextInput(
                                                    //
                                                    //             iconEnd: Icon(Icons.keyboard_arrow_down, color: kColorsLightBlack,),
                                                    //             textAlign: TextAlign.start,
                                                    //             text: 'Side'.tr,
                                                    //             filled: true,
                                                    //             isEnabled: false,
                                                    //             labelText: 'Choose'.tr,
                                                    //             exText: 'Choose'.tr,
                                                    //             textEditingController: controller.SideController,
                                                    //             styleText:   TextStyle(
                                                    //               fontSize: 13.sp,
                                                    //               color: kColorsBlack,
                                                    //             ),
                                                    //             hintstyle: const TextStyle(
                                                    //               fontSize: 12,
                                                    //               color: kColorsLightBlackLow,
                                                    //             ),
                                                    //           ));
                                                    //     }),
                                                    // SizedBox(
                                                    //   height: 0.02.sh,
                                                    // ),
                                                    CustomButton(
                                                      color:kColorsPrimaryFont ,

                                                      text: 'search'.tr,
                                                      isIconEnd: true,
                                                      IconEnd: SvgPicture.asset(
                                                        "assets/Icons/left.svg",
                                                        width: 24.r ,
                                                        height: 24.r ,
                                                        color: kColorsWhite,
                                                      ),
                                                      borderRadius: 10.r,
                                                      sizeHeight: 0.06.sh,
                                                      sizeWidth: 0.94.sw,
                                                      onPress: () async {
                                                        if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
                                                          // if (_formKey.currentState!.validate()) {
                                                          print("Connection".tr);
                                                          Get.back();
                                                          // await  controller.getDataFollowUpsApi();
                                                          //   }
                                                          // } else {
                                                          //   print("No Connection".tr);
                                                          //   GetSnackMsg(msg: "No Connection".tr, bgClr: kColorsRed, txClr: kColorsWhite).showTxt();
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    elevation: 2,
                                    isScrollControlled: true,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.01.sh,
                        ),

                      ],
                    ),


                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.01.sh,
          ),
        ],
      ),
    );
  }
  onClick(
      TasksPerformedController controller,
      BuildContext context,
      ) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
            color: Get.isDarkMode ? ThemeData.dark().cardColor : Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r))),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: GetBuilder<TasksPerformedController>(
              init: TasksPerformedController(),
              builder: (buld) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            'Choose'.tr,
                            style:   TextStyle(
                                color: kColorsPrimary,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0.r),
                            child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Image.asset(
                                  "assets/Icons/clear.png",
                                  width: 25.r,
                                  height: 25.r,
                                  color: kColorsPrimary,
                                )),
                          ),
                        ],
                      ),
                    ),
                    // ...drop.map((e) => InkWell(
                    //   onTap: () {
                    //     controller.onChanTypeFilter(
                    //         e.name.toString(), e.id);
                    //     Get.back();
                    //   },
                    //   child: Padding(
                    //     padding: EdgeInsets.all(1.0.r),
                    //     child: Card(
                    //       elevation: 0,
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(10.r),
                    //           side: BorderSide(
                    //               width: 1,
                    //               color:
                    //               kColorsLightBlack.withOpacity(.3))),
                    //       child: Padding(
                    //         padding: EdgeInsets.all(8.0.r),
                    //         child: Text(
                    //           e.name.toString(),
                    //           style:   TextStyle(
                    //               color: kColorsBlack,
                    //               fontSize: 12.sp,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ))
                  ],
                );
              }),
        ),
      ),
      elevation: 2,
      isScrollControlled: true,
    );
  }
}

class ItemTasksPerformedShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages=true;
    return Shimmer(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.05.sw, right: 0.03.sw),
            child: Container(
              height: 0.30.sh,
              width: 343.w,
              decoration: BoxDecoration(
                color: kColorsWhite,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                    width: 0.4.r, color: kColorsPrimary.withOpacity(0.6)),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 5.0.r, bottom: 5.r, left: 5.0.r, right: 10.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRowText(
                      text: " ",
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: kColorsWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      textValue: "",
                      textValueStyle: const TextStyle(
                        fontSize: 10,
                        color: kColorsBlack,
                      ),
                      backColor: kColorsWhite,
                    ),
                    CustomRowText(
                      text: "",
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: kColorsWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      textValue: "",
                      textValueStyle: const TextStyle(
                        fontSize: 10,
                        color: kColorsBlack,
                      ),
                      backColor: kColorsWhite,
                    ),
                    CustomRowText(
                      text: "",
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: kColorsWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      textValue: " ",
                      textValueStyle: const TextStyle(
                        fontSize: 10,
                        color: kColorsBlack,
                      ),
                      backColor: kColorsWhite,
                    ),
                    CustomRowText(
                      text: " ",
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: kColorsWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      textValue: "",
                      textValueStyle: const TextStyle(
                        fontSize: 10,
                        color: kColorsBlack,
                      ),
                      backColor: kColorsWhite,
                    ),
                    CustomRowText(
                      text: " ",
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: kColorsWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      textValue: " ",
                      textValueStyle: const TextStyle(
                        fontSize: 10,
                        color: kColorsBlack,
                      ),
                      backColor: kColorsWhite,
                    ),
                    CustomRowText(
                      text: "",
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: kColorsWhite,
                        fontWeight: FontWeight.w500,
                      ),
                      textValue: "  ",
                      textValueStyle: const TextStyle(
                        fontSize: 10,
                        color: kColorsBlack,
                      ),
                      backColor: Color(0xffEBF1F8),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12.0.h,
          ),
        ],
      ),
    );
  }
}

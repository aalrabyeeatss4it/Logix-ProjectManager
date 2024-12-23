
import 'package:projectmanagers/Screen/dashboard/KeeperCovenant/item_keeper_covenent.dart';
import 'package:projectmanagers/Screen/dashboard/KeeperCovenant/keeper_covenant_controller.dart';
import 'package:projectmanagers/Screen/dashboard/home/itemhome.dart';
import 'package:projectmanagers/widget/buttm_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/custom_date_paker.dart';
import 'package:projectmanagers/widget/custom_textfeild.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class KeeperCovenantScreen extends StatefulWidget {

  var show_tabBar;
  KeeperCovenantScreen({this.show_tabBar});
  @override
  State<KeeperCovenantScreen> createState() => _KeeperCovenantScreenState();
}

class _KeeperCovenantScreenState extends State<KeeperCovenantScreen> {
  final zDKeeperCovenantController = ZoomDrawerController();
  final controller = Get.put(KeeperCovenantController());
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
      // controller.Revrech();
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
    return  Scaffold(

      body: SafeArea(
        child: ZoomDrawer(
          isRtl: isRtl ? true : false,
          controller: zDKeeperCovenantController,
          style: DrawerStyle.style1,
          menuScreen: MenuWidgetDachbord(zoomDrawerController: zDKeeperCovenantController,),
          mainScreen: Scaffold(
              appBar: MyAppBar(
                  title: 'حافظة العهدة'.tr,
                  zoomDrawerController: zDKeeperCovenantController,
                  colorfont: kColorsWhite),
              backgroundColor:kColorsWhite.withOpacity(0.5),
              body: Container(
                color: kColorsWhite.withOpacity(0.1),
                margin:const EdgeInsets.only(top: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding:const EdgeInsets.only(right:  8,left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal:8.0 ),
                                child: Container(
                                  height: 0.04.sh,
                                  width:  0.92.sw,
                                  decoration: BoxDecoration(
                                      color: kColorsWhite,
                                      border: Border.all(width: 0.4,color:kColorsPrimary ),
                                      borderRadius: BorderRadius.circular(5.r)

                                  ),
                                  child: InkWell(
                                    onTap: () {
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
                                                    key: _formKey,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        CustomDatePaker(
                                                          text: 'من تاريخ'.tr ,
                                                          edit: 1,
                                                          // controller: controller.FromDateController,
                                                        ),
                                                        SizedBox(
                                                          height: 0.02.sh,
                                                        ),
                                                        CustomDatePaker(
                                                          text: 'To Date'.tr ,
                                                          edit: 1,
                                                          // controller: controller.ToDateController,
                                                        ),
                                                        TextFieldWidget(
                                                          text: 'نوع المصروف'.tr,
                                                          edit: 1,
                                                          // controller:controller.RegistrationNumberController,
                                                          keyboardType: TextInputType.text,
                                                          color: kColorsDeepWhite,
                                                        ),

                                                        SizedBox(height: 0.02.sh,),
                                                        TextFieldWidget(

                                                          text: 'الإجمالي'.tr,
                                                          edit: 1,
                                                          // controller:controller.SubjectController,
                                                          keyboardType: TextInputType.number,
                                                          color: kColorsDeepWhite,
                                                        ),

                                                        SizedBox(
                                                          height: 0.02.sh,
                                                        ),
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
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.all(6.0),
                                          child: SvgPicture.asset(
                                            "assets/Icon/search-normal.svg",
                                            width: 16,
                                            height: 16,
                                          ),
                                        ),
                                        Text(
                                          'search'.tr,
                                          style:
                                          TextStyle(fontFamily: 'GraphikArabic',color: kColorsPrimary, fontSize: 16,fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(
                            height: 0.05.sh,
                          ),

                        ],
                      ),
                    ),
                    Expanded(
                      child:  ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) =>
                              ItemKeeperCovenant()),
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
          angle: 0.0,
          // drawerShadowsBackgroundColor: Colors.grey[300],
          slideWidth: MediaQuery.of(context).size.width * 0.65.w,
          shadowLayer1Color: kColorsorang,
        ),
      ),
    );
  }
}

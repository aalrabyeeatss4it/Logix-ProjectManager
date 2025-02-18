import 'package:projectmanagers/Constants/my_text.dart';
import 'package:projectmanagers/Core/Utils/assets.dart';
import 'package:projectmanagers/Screen/Notifcation/item_notifcation.dart';
import 'package:projectmanagers/Screen/Notifcation/item_notifcation_not_read.dart';
import 'package:projectmanagers/Screen/Notifcation/notifcation_controller.dart';
import 'package:projectmanagers/Screen/Notifcation/notifcation_filter_model.dart';
import 'package:projectmanagers/Screen/Notifcation/notifcation_not_read_controller.dart';
import 'package:projectmanagers/Screen/Notifcation/tabBar_notifcation_controller.dart';
import 'package:projectmanagers/widget/buttm_navigator_bar.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/custom_textfeild.dart';
import 'package:projectmanagers/widget/input_text.dart';
import 'package:projectmanagers/widget/progisser_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';


class NotifcationScreen extends StatefulWidget {

  var show_tabBar;
  var IsHome;

  NotifcationScreen({this.show_tabBar, this.IsHome,});

  @override
  State<NotifcationScreen> createState() => _NotifcationScreenState();
}

class _NotifcationScreenState extends State<NotifcationScreen> {
  final  controller = Get.put(NotifcationController());
  final  controllerNotReade = Get.put(NotifcationReadController());
  final controllerTabBarClosedTransactions = Get.put(TabBarNotifcationController());
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
       controller.Revrech();
       controllerNotReade.Revrech();
    }
    else{
      print("ليس هناك انترنت ");
      GetSnackMsg(msg: 'No internet connection'.tr,bgClr:kColorsRed ,txClr:kColorsWhite ).showTxt();
    }

  }
  @override
  Widget build(BuildContext context) {
    widget.show_tabBar == null ? widget.show_tabBar = false : widget.show_tabBar;
    final isRtl = Localizations.localeOf(context).languageCode == 'ar';
    return
      DefaultTabController(
      initialIndex: controllerTabBarClosedTransactions.selectedIndex,
      length: 2,
      child:   Scaffold(
            appBar: MyAppBar(
        title: 'Notifications'.tr,
      ),

        body: SafeArea(
          child: Column(
            children: <Widget>[


              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15.r))),
                height: 0.05.sh,
                width: 0.90.sw,
                child: AppBar(
                  backgroundColor: Color(0xffF2F2F2),
                  bottom: TabBar(
                    onTap: (index) {
                      controllerTabBarClosedTransactions.selectedIndex = index;
                    },
                    controller: controllerTabBarClosedTransactions.controllerTabBar,
                    isScrollable: true,
                    labelColor: kColorsWhite,
                    labelStyle: const TextStyle(fontSize: 14, color: kColorsPrimaryFont, fontWeight: FontWeight.w500,fontFamily:  'Cairo'),
                    unselectedLabelColor: Color(0xff6F6F6F),
                    unselectedLabelStyle:  const TextStyle(fontSize: 14, color:  Color(0xff6F6F6F), fontWeight: FontWeight.w500,fontFamily:  'Cairo'),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(borderRadius: BorderRadius.circular(5.r), color: kColorsPrimaryFont,),

                    tabs: [
                      Container(
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(7),
                        //     border: Border.all(color: kColorsPrimaryFont, width: 1)),
                        width: 0.32.sw,
                        height: 0.04.sh,
                        child: Tab(text: 'New notifications'.tr),
                      ),
                      Container(
                          width: 0.22.sw,
                          height: 0.04.sh,
                          child: Tab(text: 'All'.tr)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: controllerTabBarClosedTransactions.controllerTabBar,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 2.r),
                      child: Column(

                        children: [
                          SizedBox(
                            height: 0.02.sh,
                          ),
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right:  8.r,left: 8.r),
                            child:   controllerNotReade.obx((transClosed) =>
                                Column(
                                  children: [
                                    Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            padding: EdgeInsets.only(left:8.r, right:8.r),
                                            child: Text('Notification box'.tr,
                                              style:  const TextStyle(color: kColorsPrimaryFont,fontSize: 14,fontWeight: FontWeight.w500),)
                                        ),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal:8.0.r),
                                          child: Container(
                                            height: 0.04.sh,
                                            width:  0.08.sw,
                                            decoration: BoxDecoration(color: kColorbackgroundCard, borderRadius: BorderRadius.circular(5.r)),
                                            child: InkWell(
                                              onTap: () {
                                                Get.bottomSheet(
                                                  Container(
                                                    margin: EdgeInsets.all(1.0.r),
                                                    // height: .42.sh,
                                                    height: 0.42.sh,
                                                    width: 1.0.sw,
                                                    decoration: BoxDecoration(color: kColorsWhite,
                                                      borderRadius: BorderRadius.only(topLeft:Radius.circular(30.r),topRight: Radius.circular(30.r)),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(),
                                                            Padding(
                                                              padding: EdgeInsets.all(3.0.r),
                                                              child: Text('Filter'.tr ,
                                                                style: const TextStyle(
                                                                    fontSize: 16,
                                                                    color: kColorsPrimaryFont),),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.all(16.0.r),
                                                              //child: Image.asset("assets/Icons/DirectionRight.png", width: 25, height: 25),
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
                                                                      padding:  EdgeInsets.all(3.0.r),
                                                                      child:    Image.asset(
                                                                        AssestData.wallet,
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
                                                          padding: EdgeInsets.all(8.r),
                                                          child: Form(
                                                            key: _formKey,
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                GetBuilder<NotifcationController>(
                                                                    init: NotifcationController(),
                                                                    builder: (co) {
                                                                      return InkWell(
                                                                          onTap: () async {
                                                                            Get.dialog(
                                                                              LoadingIndicatorWidget(),
                                                                            );
                                                                            Get.back();
                                                                            onClickSessionsType(co, context, controller.typeFilterModel!.notifcationFilter);
                                                                          },
                                                                          child: CustomTextInput(

                                                                            iconEnd: Icon(Icons.keyboard_arrow_down, color: kColorsLightBlack,),
                                                                            textAlign: TextAlign.start,

                                                                            text: 'Search b'.tr,
                                                                            filled: true,
                                                                            isEnabled: false,
                                                                            isRequired: true,
                                                                            labelText:  'undefined'.tr,
                                                                            exText: 'undefined'.tr,
                                                                            textEditingController: controller.TypeFilterTextControll,
                                                                            styleText: const TextStyle(
                                                                              fontSize: 13,
                                                                              color: kColorsBlack,
                                                                            ),
                                                                            hintstyle: const TextStyle(
                                                                              fontSize: 12,
                                                                              color: kColorsLightBlackLow,
                                                                            ),
                                                                          ));
                                                                    }),
                                                                SizedBox(
                                                                  height: 0.02.sh,
                                                                ),
                                                                TextFieldWidget(
                                                                  hint: 'the value'.tr,
                                                                  text: 'the value'.tr,
                                                                  edit: 1,
                                                                  controller:controller.ValuaFilterTextControll,
                                                                  requirement: true,
                                                                  keyboardType: TextInputType.text,

                                                                ),
                                                                SizedBox(
                                                                  height: 0.02.sh,
                                                                ),
                                                                CustomButton(
                                                                  text: 'search'.tr,
                                                                  isIconEnd: true,
                                                                  IconEnd: SvgPicture.asset(
                                                                    AssestData.left,
                                                                    width: 24.r ,
                                                                    height: 24.r ,
                                                                    color: kColorsWhite,
                                                                  ),
                                                                  borderRadius: 10.r,
                                                                  sizeHeight: 0.045.sh,
                                                                  sizeWidth: 0.92.sw,
                                                                  onPress: () async {
                                                                    if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
                                                                      if (_formKey.currentState!.validate()) {
                                                                        print("Connection".tr);
                                                                        Get.back();
                                                                        await  controller.getDataNotifcationApi();
                                                                      }
                                                                    } else {
                                                                      print("No Connection".tr);
                                                                      GetSnackMsg(msg: "No Connection".tr, bgClr: kColorsRed, txClr: kColorsWhite).showTxt();
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
                                                  elevation: 2,
                                                  isScrollControlled: true,
                                                );
                                              },
                                              child: Padding(
                                                padding:  EdgeInsets.all(6.0),
                                                child: SvgPicture.asset(
                                                  "assets/Icons/Filter2_Icon_UIA.svg",
                                                  width: 16,
                                                  height: 16,

                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),
                                    SizedBox(
                                      height: 0.05.sh,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        transClosed!.where((notification) => notification.statusName != 'مقرؤة').length>0?Container(
                                            padding: EdgeInsets.only(left:12.r, right:12.r),
                                            child: Text('Search results'.tr+" "+controller.count.toString()+" " +"results".tr,
                                              style:  const TextStyle(color: kColorsPrimaryFont,fontSize: 14,fontWeight: FontWeight.w500),)
                                        ): SizedBox(),
                                      ],
                                    ),

                                    Expanded(
                                      child: ListView.builder(
                                          controller: controllerNotReade.scrollController,
                                          padding: EdgeInsets.symmetric(vertical: 10.r),
                                          itemCount: transClosed?.length,
                                          itemBuilder: (context, index) =>
                                              ItemNotifcationNotRead(transClosed?[index])),
                                    ),
                                    GetBuilder<NotifcationController>(
                                      init: NotifcationController(),
                                      builder: (Invitation) => Container(
                                        height: Invitation.isLoading ? 30.r : 0,
                                        color: Colors.transparent,

                                      ),
                                    ),


                                  ],
                                ),
                              onLoading: Center(
                                child: LoadingIndicatorWidget(),
                              ),
                              onEmpty: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 185.0.h,
                                      ),

                                      SizedBox(
                                        height: 7.0.h,
                                      ),
                                      Text(
                                        'There are no notifications'.tr + '!',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: kColorsLightBlack,
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 0.02.sh,
                          ),

                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right:  8.r,left: 8.r),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(left:8.r, right:8.r),
                                        child: Text(
                                          'Notification box'.tr,
                                          style:  const TextStyle(color: kColorsPrimaryFont,fontSize: 14,fontWeight: FontWeight.w500),)
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal:8.0.r),
                                      child: Container(
                                        height: 0.04.sh,
                                        width:  0.08.sw,
                                        decoration: BoxDecoration(color: kColorbackgroundCard, borderRadius: BorderRadius.circular(5.r)),
                                        child: InkWell(
                                          onTap: () {
                                            Get.bottomSheet(
                                              Container(
                                                margin: EdgeInsets.all(1.0.r),
                                                // height: .42.sh,
                                                height: 0.42.sh,
                                                width: 1.0.sw,
                                                decoration: BoxDecoration(color: kColorsWhite,
                                                  borderRadius: BorderRadius.only(topLeft:Radius.circular(30.r),topRight: Radius.circular(30.r)),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(),
                                                        Padding(
                                                          padding: EdgeInsets.all(3.0.r),
                                                          child: Text('Filter'.tr ,
                                                            style: const TextStyle(
                                                                fontSize: 16,
                                                                color: kColorsPrimaryFont),),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.all(16.0.r),
                                                          //child: Image.asset("assets/Icons/DirectionRight.png", width: 25, height: 25),
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
                                                                  padding:  EdgeInsets.all(3.0.r),
                                                                  child:    Image.asset(
                                                                    AssestData.clear,
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
                                                      padding: EdgeInsets.all(8.r),
                                                      child: Form(
                                                        key: _formKey,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: <Widget>[

                                                            GetBuilder<NotifcationController>(
                                                                init: NotifcationController(),
                                                                builder: (co) {
                                                                  return InkWell(
                                                                      onTap: () async {
                                                                        Get.dialog(
                                                                          LoadingIndicatorWidget(),
                                                                        );
                                                                        Get.back();
                                                                        onClickSessionsType(co, context, controller.typeFilterModel!.notifcationFilter);
                                                                      },
                                                                      child: CustomTextInput(

                                                                        iconEnd: Icon(Icons.keyboard_arrow_down, color: kColorsLightBlack,),
                                                                        textAlign: TextAlign.start,

                                                                        text: 'Search b'.tr,
                                                                        filled: true,
                                                                        isEnabled: false,
                                                                        isRequired: true,
                                                                        labelText:  'undefined'.tr,
                                                                        exText: 'undefined'.tr,
                                                                        textEditingController: controller.TypeFilterTextControll,
                                                                        styleText: const TextStyle(
                                                                          fontSize: 13,
                                                                          color: kColorsBlack,
                                                                        ),
                                                                        hintstyle: const TextStyle(
                                                                          fontSize: 12,
                                                                          color: kColorsLightBlackLow,
                                                                        ),
                                                                      ));
                                                                }),
                                                            SizedBox(
                                                              height: 0.02.sh,
                                                            ),
                                                            TextFieldWidget(
                                                              hint: 'the value'.tr,
                                                              text: 'the value'.tr,
                                                              edit: 1,
                                                              controller:controller.ValuaFilterTextControll,
                                                              requirement: true,
                                                              keyboardType: TextInputType.text,
                                                              color: kColorsDeepWhite,
                                                            ),



                                                            SizedBox(
                                                              height: 0.02.sh,
                                                            ),
                                                            CustomButton(
                                                              text: 'search'.tr,
                                                              isIconEnd: true,
                                                              IconEnd: SvgPicture.asset(
                                                                AssestData.left,
                                                                width: 24.r ,
                                                                height: 24.r ,
                                                                color: kColorsWhite,
                                                              ),
                                                              borderRadius: 10.r,
                                                              sizeHeight: 0.045.sh,
                                                              sizeWidth: 0.92.sw,
                                                              onPress: () async {
                                                                if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
                                                                  if (_formKey.currentState!.validate()) {
                                                                    print("Connection".tr);
                                                                    Get.back();
                                                                    await  controller.getDataNotifcationApi();
                                                                  }
                                                                } else {
                                                                  print("No Connection".tr);
                                                                  GetSnackMsg(msg: "No Connection".tr, bgClr: kColorsRed, txClr: kColorsWhite).showTxt();
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
                                              elevation: 2,
                                              isScrollControlled: true,
                                            );
                                          },
                                          child: Padding(
                                            padding:  EdgeInsets.all(6.0),
                                            child: SvgPicture.asset(
                                              "assets/Icons/Filter2_Icon_UIA.svg",
                                              width: 16,
                                              height: 16,

                                            ),
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
                            child: controller.obx((transClosed) =>Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(left:12.r, right:12.r),
                                        child: Text(
                                          'Search results'.tr+" "+controller.count.toString()+" " +"results".tr,
                                          style:  const TextStyle(color: kColorsPrimaryFont,fontSize: 14,fontWeight: FontWeight.w500),)
                                    ),
                                  ],
                                ),

                                Expanded(
                                  child: ListView.builder(
                                      controller: controller.scrollController,
                                      padding: EdgeInsets.symmetric(vertical: 10.r),
                                      itemCount: transClosed?.length,
                                      itemBuilder: (context, index) =>
                                          ItemNotifcation(transClosed?[index])),
                                ),
                                GetBuilder<NotifcationController>(
                                  init: NotifcationController(),
                                  builder: (Invitation) => Container(
                                    height: Invitation.isLoading ? 30.r : 0,
                                    color: Colors.transparent,

                                  ),
                                ),


                              ],
                            ),
                              onLoading: ListView.builder(
                                  padding: EdgeInsets.symmetric(vertical: 10.r),
                                  itemCount: 5,
                                  itemBuilder: (context, index) =>
                                      ItemNotifcationShimmer()),
                              onEmpty: Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 185.0.h,
                                      ),

                                      SizedBox(
                                        height: 7.0.h,
                                      ),
                                      Text(
                                        'There are no notifications'.tr + '!',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: kColorsLightBlack,
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:widget.IsHome==true? Container(
          width: double.infinity,
          height: 0.00.sh,)
            :CustomBottomNavBar(selectedMenu: MenuState.home),
      ),
    );
  }
  onClickSessionsType(
      NotifcationController controller,
      BuildContext context,
      List<NotifcationFilter> drop,
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
          child: GetBuilder<NotifcationController>(
              init: NotifcationController(),
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
                                child:    Image.asset(
                                  AssestData.clear,
                                  width: 20.r,
                                  height: 20.r,
                                  color: kColorsWhite,),),
                          ),
                        ],
                      ),
                    ),
                    ...drop.map((e) => InkWell(
                      onTap: () {
                        controller.onChanTypeFilter(e.name.toString(), e.id);
                        Get.back();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(1.0.r),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              side: BorderSide(
                                  width: 1,
                                  color:
                                  kColorsLightBlack.withOpacity(.3))),
                          child: Padding(
                            padding: EdgeInsets.all(8.0.r),
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
                    ))
                  ],
                );
              }),
        ),
      )
      ,
      elevation: 2,
      isScrollControlled: true,
    );
  }
}

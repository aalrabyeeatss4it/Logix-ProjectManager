

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Core/Utils/assets.dart';
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/ExchangeRequest/add_request_exchange_controller.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/PurchaseRequest/add_request_purchase_controller.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/PurchaseRequest/dilog_confirm_purchase.dart';
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
import 'package:projectmanagers/widget/custom_row_text.dart';
import 'package:projectmanagers/widget/custom_textfeild.dart';
import 'package:projectmanagers/widget/custom_tow_row_text.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';
import 'package:projectmanagers/widget/fileupload_widget.dart';
import 'package:projectmanagers/widget/input_text.dart';
import 'package:projectmanagers/widget/progisser_bar.dart';

class ItemsPurchaseRequestScreen extends StatefulWidget {

  var show_tabBar;
  ItemsPurchaseRequestScreen({this.show_tabBar});
  @override
  State<ItemsPurchaseRequestScreen> createState() => _ItemsPurchaseRequestScreenState();
}

class _ItemsPurchaseRequestScreenState extends State<ItemsPurchaseRequestScreen> {
  final controller = Get.put(AddPurchaseRequestController());
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
            title: 'طلب شراء مواد لمشروع'.tr,

            colorfont: kColorsWhite),
        drawer: Drawer(
          child: MenuWidgetDashboard(), // استخدام قائمة الـ Drawer المخصصة
        ),

        body: SafeArea(
          child: Container(
            color: kColorsWhite.withOpacity(0.1),
            margin:const EdgeInsets.only(top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[

                Expanded(
                  flex: 33,
                  child: ListView.builder(
                      // controller: controller.scrollController,
                      padding: EdgeInsets.symmetric(vertical: 10.r),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) =>
                          InkWell(

                            onTap: (){
                              // Get.toNamed(RoutingApp.item_add_request_purchase_screen);
                            },

                            child: Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left: 0.03.sw,right:  0.03.sw),
                                  child: Container(
                                    width: 343.w,
                                    decoration: BoxDecoration(
                                      color: kColorsWhite,
                                      borderRadius: BorderRadius.circular(10.r),
                                      border: Border.all(
                                          width: 0.4.r, color: kColorsLightBlackLow.withOpacity(0.4)),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 5.0.r, bottom: 5.r, left:isRtl!=true? 10.0.r:0.0, right:isRtl==true? 10.0.r:0.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 25,
                                                child: Text(
                                                 "اسم الصنف",
                                                  style:     TextStyle(
                                                    fontSize: 14,
                                                    color: kColorsPrimaryFont,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                ),
                                              ),
                                              Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                    width: 10,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      color: kColorsPrimaryFont.withOpacity(0.3),
                                                      borderRadius: BorderRadius.circular(8.r),
                                                    ),
                                                    padding: EdgeInsets.all(3),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        SvgPicture.asset("assets/Icon/edit.svg",width: 24,height: 24,color: kColorsPrimaryFont,),
                                                      ],
                                                    ),
                                                  )
                                              ),
                                              Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                  )
                                              ),

                                              Expanded(
                                                flex: 3,
                                                child: Container(
                                                  width: 10,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x3DEB5757),
                                                   borderRadius: BorderRadius.circular(8.r),
                                                  ),
                                                  padding: EdgeInsets.all(3),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      SvgPicture.asset("assets/Icon/deleted.svg",width:24,height: 24,color: kColorsRed,),
                                                    ],
                                                  ),
                                                )
                                              ),
                                          ],),
                                          SizedBox(
                                            height: 0.01.sh,
                                          ),
                                          TextFieldWidget(
                                            text: 'الكمية   '.tr,
                                            hint: '13.0'.tr,
                                            sizeFontText: 12,
                                            hintStyle: TextStyle(fontFamily: 'GraphikArabic',color:Colors.black.withOpacity(0.4) ,fontSize: 12),
                                            edit: 1,
                                            color: Color(0xffC8C9CC).withOpacity(0.3) ,
                                            colorborder: Color(0xffC8C9CC).withOpacity(0.3) ,
                                          ),

                                          SizedBox(
                                            height: 0.01.sh,
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
                          )



                  ),
                ),
                Expanded(flex: 1, child: SizedBox(height: 0.01.sh,),),
                Expanded(flex: 3, child:

                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomButton(
                      color: kColorsWhite,
                      borderRadius: 8.r,
                      sizeHeight: 0.045.sh,
                      sizeWidth: 0.41.sw,
                      text: 'إضافة المزيد'.tr,
                      isIconEnd: true,
                      IconEnd: SvgPicture.asset(
                        AssestData.left,
                        width: 24 ,
                        height: 24 ,
                        color: kColorsWhite,
                      ),
                      style: const TextStyle(
                        color: kColorsPrimaryFont,
                        fontSize: 14,
                        fontFamily: 'GraphikArabic',
                        fontWeight: FontWeight.w500,
                        height: 1.71,),
                      onPress: () async {
                       Get.back();

                      },
                    ), CustomButton(
                      color: kColorsPrimaryFont,
                      borderRadius: 8.r,
                      sizeHeight: 0.045.sh,
                      sizeWidth: 0.41.sw,
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
                  ],
                ),),
              ],
            ),
          ),
        ),
        bottomNavigationBar:   CustomBottomNavBar(selectedMenu: MenuState.home),

      );
  }
  onClickTypeMasroff(AddPurchaseRequestController controller, BuildContext context,       List<DataFilter> drop,) {
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
                child: GetBuilder<AddPurchaseRequestController>(
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


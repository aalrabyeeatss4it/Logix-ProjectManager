
import 'package:projectmanagers/Core/Utils/assets.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/RequestCovenant/item_request_covenant.dart';
import 'package:projectmanagers/Screen/dashboard/ElectronicServices/RequestCovenant/request_covenant_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Screen/MenuDrawer/menu_widget_dachbord.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'package:projectmanagers/widget/CustomSubmitDialog.dart';
import 'package:projectmanagers/widget/add_dilog.dart';
import 'package:projectmanagers/widget/buttm_navigator_bar.dart';
import 'package:projectmanagers/widget/customButton.dart';
import 'package:projectmanagers/widget/cutom_appbar.dart';

class RequestCovenantScreen extends StatefulWidget {

  var show_tabBar;
  RequestCovenantScreen({this.show_tabBar});
  @override
  State<RequestCovenantScreen> createState() => _RequestCovenantScreenState();
}

class _RequestCovenantScreenState extends State<RequestCovenantScreen> {
  final controller = Get.put(RequestCovenantController());
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
    return

      Scaffold(
        appBar:  MyAppBar(
            title: 'طلب تسوية عهدة'.tr,
            colorfont: kColorsWhite),
        drawer: Drawer(
          child: MenuWidgetDashboard(), // استخدام قائمة الـ Drawer المخصصة
        ),

        body: SafeArea(
          child: Container(
            color: kColorsWhite.withOpacity(0.1),
            margin:const EdgeInsets.only(top: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                  flex: 32,
                  child:  ListView.builder(
                      shrinkWrap: true,
                      itemCount:5,
                      itemBuilder: (context, index) =>
                          Column(
                            children: [
                              ItemRequestCovenant(),
                              SizedBox(
                                height: 0.01.sh,
                              ),
                            ],
                          )),
                ),
                Expanded(flex: 1, child: SizedBox(height: 0.01.sh,),),
                Expanded(flex: 3, child: CustomButton(
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
                  ),),

              ],
            ),
          ),
        ),
        bottomNavigationBar:   CustomBottomNavBar(selectedMenu: MenuState.home),
      );

  }
}

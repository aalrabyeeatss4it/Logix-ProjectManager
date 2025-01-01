
import 'package:projectmanagers/Screen/dashboard/KeeperCovenant/item_keeper_covenent.dart';
import 'package:projectmanagers/Screen/dashboard/KeeperCovenant/keeper_covenant_controller.dart';
import 'package:projectmanagers/Screen/dashboard/home/itemhome.dart';
import 'package:projectmanagers/widget/buttm_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return

      Scaffold(
        appBar:  MyAppBar(
            title: 'حافظة العهدة'.tr,
            colorfont: kColorsWhite, IsHome: true,),
        drawer: Drawer(
          child: MenuWidgetDashboard(), // استخدام قائمة الـ Drawer المخصصة
        ),
        backgroundColor: kColorsWhite,
        body: SafeArea(
          child: Container(
            color: kColorsWhite.withOpacity(0.1),
            margin:const EdgeInsets.only(top: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(RoutingApp.add_keeper_covenant_screen);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding:const EdgeInsets.only(right:  8,left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:4.0 ),
                              child: Container(
                                height: 0.05.sh,
                                width:  0.93.sw,
                                decoration: BoxDecoration(
                                    color: kColorsPrimaryFont,
                                    border: Border.all(width: 0.4,color:kColorsPrimaryFont ),
                                    borderRadius: BorderRadius.circular(5.r)

                                ),
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed(RoutingApp.add_keeper_covenant_screen);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.all(6.0),
                                        child: SvgPicture.asset(
                                          "assets/Icon/AddKeeper.svg",
                                          width: 24,
                                          height: 24,
                                          color: kColorsWhite,
                                        ),
                                      ),
                                      Text(
                                        'حافظة عهدة جديدة'.tr,
                                        style:
                                        TextStyle(fontFamily: 'GraphikArabic',color: kColorsWhite, fontSize: 16,fontWeight: FontWeight.w500),
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
                ),
                Expanded(
                  child:  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) =>
                          Column(
                            children: [
                              ItemKeeperCovenant(),
                              SizedBox(
                                height: 0.01.sh,
                              ),
                            ],
                          )),
                ),

              ],
            ),
          ),
        ),
      );

  }
}

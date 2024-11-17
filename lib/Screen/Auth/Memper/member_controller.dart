
import 'package:projectmanagers/Screen/Auth/Memper/member_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'package:projectmanagers/widget/progisser_bar.dart';
import '/Constants/Constants.dart';
import '/apiservice/api_service.dart';
import '/apiservice/checkInterNet.dart';
import '/apiservice/url.dart';
import '/router/route_constants.dart';

class MemberController extends GetxController with  StateMixin<MemberModel>{

  late TextEditingController memberIdTextController;


  @override
  void onInit() {
    memberIdTextController = TextEditingController(text: '');
    // TODO: implement onInit
    super.onInit();
  }
  memberApi() async{


    if (Get.find<CheckInterNet>().connectionInterNet.value != 0) {
      Get.dialog(Center(
        child: LoadingIndicatorWidget(),
      ));
      ApiService().postDataLogin(
          url: getFacility,
          body: {
            "MemberId": memberIdTextController.text.trim(),
          },
          header: {}
      ).then((value) { Get.back();
      if (value.statusCode == 200) {
        print('Request successful');

        print(value.data);
        MemberModel member_model = MemberModel.fromJson(value.data);
        if(member_model.success==true){
          stg.write(facilityName, member_model.data!.facility!.facilityName);
          stg.write(facilityName2, member_model.data!.facility!.facilityName2);
          stg.write(logo, member_model.data!.facility!.facilityLogo);
          stg.write(memberId,memberIdTextController.text.trim());
          Get.toNamed(RoutingApp.login_route);
          stg.write(OpenScreenMember, true);
          stg.write(OpenAppOne,true );
        }
        else{
          GetSnackMsg(msg: member_model.message.toString(),bgClr:kColorsRed, txClr: kColorsWhite).showTxt();
        }

      } else {
        GetSnackMsg(msg: 'هناك خطأ'.tr, bgClr: kColorsRed, txClr: kColorsWhite).showTxt();
      }
      });
      print("Connection".tr);
    }


    else {
      print('No internet connection '.tr);
      // Get.toNamed(RoutingApp.cheack_intrinet_screen);
      GetSnackMsg(msg: 'No internet connection '.tr,bgClr:kColorsRed ,txClr:kColorsWhite ).showTxt();
    }

  }
}
import 'dart:async';

import 'package:projectmanagers/Screen/Projects/ProjectsDetails/projects_details_model.dart';
import 'package:projectmanagers/apiservice/url.dart';
import 'package:projectmanagers/widget/progisser_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/apiservice/logout.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import '/apiservice/api_service.dart';

class ProjectsDetailsController extends GetxController with StateMixin<ProjectsDetailsModel> {

  late TextEditingController EmployeeNameTextControll;
  late TextEditingController EmaileTextControll;
  late TextEditingController TheNameTextControll;


  late TextEditingController OldPassowrdController;
  late TextEditingController NewPassowrdController;
  late TextEditingController ConfirmPassowrdController;

  RxBool OldPassowrdvisable = false.obs;
  RxBool NewPassowrdvisable = false.obs;
  RxBool ConfirmPassowrdvisable = false.obs;
  void onInit() async {
    super.onInit();
    EmployeeNameTextControll = TextEditingController(text: '');
    EmaileTextControll = TextEditingController(text: '');
    TheNameTextControll = TextEditingController(text: '');

    OldPassowrdController = TextEditingController(text: '');
    NewPassowrdController = TextEditingController(text: '');
    ConfirmPassowrdController = TextEditingController(text: '');

  }
  onClickVisableOldPassowrd(String txt) {
    if(txt==''){
    }
    else{
      OldPassowrdvisable.value = !OldPassowrdvisable.value;
    }
  }
  onClickVisableNewPassowrd(String txt) {
    if(txt==''){
    }
    else{
      NewPassowrdvisable.value = !NewPassowrdvisable.value;
    }
  }
  onClickVisableConfirmPassowrd(String txt) {
    if(txt==''){
    }
    else{
      ConfirmPassowrdvisable.value = !ConfirmPassowrdvisable.value;
    }
  }
    Future<void> Revrech({String? BranchName}) async{
      await getPrfile();
    }
    Future<void> getPrfile({String? BranchName}) async{
      String tokenn = stg.read(token).toString();
      print('Bearer ${stg.read(token)}');
      print("getPrfile");
      await ApiService().getData(urlgetPrfile, {'Authorization': 'Bearer ${stg.read(token)}'}).timeout(
          Duration(minutes: 1), onTimeout: () {
        throw TimeoutException('The connection has timed out, Please try again!');
      }).then((value) {
        change(null, status: RxStatus.loading());
        if (value.statusCode == 200) {
          print("startgetProjectsDetails");
          ProjectsDetailsModel? modelProjectsDetails = ProjectsDetailsModel.fromJson(value.data);
          print(value.data);
          change(modelProjectsDetails, status: RxStatus.success());
          initControllarr(modelProjectsDetails);
        }
        else if(value.statusCode == 401){
          GetSnackMsg(msg: 'Unauthorized access'.tr,bgClr:kColorsRed ,txClr:kColorsWhite ).showTxt();
          Get.put(LogOutController()).LogOut();
        }
        else {
          print('لم يتم إرجاع بيانات في شاشة بيانات المستخدم');
        }
      }
      );
      print("EndgetProjectsDetails");

    }


  void initControllarr(ProjectsDetailsModel modelProjectsDetails) {
    EmployeeNameTextControll = TextEditingController(text: modelProjectsDetails.dataProjectsDetails?.userFullname.toString());
    EmaileTextControll = TextEditingController(text: modelProjectsDetails.dataProjectsDetails?.userEmail.toString());
    TheNameTextControll = TextEditingController(text: modelProjectsDetails.dataProjectsDetails?.userName.toString());
  }

  ChangPassword() async{
    Get.dialog(Center(
      child: LoadingIndicatorWidget(),
    ));
    print({
      "UserName":"",
      "Password": NewPassowrdController.text.trim(),
      "MemberId": "",
    });

    await ApiService().postDataLogin(
        url: urlEditPassword,
        body: {
          "Password": NewPassowrdController.text.trim(),
        },
      header: {'Authorization': 'Bearer ${stg.read(token)}'},
    ).then((value) {
      print(' النتيجه: ${value.statusCode}');
      if (value.statusCode == 200) {
         Get.back();
         RusultPasswordModel? rusultPasswordModel = RusultPasswordModel.fromJson(value.data);
         print(value.data);
         stg.write(userPassword, rusultPasswordModel.dataRusultPasswor!.userPassword);
         GetSnackMsg(msg:rusultPasswordModel.message.toString(), bgClr: kColorsPrimaryFont, txClr: kColorsWhite).showTxt();
         ClereControllar();
        print(value.data);
      }
      else if(value.statusCode == 401){
        GetSnackMsg(msg: 'Unauthorized access'.tr,bgClr:kColorsRed ,txClr:kColorsWhite ).showTxt();
      }
      else {
        Get.back();
      }
    });

  }
  void ClereControllar() {
    OldPassowrdController.clear();
    NewPassowrdController.clear();
    ConfirmPassowrdController.clear();
  }
}
import 'dart:async';
import 'package:projectmanagers/Screen/ElectronicServices/RequestCovenant/request_covenant_model.dart';
import 'package:projectmanagers/apiservice/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/apiservice/logout.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import '/apiservice/api_service.dart';

class RequestCovenantController extends GetxController with StateMixin<RequestCovenantModel> {
  ScrollController scrollController = ScrollController();
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


    Future<void> Revrech({String? BranchName}) async{
      await getPrfile();
    }
    Future<void> getPrfile({String? BranchName}) async{
      try {
        String tokenn = stg.read(token).toString();
        print('Bearer ${stg.read(token)}');
        print("getPrfile");
        await ApiService().getData(urlgetPrfile, {'Authorization': 'Bearer ${stg.read(token)}'}).timeout(
            Duration(minutes: 1), onTimeout: () {
          throw TimeoutException('The connection has timed out, Please try again!');
        }).then((value) {
          change(null, status: RxStatus.loading());
          if (value.statusCode == 200) {
            print("startgetRequestCovenant");
            RequestCovenantModel? modelRequestCovenant = RequestCovenantModel.fromJson(value.data);
            print(value.data);
            change(modelRequestCovenant, status: RxStatus.success());

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
        print("EndgetRequestCovenant");
      } catch (e) {
        print(e.toString());
        // يمكنك إضافة معالجة أخطاء أكثر تفصيلًا إذا لزم الأمر
      }


    }



  void ClereControllar() {
    OldPassowrdController.clear();
    NewPassowrdController.clear();
    ConfirmPassowrdController.clear();
  }
}
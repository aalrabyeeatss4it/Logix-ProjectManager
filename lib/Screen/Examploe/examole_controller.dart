import 'dart:async';
import 'dart:convert';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Constants/kaye.dart';
import 'package:projectmanagers/DropDownLIst/Group_Msg_model.dart';
import 'package:projectmanagers/DropDownLIst/importance_degree_model.dart';
import 'package:projectmanagers/DropDownLIst/secret_degree_model.dart';
import 'package:projectmanagers/DropDownLIst/user_name_model.dart';
import 'package:projectmanagers/apiservice/api_service.dart';
import 'package:projectmanagers/apiservice/file_piker.dart';
import 'package:projectmanagers/apiservice/logout.dart';
import 'package:projectmanagers/apiservice/url.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'package:projectmanagers/widget/progisser_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ExamoleController extends GetxController {

  late UserNameModel? userNameModel ;

  RxBool Show = true.obs;
  changeShow(bool show){
    Show.value=show;
    print("Show changed to: $show");
    update(); // تأكد من تحديث الواجهة
    print("Show changed AFTER  update to: $show");
  }

  late TextEditingController UserFullNameController;
  late TextEditingController TheTopicController;
  late TextEditingController StatementController;



  RxInt UserFullNameID=0.obs;
  bool checkValue=false;
  //int? radio_email = 0;
  int? radio = 0;


  var itemstypSessions = [
    {"id": 1, "name":'حضور'}, {"id": 2, "name":'عن بعد' },
  ];



  onChangeUserFullName(String? text,int? id  ) {
    this.UserFullNameController.text = text!;
    this.UserFullNameID.value=id!;
  }

  // List<DataMemb> dateListMember = [];
  onClickRadiosms(int radio) {
    this.radio = radio;
    update();
  }
  onClickRadioEmail(int radio) {
    this.radio = radio;
    update();
  }


  RxBool valuefirst = false.obs;
  RxBool valuesecond = false.obs;

  int  Allow_Comment=0;
  onClickCheckbox(RxBool check) {
    this.valuefirst = check;
    update();
  }


  void onInit() async {
    // TODO: implement onInit

    TheTopicController = TextEditingController(text: '');
    StatementController = TextEditingController(text: '');
    UserFullNameController = TextEditingController(text: '');
    super.onInit();
  }
  Future<void> fetchData() async {
    await GetUserNameApi();
  }

  Future<void> GetUserNameApi() async{
    print("startgetSecretDegreeApi");
    await ApiService().getData(GetUserName
        ,{'Authorization': 'Bearer ${stg.read(token)}'} ).timeout(Duration(minutes:1),onTimeout : () {
      throw TimeoutException('The connection has timed out, Please try again!');
    }).then((value) {
      if (value.statusCode == 200) {
        print(value.data);
        userNameModel= UserNameModel.fromJson(value.data);
      }
      else if(value.statusCode == 401){
        GetSnackMsg(msg:'Unauthorized access'.tr,bgClr:kColorsRed,txClr:kColorsWhite).showTxt();
        Get.put(LogOutController()).LogOut();
      }
      else {
        print('لم يتم إرجاع بيانات  ');
      }
    }
    );
    print("EndGetUserNameApi");
  }

}

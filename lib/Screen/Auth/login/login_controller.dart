import 'dart:convert';
import 'package:projectmanagers/Screen/Auth/login/login_model.dart';
import 'package:projectmanagers/apiservice/api_service.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:projectmanagers/apiservice/url.dart';
import 'package:projectmanagers/router/route_constants.dart';
import 'package:projectmanagers/widget/progisser_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import 'login_screen.dart';

class LoginController extends GetxController with  StateMixin<LoginModel>{
late TextEditingController userTextController;
late TextEditingController passwordTextController;
late TextEditingController memberIdTextController;
RxBool passowrdvisable = false.obs;
bool checkValue=false;
//late LoginErrorModel loginErrorModel;
@override
void onInit() {
  userTextController =      TextEditingController(text: '');
  passwordTextController = TextEditingController(text: '');
  memberIdTextController = TextEditingController(text: stg.read(memberId)??'');

  // TODO: implement onInit
  super.onInit();
}
  onClickVisable(String txt) {
    if(txt==''){
    }
    else{
      passowrdvisable.value = !passowrdvisable.value;
    }
  }
  loginApi() async{
    try {
        Get.dialog(Center(
          child: LoadingIndicatorWidget(),
        ));
        print({
          "UserName": userTextController.text.trim(),
          "Password": passwordTextController.text.trim(),
          "MemberId": stg.read(memberId).toString(),
        });
        ApiService().postDataLogin(
            url: urlLogin,
            body: {
              "UserName": userTextController.text.trim(),
              "Password": passwordTextController.text.trim(),
              "MemberId": stg.read(memberId).toString(),
            },
            header: {}
        ).then((value) {
          if (value.statusCode == 200) {
            print('Request successful');
            Get.back();
            print(value.data);
            LoginModel loginModel = LoginModel.fromJson(value.data);
            if(loginModel.success==true){
              stg.write(token, loginModel.dataUser!.token);
              stg.write(userPassword, loginModel.dataUser!.sysUser!.userPassword.toString());
              print("userPassword="+stg.read(userPassword).toString());
              Get.offAllNamed(RoutingApp.dashboardRoute);
              stg.write(OpenScreenlogen, true);
              stg.write(OpenAppOne,true );
            }
            else{
              GetSnackMsg(msg: loginModel.message.toString(), bgClr: kColorsRed, txClr: kColorsWhite).showTxt();
            }

          } else {
            Get.back();
            GetSnackMsg(msg: 'Invalid login'.tr, bgClr: kColorsRed, txClr: kColorsWhite).showTxt();
          }
        });
        print("Connection".tr);



    } catch (e) {
      print(e.toString());
      // يمكنك إضافة معالجة أخطاء أكثر تفصيلًا إذا لزم الأمر
    }

  }
}



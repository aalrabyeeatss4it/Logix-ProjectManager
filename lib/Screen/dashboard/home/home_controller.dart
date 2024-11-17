import 'dart:async';
import 'dart:convert';

import 'package:projectmanagers/apiservice/api_service.dart';
import 'package:projectmanagers/apiservice/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Constants/kaye.dart';
import 'package:projectmanagers/Screen/dashboard/home/home_screen.dart';

class HomeController extends GetxController with StateMixin<StaticHomeModel> {
  late RxString CiuncilId="".obs;
  late bool show_tabB=true;
  late RxString memberTypeName="".obs;
  RxInt passowrdvisable = 0.obs;
   int? countStatic;
  @override
  void onInit() async{

    // TODO: implement onInit
    super.onInit();


  }

  ChangeColor selectColor = ChangeColor.propertyManagement;
  onChangeColor(ChangeColor changeColor) {
    selectColor = changeColor;
    update();
  }
  Future<void> Revrech({String? BranchName}) async{
    await GetTransCountApi();
  }
  int? selectedCategoryIndex = 0;
  Future<void> GetTransCountApi() async{
    change(null, status: RxStatus.loading());
    print("startGetTransCountApi");
    await ApiService().getData(GetMailBoxCount
        ,{'Authorization': 'Bearer ${stg.read(token)}'} ).timeout(Duration(minutes:1),onTimeout : () {
      throw TimeoutException('The connection has timed out, Please try again!');
    }).then((value) {

      if (value.statusCode == 200) {

        StaticHomeModel  staticHomeModel= StaticHomeModel.fromJson(value.data);
        countStatic= value.data['count'];
        update();
        print("countStatic="+countStatic.toString());
        // count=staticHomeModel.count;
        print(value.data);
        change(staticHomeModel, status: RxStatus.success());

      }
      change(null, status: RxStatus.empty());
    }
    );
    print("EndGetTransCountApi");
  }






}
class StaticHomeModel {
  int? count;

  StaticHomeModel({this.count});

  StaticHomeModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    return data;
  }
}

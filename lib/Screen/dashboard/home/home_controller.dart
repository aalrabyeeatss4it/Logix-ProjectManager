import 'dart:async';
import 'dart:convert';

import 'package:projectmanagers/apiservice/api_service.dart';
import 'package:projectmanagers/apiservice/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Constants/kaye.dart';
import 'package:projectmanagers/Screen/dashboard/home/home_screen.dart';

class HomeController extends GetxController with StateMixin{
  late RxString CiuncilId="".obs;
  late bool show_tabB=true;
  late RxString memberTypeName="".obs;
  RxInt passowrdvisable = 0.obs;
   int? countStatic;
  int? selectedCategoryIndex = 0;
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








}


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
  onSelectCategory({required int? ind,required String? id}) {

      if (ind == 0) {
        stg.write(AppMapKey.value, id);
        // Get.toNamed('${RoutingApp.sessionsScreen}?${AppMapKey.value}=$id');

      } else if (ind == 1) {
        show_tabB=true;
        // Get.toNamed('${RoutingApp.committee_members_screen}?${AppMapKey.value}=$id & ${AppMapKey.ShowTabBar}=$show_tabB  ');
        stg.write(AppMapKey.value, id);
      } else if (ind == 2) {
        show_tabB=true;
        stg.write(AppMapKey.value, id);
        // Get.toNamed('${RoutingApp.regulations_screen}?${AppMapKey.value}=$id & ${AppMapKey.ShowTabBar}=$show_tabB  ');

      }


    selectedCategoryIndex = ind;
    update();
  }
}


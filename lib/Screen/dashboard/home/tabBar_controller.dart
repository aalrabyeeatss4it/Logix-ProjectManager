
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TabBarController extends GetxController with  GetSingleTickerProviderStateMixin{
  late TabController controllerTabBarReferral;
  int selectedIndexReferral = 0;
  onselectedIndex(int select) {
    controllerTabBarReferral.animateTo( selectedIndexReferral += 1);
    selectedIndexReferral = select+= 1;
    update();
  }
  onselectedIndexBevor(int select) {
    controllerTabBarReferral.animateTo( selectedIndexReferral -= 1);
    selectedIndexReferral = select-= 1;
    update();
  }

  void onInit() async{
    super.onInit();
    controllerTabBarReferral = TabController(vsync: this, length: 2, initialIndex: 0);


  }

  @override
  void dispose() {
    controllerTabBarReferral.dispose();
    super.dispose();
  }

}


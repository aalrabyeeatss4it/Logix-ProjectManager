
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class TabBarFinancialInformationController extends GetxController with  GetSingleTickerProviderStateMixin{
  late TabController controllerTabBar;
  int selectedIndex = 0;
  onselectedIndex(int select) {
    controllerTabBar.animateTo( selectedIndex += 1);
    selectedIndex = select+= 1;
    update();
  }
  onselectedIndexBevor(int select) {
    controllerTabBar.animateTo( selectedIndex -= 1);
    selectedIndex = select-= 1;
    update();
  }

  void onInit() async{
    super.onInit();
    controllerTabBar = TabController(vsync: this, length: 3, initialIndex: 0);

  }

  @override
  void dispose() {
    controllerTabBar.dispose();
    super.dispose();
  }

}


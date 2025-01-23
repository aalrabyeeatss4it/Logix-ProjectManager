import 'dart:async';
import 'dart:convert';
import 'package:projectmanagers/Constants/kaye.dart';
import 'package:projectmanagers/Screen/Notifcation/notifcation_model.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/apiservice/logout.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import '/apiservice/api_service.dart';
import '/apiservice/url.dart';

class NotifcationReadController extends GetxController with StateMixin<List<DataNotifcationNotRead>> {
  ScrollController scrollController = ScrollController();
  List<DataNotifcationNotRead>? dateList = [];
  bool isLoading = false;
  var count;
  NotifcationNotReadModel? notifcationNotReadModel ;
  late TextEditingController ValuaFilterTextControll;
  late TextEditingController TypeFilterTextControll;
  Future<void> Revrech() async{

    scrollController!.addListener(() async {
      if (scrollController!.position.pixels == scrollController!.position.maxScrollExtent) {
        if (notifcationNotReadModel!.paginationNotRead!.hasNextPage!) {
          onLoading(true);
          await getDataNotifcationApi(nextPage: notifcationNotReadModel!.paginationNotRead!.nextPage);
          print(notifcationNotReadModel!.paginationNotRead!.currentPage);
          print('Hotheefa1');
        }
      }
    });

    await  getDataNotifcationApi();
    ever(Get.find<CheckInterNet>().connectionInterNet, (_) async{
      if (notifcationNotReadModel == null &&
          Get.find<CheckInterNet>().connectionInterNet.value != 0) {
        await   getDataNotifcationApi();
      }
    });
  }
  int? TypeFilterId;
  void onInit() async {
    super.onInit();
    TypeFilterTextControll = TextEditingController(text: '');
    ValuaFilterTextControll = TextEditingController(text: '');
  }
  onLoading(bool load) {
    isLoading = load;
    update();
  }



  Future<void> getDataNotifcationApi({ int? nextPage}) async{
    try {
      if(nextPage==null){
        change(null, status: RxStatus.loading());
      }
      await ApiService().getData(GetNotifcationNotRead+'?page=${nextPage??'1'}&size=10&filterID=${TypeFilterId??'0'}&filterString=${ValuaFilterTextControll.text.trim().toString()??'//'}'
          ,{'Authorization': 'Bearer ${stg.read(token)}'} ).timeout(Duration(minutes: 1),onTimeout : () {
        throw TimeoutException('The connection has timed out, Please try again!');
      }).then((value) {
        isLoading=false;
        if(value.statusCode==200) {

          // Output: 107
          print(value.data);
          notifcationNotReadModel = NotifcationNotReadModel.fromJson(value.data);
          count=notifcationNotReadModel!.paginationNotRead!.count.toString();
          print("count= "+count.toString());
          if(nextPage==null){
            dateList!.clear();
          }
          dateList!.addAll(notifcationNotReadModel!.dataNotifcationNotRead!);
          if(dateList!.isNotEmpty) {
            change(dateList, status: RxStatus.success());
          }
          else{
            change(null, status: RxStatus.empty());
          }
        }
        else if(value.statusCode == 401){
          GetSnackMsg(msg: 'Unauthorized access'.tr,bgClr:kColorsRed ,txClr:kColorsWhite                         ).showTxt();
          Get.put(LogOutController()).LogOut();
        }
      }
      );
    } catch (e) {
      print(e.toString());
      // يمكنك إضافة معالجة أخطاء أكثر تفصيلًا إذا لزم الأمر
    }


  }


}
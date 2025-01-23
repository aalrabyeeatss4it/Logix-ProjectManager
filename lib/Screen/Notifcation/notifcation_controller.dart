import 'dart:async';
import 'dart:convert';
import 'package:projectmanagers/Constants/kaye.dart';
import 'package:projectmanagers/Screen/Notifcation/notifcation_filter_model.dart';
import 'package:projectmanagers/Screen/Notifcation/notifcation_model.dart';
import 'package:projectmanagers/apiservice/checkInterNet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/apiservice/logout.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import '/apiservice/api_service.dart';
import '/apiservice/url.dart';

class NotifcationController extends GetxController with StateMixin<List<DataNotifcation>> {
  ScrollController scrollController = ScrollController();
  List<DataNotifcation>? dateList = [];
  bool isLoading = false;
  var count;
  NotifcationModel? inboxModel ;
  NotifcationFilterModel? typeFilterModel ;
  late TextEditingController TypeFilterTextControll;
  late TextEditingController ValuaFilterTextControll;
  int? TypeFilterId;
  void onInit() async {
    super.onInit();
    TypeFilterTextControll = TextEditingController(text: '');
    ValuaFilterTextControll = TextEditingController(text: '');
  }
  @override
  void onReady() {
    print("ready");
    super.onReady();
  }
  var TypeOptions = [
    {"id": 1, "name": 'غير محدد'.tr},
    {"id": 2, "name": 'رقم المعاملة'.tr},
    {"id": 3, "name": 'الموضوع'.tr},
    {"id": 4, "name": 'التاريخ'.tr},
    {"id": 5, "name": 'الموظف'.tr},
  ];
  onChanTypeFilter(String text,int ID ) {
    this.TypeFilterTextControll.text = text;
    this.TypeFilterId=ID;
    print("ID="+ID.toString());
  }
  Future<void> Revrech() async{
    await getTypeFilter();
    scrollController!.addListener(() async {
      if (scrollController!.position.pixels == scrollController!.position.maxScrollExtent) {
        if (inboxModel!.pagination!.hasNextPage!) {
          onLoading(true);
          await getDataNotifcationApi(nextPage: inboxModel!.pagination!.nextPage);
          print(inboxModel!.pagination!.currentPage);
          print('Hotheefa1');
        }
      }
    });

    await  getDataNotifcationApi();
    ever(Get.find<CheckInterNet>().connectionInterNet, (_) async{
      if (inboxModel == null &&
          Get.find<CheckInterNet>().connectionInterNet.value != 0) {
        await   getDataNotifcationApi();
      }
    });
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
      await ApiService().getData(GetNotifcation+'?page=${nextPage??'1'}&size=10&filterID=${TypeFilterId??'0'}&filterString=${ValuaFilterTextControll.text.trim().toString()??'//'}'
          ,{'Authorization': 'Bearer ${stg.read(token)}'} ).timeout(Duration(minutes: 1),onTimeout : () {
        throw TimeoutException('The connection has timed out, Please try again!');
      }).then((value) {
        isLoading=false;
        if(value.statusCode==200) {

          // Output: 107
          print(value.data);
          inboxModel = NotifcationModel.fromJson(value.data);
          count=inboxModel!.pagination!.count.toString();
          print("count= "+count.toString());
          if(nextPage==null){
            dateList!.clear();
          }
          dateList!.addAll(inboxModel!.dataNotifcation!);
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
 getTypeFilter() {
    try {
      var jsonOptions = jsonEncode(TypeOptions);
      List<dynamic> jsonList = jsonDecode(jsonOptions);
      List<Map<String, dynamic>> jsonMapList = jsonList.cast<Map<String, dynamic>>();
      Map<String, dynamic> jsonDataMap = {'data': jsonMapList};
      typeFilterModel = NotifcationFilterModel.fromJson(jsonDataMap);
    } catch (e) {
      print(e.toString());
      // يمكنك إضافة معالجة أخطاء أكثر تفصيلًا إذا لزم الأمر
    }

  }

}
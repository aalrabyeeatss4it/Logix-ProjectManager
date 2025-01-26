import 'dart:async';
import 'dart:convert';
import 'package:projectmanagers/apiservice/url.dart';
import 'package:projectmanagers/widget/progisser_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/apiservice/logout.dart';
import 'package:projectmanagers/widget/CustomSnackBar.dart';
import '/apiservice/api_service.dart';
import 'filter_model.dart';
import 'completion_rate_report_model.dart';

class CompletionRateReportController extends GetxController with StateMixin<CompletionRateReportModel> {
  ScrollController scrollController = ScrollController();





  late TextEditingController TypeFilterTextControll;
  var TypeOptions = [
    {"id": 1, "name": 'غير محدد'.tr},
    {"id": 2, "name": 'رقم المعاملة'.tr},
    {"id": 3, "name": 'الموضوع'.tr},
    {"id": 4, "name": 'التاريخ'.tr},
    {"id": 5, "name": 'الموظف'.tr},
  ];
  int? TypeFilterId;


  FilterModel? typeFilterModel ;

  void onInit() async {
    super.onInit();
    TypeFilterTextControll = TextEditingController(text: '');


  }
  onChanTypeFilter(String text,int ID ) {
    this.TypeFilterTextControll.text = text;
    this.TypeFilterId=ID;
    print("ID="+ID.toString());
  }

    Future<void> Revrech({String? BranchName}) async{
      await getTypeFilter();
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
            print("startgetCompletionRateReport");
            CompletionRateReportModel? modelCompletionRateReport = CompletionRateReportModel.fromJson(value.data);
            print(value.data);
            change(modelCompletionRateReport, status: RxStatus.success());

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
        print("EndgetCompletionRateReport");
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
      typeFilterModel =  FilterModel.fromJson(jsonDataMap);
    } catch (e) {
      print(e.toString());
      // يمكنك إضافة معالجة أخطاء أكثر تفصيلًا إذا لزم الأمر
    }

  }

  void ClereControllar() {

  }
}
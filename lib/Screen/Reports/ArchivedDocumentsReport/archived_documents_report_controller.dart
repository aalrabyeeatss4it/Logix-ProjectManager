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
import 'archived_documents_report_model.dart';
import 'filter_model.dart';

class ArchivedDocumentsReportController extends GetxController with StateMixin<ArchivedDocumentsReportModel> {
  ScrollController scrollController = ScrollController();





  late TextEditingController TypeFilterTextControll;
  int? TypeFilterId;


  FilterModel? typeFilterModel ;

  var TypeOptions = [
    {"id": 1, "name": 'غير محدد'.tr},
    {"id": 2, "name": 'رقم المعاملة'.tr},
    {"id": 3, "name": 'الموضوع'.tr},
    {"id": 4, "name": 'التاريخ'.tr},
    {"id": 5, "name": 'الموظف'.tr},
  ];
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
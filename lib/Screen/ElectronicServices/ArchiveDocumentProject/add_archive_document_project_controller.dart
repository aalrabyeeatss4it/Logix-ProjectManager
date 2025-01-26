import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../KeeperCovenant/AddKeeperCovenant/filter_model.dart';
import '/apiservice/api_service.dart';
import 'add_archive_document_project_model.dart';

class AddArchiveDocumentProjectController extends GetxController with StateMixin<AddArchiveDocumentProjectModel> {

  late TextEditingController FilterNameController;
  late TextEditingController searchCustomerController;

  RxBool OldPassowrdvisable = false.obs;
  RxBool NewPassowrdvisable = false.obs;
  RxBool ConfirmPassowrdvisable = false.obs;
  FilterModel? filterModel;
  RxInt FilterNameID = 0.obs;
  var TypeOptions = [
    {"id": 1, "name": 'غير محدد'},
    {"id": 2, "name": "فاتورة شراء"},
    {"id": 3, "name": "فاتورة مبيعات"},
    {"id": 4, "name":  "سند قبض"},
    {"id": 5, "name":  "سند صرف"},
  ];
  void onInit() async {
    super.onInit();
    FilterNameController = TextEditingController(text: '');
    searchCustomerController = TextEditingController(text: '');
  }
  onChangeCustomerName(String? text, int? id) {
    this.FilterNameController.text = text!;
    this.FilterNameID.value = id!;
  }
 getTypeFilter() {
    try {
      var jsonOptions = jsonEncode(TypeOptions);
      List<dynamic> jsonList = jsonDecode(jsonOptions);
      List<Map<String, dynamic>> jsonMapList = jsonList.cast<Map<String, dynamic>>();
      Map<String, dynamic> jsonDataMap = {'data': jsonMapList};
      filterModel = FilterModel.fromJson(jsonDataMap);
      FilterNameController.text=filterModel!.dataFilter.first.name;
    } catch (e) {
      print(e.toString());
      // يمكنك إضافة معالجة أخطاء أكثر تفصيلًا إذا لزم الأمر
    }
  }



}
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectmanagers/Constants/Constants.dart';
import 'package:projectmanagers/Screen/Projects/ProjectsDetails/TasksPerformed/tasks_performed_model.dart';


class TasksPerformedController extends GetxController with StateMixin<TasksPerformedModel>{
int? TransactiID ;







late TextEditingController SideController;
late TextEditingController searchController;

onChanSideFilter(String text,int? ID ) {
  this.SideController.text = text;
  this.TypeSideId=ID;
  print("ID="+ID.toString());
}


  int? TypeSideId;

  RxInt UserFullID=0.obs;
TypeFilterModel? typeFilterModel ;


var TypeOptions = [
  {"id": 1, "name": 'غير محدد'.tr},
  {"id": 2, "name": 'رقم المعاملة'.tr},
  {"id": 3, "name": 'الموضوع'.tr},
  {"id": 4, "name": 'التاريخ'.tr},
  {"id": 5, "name": 'الموظف'.tr},
];

  RxBool valuefirst = false.obs;
  RxBool valuesecond = false.obs;

  int  Allow_Comment=0;
  onClickCheckbox(RxBool check) {
    this.valuefirst = check;
    update();
  }


  void onInit() async {
    // TODO: implement onInit

    SideController=TextEditingController(text: '');
    searchController=TextEditingController(text: '');

    super.onInit();
    getTypeFilter();
    TransactiID = stg.read(TransacID);
  }
getTypeFilter() {
  var jsonOptions = jsonEncode(TypeOptions);
  List<dynamic> jsonList = jsonDecode(jsonOptions);
  List<Map<String, dynamic>> jsonMapList = jsonList.cast<Map<String,dynamic>>();
  Map<String, dynamic> jsonDataMap = {'data': jsonMapList};
  typeFilterModel = TypeFilterModel.fromJson(jsonDataMap);
}
}

class TypeFilterModel {
  TypeFilterModel({
    required this.typeFilter,
  });
  late final List<TypeFilter> typeFilter;

  TypeFilterModel.fromJson(Map<String, dynamic> json){
    typeFilter = List.from(json['data']).map((e)=>TypeFilter.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = typeFilter.map((e)=>e.toJson()).toList();
    return _data;
  }

}

class TypeFilter {
  TypeFilter({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  TypeFilter.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}
class DepartmentModel {
  bool? success;
  List<DataDepartment>? dataDepartment;
  String? message;

  DepartmentModel({this.success, this.dataDepartment, this.message});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      dataDepartment = <DataDepartment>[];
      json['data'].forEach((v) {
        dataDepartment!.add(new DataDepartment.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.dataDepartment != null) {
      data['data'] = this.dataDepartment!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class DataDepartment {
  int? id;
  String? catName;

  DataDepartment({this.id, this.catName});

  DataDepartment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catName = json['catName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['catName'] = this.catName;
    return data;
  }
}

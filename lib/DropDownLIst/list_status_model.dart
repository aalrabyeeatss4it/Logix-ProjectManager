class ListStatusModel {
  bool? success;
  List<DataListStatus>? dataListStatus;
  String? message;

  ListStatusModel({this.success, this.dataListStatus, this.message});

  ListStatusModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      dataListStatus = <DataListStatus>[];
      json['data'].forEach((v) {
        dataListStatus!.add(new DataListStatus.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.dataListStatus != null) {
      data['data'] = this.dataListStatus!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class DataListStatus {
  int? code;
  String? name;
  int? id;
  int? catagoriesId;
  bool? isdel;
  int? userId;
  String? sortNo;
  String? note;
  String? name2;

  DataListStatus(
      {this.code,
        this.name,
        this.id,
        this.catagoriesId,
        this.isdel,
        this.userId,
        this.sortNo,
        this.note,
        this.name2});

  DataListStatus.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    id = json['id'];
    catagoriesId = json['catagoriesId'];
    isdel = json['isdel'];
    userId = json['userId'];
    sortNo = json['sortNo'];
    note = json['note'];
    name2 = json['name2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['id'] = this.id;
    data['catagoriesId'] = this.catagoriesId;
    data['isdel'] = this.isdel;
    data['userId'] = this.userId;
    data['sortNo'] = this.sortNo;
    data['note'] = this.note;
    data['name2'] = this.name2;
    return data;
  }
}

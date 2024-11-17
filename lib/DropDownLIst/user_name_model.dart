class UserNameModel {
  bool? success;
  List<DataUserName>? dataUserName;
  String? message;

  UserNameModel({this.success, this.dataUserName, this.message});

  UserNameModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      dataUserName = <DataUserName>[];
      json['data'].forEach((v) {
        dataUserName!.add(new DataUserName.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.dataUserName != null) {
      data['data'] = this.dataUserName!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class DataUserName {
  int? userId;
  String? userFullname;

  DataUserName({this.userId, this.userFullname});

  DataUserName.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userFullname = json['userFullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userFullname'] = this.userFullname;
    return data;
  }
}

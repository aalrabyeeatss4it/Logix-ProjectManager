class GroupMsgModel {
  bool? success;
  List<Data>? data;
  String? message;

  GroupMsgModel({this.success, this.data, this.message});

  GroupMsgModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? groupMsgName;
  int? createdBy;
  String? createdOn;
  int? modifiedBy;
  String? modifiedOn;
  bool? isDeleted;
  String? userIds;
  bool? isActive;

  Data(
      {this.id,
        this.groupMsgName,
        this.createdBy,
        this.createdOn,
        this.modifiedBy,
        this.modifiedOn,
        this.isDeleted,
        this.userIds,
        this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupMsgName = json['groupMsgName'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    modifiedBy = json['modifiedBy'];
    modifiedOn = json['modifiedOn'];
    isDeleted = json['isDeleted'];
    userIds = json['userIds'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['groupMsgName'] = this.groupMsgName;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedOn'] = this.modifiedOn;
    data['isDeleted'] = this.isDeleted;
    data['userIds'] = this.userIds;
    data['isActive'] = this.isActive;
    return data;
  }
}

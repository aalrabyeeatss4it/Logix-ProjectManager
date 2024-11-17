class LoginModel {
  bool? success;
  DataLogin? dataLogin;
  String? message;

  LoginModel({this.success, this.dataLogin, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    dataLogin = json['data'] != null ? new DataLogin.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.dataLogin != null) {
      data['data'] = this.dataLogin!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class DataLogin {
  SysUser? sysUser;
  String? erpUrl;
  String? token;

  DataLogin({this.sysUser, this.erpUrl, this.token});

  DataLogin.fromJson(Map<String, dynamic> json) {
    sysUser =
    json['sysUser'] != null ? new SysUser.fromJson(json['sysUser']) : null;
    erpUrl = json['erpUrl'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sysUser != null) {
      data['sysUser'] = this.sysUser!.toJson();
    }
    data['erpUrl'] = this.erpUrl;
    data['token'] = this.token;
    return data;
  }
}

class SysUser {
  int? userId;
  String? userFullname;
  String? userEmail;
  String? userName;
  String? userPassword;
  int? userTypeId;
  int? depId;
  String? depIdFrom;
  Null? depIdTo;
  int? empId;
  int? enable;
  String? groupsId;
  Null? createdBy;
  String? createdOn;
  Null? modifiedBy;
  String? modifiedOn;
  bool? isDeleted;
  String? empCode;
  String? pxUser;
  Null? userFullname2;
  String? ssoToken;
  String? ssoTokenExpiryDate;

  SysUser(
      {this.userId,
        this.userFullname,
        this.userEmail,
        this.userName,
        this.userPassword,
        this.userTypeId,
        this.depId,
        this.depIdFrom,
        this.depIdTo,
        this.empId,
        this.enable,
        this.groupsId,
        this.createdBy,
        this.createdOn,
        this.modifiedBy,
        this.modifiedOn,
        this.isDeleted,
        this.empCode,
        this.pxUser,
        this.userFullname2,
        this.ssoToken,
        this.ssoTokenExpiryDate});

  SysUser.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userFullname = json['userFullname'];
    userEmail = json['userEmail'];
    userName = json['userName'];
    userPassword = json['userPassword'];
    userTypeId = json['userTypeId'];
    depId = json['depId'];
    depIdFrom = json['depIdFrom'];
    depIdTo = json['depIdTo'];
    empId = json['empId'];
    enable = json['enable'];
    groupsId = json['groupsId'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    modifiedBy = json['modifiedBy'];
    modifiedOn = json['modifiedOn'];
    isDeleted = json['isDeleted'];
    empCode = json['empCode'];
    pxUser = json['pxUser'];
    userFullname2 = json['userFullname2'];
    ssoToken = json['ssoToken'];
    ssoTokenExpiryDate = json['ssoTokenExpiryDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userFullname'] = this.userFullname;
    data['userEmail'] = this.userEmail;
    data['userName'] = this.userName;
    data['userPassword'] = this.userPassword;
    data['userTypeId'] = this.userTypeId;
    data['depId'] = this.depId;
    data['depIdFrom'] = this.depIdFrom;
    data['depIdTo'] = this.depIdTo;
    data['empId'] = this.empId;
    data['enable'] = this.enable;
    data['groupsId'] = this.groupsId;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedOn'] = this.modifiedOn;
    data['isDeleted'] = this.isDeleted;
    data['empCode'] = this.empCode;
    data['pxUser'] = this.pxUser;
    data['userFullname2'] = this.userFullname2;
    data['ssoToken'] = this.ssoToken;
    data['ssoTokenExpiryDate'] = this.ssoTokenExpiryDate;
    return data;
  }
}



/*
class LoginErrorModel {
  LoginErrorModel({
    required this.message,
  });
  late final String message;

  LoginErrorModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    return _data;
  }
}*/

class UpdatePlaneProjectModel {
  bool? success;
  DataUpdatePlaneProject? dataUpdatePlaneProject;
  String? message;

  UpdatePlaneProjectModel({this.success, this.dataUpdatePlaneProject, this.message});

  UpdatePlaneProjectModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    dataUpdatePlaneProject = json['data'] != null ? new DataUpdatePlaneProject.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.dataUpdatePlaneProject != null) {
      data['data'] = this.dataUpdatePlaneProject!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class DataUpdatePlaneProject {
  int? userId;
  String? userFullname;
  String? userEmail;
  String? userName;
  String? userPassword;
  int? userTypeId;
  int? userPkId;
  bool? isdel;
  String? branchsId;
  int? empId;
  int? enable;
  String? groupsId;
  String? dashboardWidget;
  bool? isupdate;
  int? deptId;
  int? location;
  int? facilityId;
  String? empPhoto;
  String? mobile;
  String? signature;
  String? groupName;
  String? empCode2;
  String? ips;
  Null? timeFrom;
  Null? timeTo;
  String? accTransfer;
  String? empName2;
  String? braName;
  int? salesType;
  Null? whTransactionType;
  Null? isDeleted;
  String? modifiedOn;
  int? modifiedBy;
  Null? createdOn;
  Null? createdBy;
  String? facilityName;
  String? facilityName2;
  int? managerId;
  int? cusId;
  Null? cusCode;
  Null? cusName;
  Null? connectionId;
  Null? supId;
  Null? userPhoto;
  Null? projectsId;
  bool? isAgree;
  String? braName2;
  bool? twoFactor;
  int? twoFactorType;
  Null? candId;
  String? otpExpiry;
  String? otp;
  String? lastLogin;
  int? statusId;

  DataUpdatePlaneProject(
      {this.userId,
        this.userFullname,
        this.userEmail,
        this.userName,
        this.userPassword,
        this.userTypeId,
        this.userPkId,
        this.isdel,
        this.branchsId,
        this.empId,
        this.enable,
        this.groupsId,
        this.dashboardWidget,
        this.isupdate,
        this.deptId,
        this.location,
        this.facilityId,
        this.empPhoto,
        this.mobile,
        this.signature,
        this.groupName,
        this.empCode2,
        this.ips,
        this.timeFrom,
        this.timeTo,
        this.accTransfer,
        this.empName2,
        this.braName,
        this.salesType,
        this.whTransactionType,
        this.isDeleted,
        this.modifiedOn,
        this.modifiedBy,
        this.createdOn,
        this.createdBy,
        this.facilityName,
        this.facilityName2,
        this.managerId,
        this.cusId,
        this.cusCode,
        this.cusName,
        this.connectionId,
        this.supId,
        this.userPhoto,
        this.projectsId,
        this.isAgree,
        this.braName2,
        this.twoFactor,
        this.twoFactorType,
        this.candId,
        this.otpExpiry,
        this.otp,
        this.lastLogin,
        this.statusId});

  DataUpdatePlaneProject.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userFullname = json['userFullname'];
    userEmail = json['userEmail'];
    userName = json['userName'];
    userPassword = json['userPassword'];
    userTypeId = json['userTypeId'];
    userPkId = json['userPkId'];
    isdel = json['isdel'];
    branchsId = json['branchsId'];
    empId = json['empId'];
    enable = json['enable'];
    groupsId = json['groupsId'];
    dashboardWidget = json['dashboardWidget'];
    isupdate = json['isupdate'];
    deptId = json['deptId'];
    location = json['location'];
    facilityId = json['facilityId'];
    empPhoto = json['empPhoto'];
    mobile = json['mobile'];
    signature = json['signature'];
    groupName = json['groupName'];
    empCode2 = json['empCode2'];
    ips = json['ips'];
    timeFrom = json['timeFrom'];
    timeTo = json['timeTo'];
    accTransfer = json['accTransfer'];
    empName2 = json['empName2'];
    braName = json['braName'];
    salesType = json['salesType'];
    whTransactionType = json['whTransactionType'];
    isDeleted = json['isDeleted'];
    modifiedOn = json['modifiedOn'];
    modifiedBy = json['modifiedBy'];
    createdOn = json['createdOn'];
    createdBy = json['createdBy'];
    facilityName = json['facilityName'];
    facilityName2 = json['facilityName2'];
    managerId = json['managerId'];
    cusId = json['cusId'];
    cusCode = json['cusCode'];
    cusName = json['cusName'];
    connectionId = json['connectionId'];
    supId = json['supId'];
    userPhoto = json['userPhoto'];
    projectsId = json['projectsId'];
    isAgree = json['isAgree'];
    braName2 = json['braName2'];
    twoFactor = json['twoFactor'];
    twoFactorType = json['twoFactorType'];
    candId = json['candId'];
    otpExpiry = json['otpExpiry'];
    otp = json['otp'];
    lastLogin = json['lastLogin'];
    statusId = json['statusId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userFullname'] = this.userFullname;
    data['userEmail'] = this.userEmail;
    data['userName'] = this.userName;
    data['userPassword'] = this.userPassword;
    data['userTypeId'] = this.userTypeId;
    data['userPkId'] = this.userPkId;
    data['isdel'] = this.isdel;
    data['branchsId'] = this.branchsId;
    data['empId'] = this.empId;
    data['enable'] = this.enable;
    data['groupsId'] = this.groupsId;
    data['dashboardWidget'] = this.dashboardWidget;
    data['isupdate'] = this.isupdate;
    data['deptId'] = this.deptId;
    data['location'] = this.location;
    data['facilityId'] = this.facilityId;
    data['empPhoto'] = this.empPhoto;
    data['mobile'] = this.mobile;
    data['signature'] = this.signature;
    data['groupName'] = this.groupName;
    data['empCode2'] = this.empCode2;
    data['ips'] = this.ips;
    data['timeFrom'] = this.timeFrom;
    data['timeTo'] = this.timeTo;
    data['accTransfer'] = this.accTransfer;
    data['empName2'] = this.empName2;
    data['braName'] = this.braName;
    data['salesType'] = this.salesType;
    data['whTransactionType'] = this.whTransactionType;
    data['isDeleted'] = this.isDeleted;
    data['modifiedOn'] = this.modifiedOn;
    data['modifiedBy'] = this.modifiedBy;
    data['createdOn'] = this.createdOn;
    data['createdBy'] = this.createdBy;
    data['facilityName'] = this.facilityName;
    data['facilityName2'] = this.facilityName2;
    data['managerId'] = this.managerId;
    data['cusId'] = this.cusId;
    data['cusCode'] = this.cusCode;
    data['cusName'] = this.cusName;
    data['connectionId'] = this.connectionId;
    data['supId'] = this.supId;
    data['userPhoto'] = this.userPhoto;
    data['projectsId'] = this.projectsId;
    data['isAgree'] = this.isAgree;
    data['braName2'] = this.braName2;
    data['twoFactor'] = this.twoFactor;
    data['twoFactorType'] = this.twoFactorType;
    data['candId'] = this.candId;
    data['otpExpiry'] = this.otpExpiry;
    data['otp'] = this.otp;
    data['lastLogin'] = this.lastLogin;
    data['statusId'] = this.statusId;
    return data;
  }
}

class RusultPasswordModel {
  bool? success;
  DataRusultPasswor? dataRusultPasswor;
  String? message;

  RusultPasswordModel({this.success, this.dataRusultPasswor, this.message});

  RusultPasswordModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    dataRusultPasswor = json['data'] != null ? new DataRusultPasswor.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.dataRusultPasswor != null) {
      data['data'] = this.dataRusultPasswor!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class DataRusultPasswor {
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

  DataRusultPasswor(
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

  DataRusultPasswor.fromJson(Map<String, dynamic> json) {
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

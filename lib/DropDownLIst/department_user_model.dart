class DepartmentUserModel {
  bool? success;
  List<DataDepartmentUser>? datadepartmentUser ;
  String? message;

  DepartmentUserModel({this.success, this.datadepartmentUser, this.message});

  DepartmentUserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      datadepartmentUser = <DataDepartmentUser>[];
      json['data'].forEach((v) {
        datadepartmentUser!.add(new DataDepartmentUser.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.datadepartmentUser != null) {
      data['data'] = this.datadepartmentUser!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class DataDepartmentUser {
  int? id;
  String? code;
  String? name;
  int? parentId;
  String? tel;
  String? fax;
  String? email;
  String? mobile;
  String? note;
  String? levelNo;
  int? typeId;
  int? cityId;
  int? isdel;
  String? catId;
  int? createdBy;
  String? createdOn;
  int? modifiedBy;
  String? modifiedOn;
  bool? isDeleted;
  String? codeFormat;
  int? no;
  String? prefix;
  String? suffix;
  String? userId;
  String? epilogue;

  DataDepartmentUser(
      {this.id,
        this.code,
        this.name,
        this.parentId,
        this.tel,
        this.fax,
        this.email,
        this.mobile,
        this.note,
        this.levelNo,
        this.typeId,
        this.cityId,
        this.isdel,
        this.catId,
        this.createdBy,
        this.createdOn,
        this.modifiedBy,
        this.modifiedOn,
        this.isDeleted,
        this.codeFormat,
        this.no,
        this.prefix,
        this.suffix,
        this.userId,
        this.epilogue});

  DataDepartmentUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    parentId = json['parentId'];
    tel = json['tel'];
    fax = json['fax'];
    email = json['email'];
    mobile = json['mobile'];
    note = json['note'];
    levelNo = json['levelNo'];
    typeId = json['typeId'];
    cityId = json['cityId'];
    isdel = json['isdel'];
    catId = json['catId'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    modifiedBy = json['modifiedBy'];
    modifiedOn = json['modifiedOn'];
    isDeleted = json['isDeleted'];
    codeFormat = json['codeFormat'];
    no = json['no'];
    prefix = json['prefix'];
    suffix = json['suffix'];
    userId = json['userId'];
    epilogue = json['epilogue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['parentId'] = this.parentId;
    data['tel'] = this.tel;
    data['fax'] = this.fax;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['note'] = this.note;
    data['levelNo'] = this.levelNo;
    data['typeId'] = this.typeId;
    data['cityId'] = this.cityId;
    data['isdel'] = this.isdel;
    data['catId'] = this.catId;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedOn'] = this.modifiedOn;
    data['isDeleted'] = this.isDeleted;
    data['codeFormat'] = this.codeFormat;
    data['no'] = this.no;
    data['prefix'] = this.prefix;
    data['suffix'] = this.suffix;
    data['userId'] = this.userId;
    data['epilogue'] = this.epilogue;
    return data;
  }
}

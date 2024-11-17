class SideModel {
  bool? success;
  List<DataSide>? dataSide;
  String? message;

  SideModel({this.success, this.dataSide, this.message});

  SideModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      dataSide = <DataSide>[];
      json['data'].forEach((v) {
        dataSide!.add(new DataSide.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.dataSide != null) {
      data['data'] = this.dataSide!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class DataSide {
  int? id;
  String? code;
  String? name;
  int? parentId;
  String? tel;
  String? fax;
  String? email;
  String? mobile;
  String? note;
  Null? levelNo;
  int? typeId;
  int? cityId;
  int? isdel;
  Null? catId;
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

  DataSide(
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

  DataSide.fromJson(Map<String, dynamic> json) {
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

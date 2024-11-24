class NotifcationModel {
  bool? success;
  Pagination? pagination;
  List<DataNotifcation>? dataNotifcation;
  String? message;

  NotifcationModel({this.success, this.pagination, this.dataNotifcation, this.message});

  NotifcationModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      dataNotifcation = <DataNotifcation>[];
      json['data'].forEach((v) {
        dataNotifcation!.add(new DataNotifcation.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    if (this.dataNotifcation != null) {
      data['data'] = this.dataNotifcation!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Pagination {
  int? size;
  int? count;
  int? currentPage;
  int? totalPages;
  bool? hasNextPage;
  bool? hasPreviousPage;
  int? nextPage;
  int? previousPage;

  Pagination(
      { this.size,
        this.count,
        this.currentPage,
        this.totalPages,
        this.hasNextPage,
        this.hasPreviousPage,
        this.nextPage,
        this.previousPage});
  Pagination.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    count = json['count'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
    nextPage = json['nextPage'];
    previousPage = json['previousPage'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    data['count'] = this.count;
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    data['hasNextPage'] = this.hasNextPage;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['nextPage'] = this.nextPage;
    data['previousPage'] = this.previousPage;
    return data;
  }
}

class DataNotifcation {
  String? depName;
  int? id;
  int? transactionId;
  int? depId;
  int? statusId;
  int? formTypeId;
  Null? note;
  int? createdBy;
  String? createdOn;
  int? modifiedBy;
  String? modifiedOn;
  bool? isDeleted;
  String? formTypeName;
  int? userId;
  String? codeFormat;
  String? subject;
  String? hDate;
  String? statusName;
  String? name;
  String? userFullname;
  int? typeId;

  DataNotifcation(
      {this.depName,
        this.id,
        this.transactionId,
        this.depId,
        this.statusId,
        this.formTypeId,
        this.note,
        this.createdBy,
        this.createdOn,
        this.modifiedBy,
        this.modifiedOn,
        this.isDeleted,
        this.formTypeName,
        this.userId,
        this.codeFormat,
        this.subject,
        this.hDate,
        this.statusName,
        this.name,
        this.userFullname,
        this.typeId});

  DataNotifcation.fromJson(Map<String, dynamic> json) {
    depName = json['depName'];
    id = json['id'];
    transactionId = json['transactionId'];
    depId = json['depId'];
    statusId = json['statusId'];
    formTypeId = json['formTypeId'];
    note = json['note'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    modifiedBy = json['modifiedBy'];
    modifiedOn = json['modifiedOn'];
    isDeleted = json['isDeleted'];
    formTypeName = json['formTypeName'];
    userId = json['userId'];
    codeFormat = json['codeFormat'];
    subject = json['subject'];
    hDate = json['hDate'];
    statusName = json['statusName'];
    name = json['name'];
    userFullname = json['userFullname'];
    typeId = json['typeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['depName'] = this.depName;
    data['id'] = this.id;
    data['transactionId'] = this.transactionId;
    data['depId'] = this.depId;
    data['statusId'] = this.statusId;
    data['formTypeId'] = this.formTypeId;
    data['note'] = this.note;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedOn'] = this.modifiedOn;
    data['isDeleted'] = this.isDeleted;
    data['formTypeName'] = this.formTypeName;
    data['userId'] = this.userId;
    data['codeFormat'] = this.codeFormat;
    data['subject'] = this.subject;
    data['hDate'] = this.hDate;
    data['statusName'] = this.statusName;
    data['name'] = this.name;
    data['userFullname'] = this.userFullname;
    data['typeId'] = this.typeId;
    return data;
  }
}


class NotifcationNotReadModel {
  bool? success;
  PaginationNotRead? paginationNotRead;
  List<DataNotifcationNotRead>? dataNotifcationNotRead;
  String? message;

  NotifcationNotReadModel({this.success, this.paginationNotRead, this.dataNotifcationNotRead, this.message});

  NotifcationNotReadModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    paginationNotRead = json['pagination'] != null
        ? new PaginationNotRead.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      dataNotifcationNotRead = <DataNotifcationNotRead>[];
      json['data'].forEach((v) {
        dataNotifcationNotRead!.add(new DataNotifcationNotRead.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.paginationNotRead != null) {
      data['pagination'] = this.paginationNotRead!.toJson();
    }
    if (this.dataNotifcationNotRead != null) {
      data['data'] = this.dataNotifcationNotRead!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class PaginationNotRead {
  int? size;
  int? count;
  int? currentPage;
  int? totalPages;
  bool? hasNextPage;
  bool? hasPreviousPage;
  int? nextPage;
  int? previousPage;

  PaginationNotRead(
      { this.size,
        this.count,
        this.currentPage,
        this.totalPages,
        this.hasNextPage,
        this.hasPreviousPage,
        this.nextPage,
        this.previousPage});
  PaginationNotRead.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    count = json['count'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
    nextPage = json['nextPage'];
    previousPage = json['previousPage'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    data['count'] = this.count;
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    data['hasNextPage'] = this.hasNextPage;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['nextPage'] = this.nextPage;
    data['previousPage'] = this.previousPage;
    return data;
  }
}
class DataNotifcationNotRead {
  String? depName;
  int? id;
  int? transactionId;
  int? depId;
  int? statusId;
  int? formTypeId;
  Null? note;
  int? createdBy;
  String? createdOn;
  int? modifiedBy;
  String? modifiedOn;
  bool? isDeleted;
  String? formTypeName;
  int? userId;
  String? codeFormat;
  String? subject;
  String? hDate;
  String? statusName;
  String? name;
  String? userFullname;
  int? typeId;

  DataNotifcationNotRead(
      {this.depName,
        this.id,
        this.transactionId,
        this.depId,
        this.statusId,
        this.formTypeId,
        this.note,
        this.createdBy,
        this.createdOn,
        this.modifiedBy,
        this.modifiedOn,
        this.isDeleted,
        this.formTypeName,
        this.userId,
        this.codeFormat,
        this.subject,
        this.hDate,
        this.statusName,
        this.name,
        this.userFullname,
        this.typeId});

  DataNotifcationNotRead.fromJson(Map<String, dynamic> json) {
    depName = json['depName'];
    id = json['id'];
    transactionId = json['transactionId'];
    depId = json['depId'];
    statusId = json['statusId'];
    formTypeId = json['formTypeId'];
    note = json['note'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    modifiedBy = json['modifiedBy'];
    modifiedOn = json['modifiedOn'];
    isDeleted = json['isDeleted'];
    formTypeName = json['formTypeName'];
    userId = json['userId'];
    codeFormat = json['codeFormat'];
    subject = json['subject'];
    hDate = json['hDate'];
    statusName = json['statusName'];
    name = json['name'];
    userFullname = json['userFullname'];
    typeId = json['typeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['depName'] = this.depName;
    data['id'] = this.id;
    data['transactionId'] = this.transactionId;
    data['depId'] = this.depId;
    data['statusId'] = this.statusId;
    data['formTypeId'] = this.formTypeId;
    data['note'] = this.note;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedOn'] = this.modifiedOn;
    data['isDeleted'] = this.isDeleted;
    data['formTypeName'] = this.formTypeName;
    data['userId'] = this.userId;
    data['codeFormat'] = this.codeFormat;
    data['subject'] = this.subject;
    data['hDate'] = this.hDate;
    data['statusName'] = this.statusName;
    data['name'] = this.name;
    data['userFullname'] = this.userFullname;
    data['typeId'] = this.typeId;
    return data;
  }
}

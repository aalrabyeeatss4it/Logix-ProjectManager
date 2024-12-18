class DocumentLibraryModel {
  bool? success;
  List<DataDocumentLibrary>? dataDocumentLibrary;
  String? message;

  DocumentLibraryModel({this.success, this.dataDocumentLibrary, this.message});

  DocumentLibraryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      dataDocumentLibrary = <DataDocumentLibrary>[];
      json['data'].forEach((v) {
        dataDocumentLibrary!.add(new DataDocumentLibrary.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.dataDocumentLibrary != null) {
      data['data'] = this.dataDocumentLibrary!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}
class DataDocumentLibrary {
  String? depCode;
  String? depName;
  int? code;
  String? hDate;
  String? gDate;
  int? typeId;
  int? catId;
  int? importanceDegreeId;
  int? secretDegreeId;
  int? deliveryMethodId;
  int? transactionTypeId;
  int? statusId;
  String? subject;
  String? detailes;
  int? fromDepId;
  String? attachment;
  String? mainCode;
  int? mainId;
  int? toDepId;
  String? formNo;
  String? formDate;
  int? createdBy;
  String? createdOn;
  int? modifiedBy;
  String? modifiedOn;
  bool? isDeleted;
  int? referralsToDepId;
  int? referralsToUserId;
  String? note;
  int? id;
  String? depCodeTo;
  String? depNameTo;
  String? typeName;
  String? userFullname;
  String? receiveDate;
  String? receiveTime;
  String? receiveName;
  String? codeFormat;
  String? referralsDate;
  String? dateReply;
  String? dateReplyG;
  bool? isNeedReply;
  String? keywords;
  String? noShelf;
  String? foldesId;
  String? foldersName;
  String? refranceCode;
  String? barcode;
  String? docTypeName;
  int? depTypeId;
  int? mfId;
  String? mfCode;
  String? mfName;
  String? name;
  int? cntFiles;
  int? catIdFromDep;
  String? catNameFromDep;
  int? catIdToDep;
  String? catNameToDep;
  String? formDateH;
  bool? referralIsRead;

  DataDocumentLibrary(
      {this.depCode,
        this.depName,
        this.code,
        this.hDate,
        this.gDate,
        this.typeId,
        this.catId,
        this.importanceDegreeId,
        this.secretDegreeId,
        this.deliveryMethodId,
        this.transactionTypeId,
        this.statusId,
        this.subject,
        this.detailes,
        this.fromDepId,
        this.attachment,
        this.mainCode,
        this.mainId,
        this.toDepId,
        this.formNo,
        this.formDate,
        this.createdBy,
        this.createdOn,
        this.modifiedBy,
        this.modifiedOn,
        this.isDeleted,
        this.referralsToDepId,
        this.referralsToUserId,
        this.note,
        this.id,
        this.depCodeTo,
        this.depNameTo,
        this.typeName,
        this.userFullname,
        this.receiveDate,
        this.receiveTime,
        this.receiveName,
        this.codeFormat,
        this.referralsDate,
        this.dateReply,
        this.dateReplyG,
        this.isNeedReply,
        this.keywords,
        this.noShelf,
        this.foldesId,
        this.foldersName,
        this.refranceCode,
        this.barcode,
        this.docTypeName,
        this.depTypeId,
        this.mfId,
        this.mfCode,
        this.mfName,
        this.name,
        this.cntFiles,
        this.catIdFromDep,
        this.catNameFromDep,
        this.catIdToDep,
        this.catNameToDep,
        this.formDateH,
        this.referralIsRead});

  DataDocumentLibrary.fromJson(Map<String, dynamic> json) {
    depCode = json['depCode'];
    depName = json['depName'];
    code = json['code'];
    hDate = json['hDate'];
    gDate = json['gDate'];
    typeId = json['typeId'];
    catId = json['catId'];
    importanceDegreeId = json['importanceDegreeId'];
    secretDegreeId = json['secretDegreeId'];
    deliveryMethodId = json['deliveryMethodId'];
    transactionTypeId = json['transactionTypeId'];
    statusId = json['statusId'];
    subject = json['subject'];
    detailes = json['detailes'];
    fromDepId = json['fromDepId'];
    attachment = json['attachment'];
    mainCode = json['mainCode'];
    mainId = json['mainId'];
    toDepId = json['toDepId'];
    formNo = json['formNo'];
    formDate = json['formDate'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    modifiedBy = json['modifiedBy'];
    modifiedOn = json['modifiedOn'];
    isDeleted = json['isDeleted'];
    referralsToDepId = json['referralsToDepId'];
    referralsToUserId = json['referralsToUserId'];
    note = json['note'];
    id = json['id'];
    depCodeTo = json['depCodeTo'];
    depNameTo = json['depNameTo'];
    typeName = json['typeName'];
    userFullname = json['userFullname'];
    receiveDate = json['receiveDate'];
    receiveTime = json['receiveTime'];
    receiveName = json['receiveName'];
    codeFormat = json['codeFormat'];
    referralsDate = json['referralsDate'];
    dateReply = json['dateReply'];
    dateReplyG = json['dateReplyG'];
    isNeedReply = json['isNeedReply'];
    keywords = json['keywords'];
    noShelf = json['noShelf'];
    foldesId = json['foldesId'];
    foldersName = json['foldersName'];
    refranceCode = json['refranceCode'];
    barcode = json['barcode'];
    docTypeName = json['docTypeName'];
    depTypeId = json['depTypeId'];
    mfId = json['mfId'];
    mfCode = json['mfCode'];
    mfName = json['mfName'];
    name = json['name'];
    cntFiles = json['cntFiles'];
    catIdFromDep = json['catIdFromDep'];
    catNameFromDep = json['catNameFromDep'];
    catIdToDep = json['catIdToDep'];
    catNameToDep = json['catNameToDep'];
    formDateH = json['formDateH'];
    referralIsRead = json['referral_Is_Read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['depCode'] = this.depCode;
    data['depName'] = this.depName;
    data['code'] = this.code;
    data['hDate'] = this.hDate;
    data['gDate'] = this.gDate;
    data['typeId'] = this.typeId;
    data['catId'] = this.catId;
    data['importanceDegreeId'] = this.importanceDegreeId;
    data['secretDegreeId'] = this.secretDegreeId;
    data['deliveryMethodId'] = this.deliveryMethodId;
    data['transactionTypeId'] = this.transactionTypeId;
    data['statusId'] = this.statusId;
    data['subject'] = this.subject;
    data['detailes'] = this.detailes;
    data['fromDepId'] = this.fromDepId;
    data['attachment'] = this.attachment;
    data['mainCode'] = this.mainCode;
    data['mainId'] = this.mainId;
    data['toDepId'] = this.toDepId;
    data['formNo'] = this.formNo;
    data['formDate'] = this.formDate;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedOn'] = this.modifiedOn;
    data['isDeleted'] = this.isDeleted;
    data['referralsToDepId'] = this.referralsToDepId;
    data['referralsToUserId'] = this.referralsToUserId;
    data['note'] = this.note;
    data['id'] = this.id;
    data['depCodeTo'] = this.depCodeTo;
    data['depNameTo'] = this.depNameTo;
    data['typeName'] = this.typeName;
    data['userFullname'] = this.userFullname;
    data['receiveDate'] = this.receiveDate;
    data['receiveTime'] = this.receiveTime;
    data['receiveName'] = this.receiveName;
    data['codeFormat'] = this.codeFormat;
    data['referralsDate'] = this.referralsDate;
    data['dateReply'] = this.dateReply;
    data['dateReplyG'] = this.dateReplyG;
    data['isNeedReply'] = this.isNeedReply;
    data['keywords'] = this.keywords;
    data['noShelf'] = this.noShelf;
    data['foldesId'] = this.foldesId;
    data['foldersName'] = this.foldersName;
    data['refranceCode'] = this.refranceCode;
    data['barcode'] = this.barcode;
    data['docTypeName'] = this.docTypeName;
    data['depTypeId'] = this.depTypeId;
    data['mfId'] = this.mfId;
    data['mfCode'] = this.mfCode;
    data['mfName'] = this.mfName;
    data['name'] = this.name;
    data['cntFiles'] = this.cntFiles;
    data['catIdFromDep'] = this.catIdFromDep;
    data['catNameFromDep'] = this.catNameFromDep;
    data['catIdToDep'] = this.catIdToDep;
    data['catNameToDep'] = this.catNameToDep;
    data['formDateH'] = this.formDateH;
    data['referral_Is_Read'] = this.referralIsRead;
    return data;
  }
}
/// /
/// /
/// /
class InboxAttachmentsModel {
  bool? success;
  List<DataAttachments>? dataAttachments;
  String? message;

  InboxAttachmentsModel({this.success, this.dataAttachments, this.message});

  InboxAttachmentsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      dataAttachments = <DataAttachments>[];
      json['data'].forEach((v) {
        dataAttachments!.add(new DataAttachments.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.dataAttachments != null) {
      data['data'] = this.dataAttachments!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}
class DataAttachments {
  String? userFullname;
  int? id;
  int? transactionId;
  String? fileName;
  String? fileDescription;
  String? fileUrl;
  String? fileSize;
  String? fileTypeId;
  int? createdBy;
  String? createdOn;
  int? modifiedBy;
  String? modifiedOn;
  bool? isDeleted;

  DataAttachments(
      {this.userFullname,
        this.id,
        this.transactionId,
        this.fileName,
        this.fileDescription,
        this.fileUrl,
        this.fileSize,
        this.fileTypeId,
        this.createdBy,
        this.createdOn,
        this.modifiedBy,
        this.modifiedOn,
        this.isDeleted});

  DataAttachments.fromJson(Map<String, dynamic> json) {
    userFullname = json['userFullname'];
    id = json['id'];
    transactionId = json['transactionId'];
    fileName = json['fileName'];
    fileDescription = json['fileDescription'];
    fileUrl = json['fileUrl'];
    fileSize = json['fileSize'];
    fileTypeId = json['fileTypeId'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    modifiedBy = json['modifiedBy'];
    modifiedOn = json['modifiedOn'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userFullname'] = this.userFullname;
    data['id'] = this.id;
    data['transactionId'] = this.transactionId;
    data['fileName'] = this.fileName;
    data['fileDescription'] = this.fileDescription;
    data['fileUrl'] = this.fileUrl;
    data['fileSize'] = this.fileSize;
    data['fileTypeId'] = this.fileTypeId;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedOn'] = this.modifiedOn;
    data['isDeleted'] = this.isDeleted;
    return data;
  }
}
/// /
/// /
/// /
class InboxReferralsModel {
  bool? success;
  List<DataReferrals>? dataReferrals;
  String? message;

  InboxReferralsModel({this.success, this.dataReferrals, this.message});

  InboxReferralsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      dataReferrals = <DataReferrals>[];
      json['data'].forEach((v) {
        dataReferrals!.add(new DataReferrals.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.dataReferrals != null) {
      data['data'] = this.dataReferrals!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}
class DataReferrals {
  String? depName;
  String? empName;
  int? createdBy;
  String? userFullnameCreateBy;
  String? createdOn;
  int? id;
  int? fromDepId;
  int? fromUserId;
  int? toDepId;
  int? toUserId;
  String? note;
  int? transactionId;
  String? modifiedBy;
  String? modifiedOn;
  bool? isDeleted;
  int? statusId;
  String? statusName;
  String? toName;
  int? code;
  String? codeFormat;
  String? hDate;
  int? depId;
  String? subject;

  DataReferrals(
      {this.depName,
        this.empName,
        this.createdBy,
        this.userFullnameCreateBy,
        this.createdOn,
        this.id,
        this.fromDepId,
        this.fromUserId,
        this.toDepId,
        this.toUserId,
        this.note,
        this.transactionId,
        this.modifiedBy,
        this.modifiedOn,
        this.isDeleted,
        this.statusId,
        this.statusName,
        this.toName,
        this.code,
        this.codeFormat,
        this.hDate,
        this.depId,
        this.subject});

  DataReferrals.fromJson(Map<String, dynamic> json) {
    depName = json['depName'];
    empName = json['empName'];
    createdBy = json['createdBy'];
    userFullnameCreateBy = json['userFullnameCreateBy'];
    createdOn = json['createdOn'];
    id = json['id'];
    fromDepId = json['fromDepId'];
    fromUserId = json['fromUserId'];
    toDepId = json['toDepId'];
    toUserId = json['toUserId'];
    note = json['note'];
    transactionId = json['transactionId'];
    modifiedBy = json['modifiedBy'];
    modifiedOn = json['modifiedOn'];
    isDeleted = json['isDeleted'];
    statusId = json['statusId'];
    statusName = json['statusName'];
    toName = json['toName'];
    code = json['code'];
    codeFormat = json['codeFormat'];
    hDate = json['hDate'];
    depId = json['depId'];
    subject = json['subject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['depName'] = this.depName;
    data['empName'] = this.empName;
    data['createdBy'] = this.createdBy;
    data['userFullnameCreateBy'] = this.userFullnameCreateBy;
    data['createdOn'] = this.createdOn;
    data['id'] = this.id;
    data['fromDepId'] = this.fromDepId;
    data['fromUserId'] = this.fromUserId;
    data['toDepId'] = this.toDepId;
    data['toUserId'] = this.toUserId;
    data['note'] = this.note;
    data['transactionId'] = this.transactionId;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedOn'] = this.modifiedOn;
    data['isDeleted'] = this.isDeleted;
    data['statusId'] = this.statusId;
    data['statusName'] = this.statusName;
    data['toName'] = this.toName;
    data['code'] = this.code;
    data['codeFormat'] = this.codeFormat;
    data['hDate'] = this.hDate;
    data['depId'] = this.depId;
    data['subject'] = this.subject;
    return data;
  }
}
/// /
/// /
/// /
 class InboxTransactionsCopiesModel {
  bool? success;
  List<DataTransactionsCopies>? dataTransactionsCopies;
  String? message;

  InboxTransactionsCopiesModel({this.success, this.dataTransactionsCopies, this.message});

  InboxTransactionsCopiesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      dataTransactionsCopies = <DataTransactionsCopies>[];
      json['data'].forEach((v) {
        dataTransactionsCopies!.add(new DataTransactionsCopies.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.dataTransactionsCopies != null) {
      data['data'] = this.dataTransactionsCopies!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}
class DataTransactionsCopies {
  String? depName;
  int? id;
  int? transactionId;
  int? depId;
  int? statusId;
  int? formTypeId;
  String? note;
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

  DataTransactionsCopies(
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

  DataTransactionsCopies.fromJson(Map<String, dynamic> json) {
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


class DocumentTypeModel {
  bool? success;
  List<DataDocumentType>? dataDocumentType;
  String? message;

  DocumentTypeModel({this.success, this.dataDocumentType, this.message});

  DocumentTypeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      dataDocumentType = <DataDocumentType>[];
      json['data'].forEach((v) {
        dataDocumentType!.add(new DataDocumentType.fromJson(v));
      });
    }
    message = json['message'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.dataDocumentType != null) {
      data['data'] = this.dataDocumentType!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class DataDocumentType {
  int? id;
  String? name;
  int? duration;
  int? createdBy;
  String? createdOn;
  int? modifiedBy;
  String? modifiedOn;
  bool? isDeleted;

  DataDocumentType(
      {this.id,
        this.name,
        this.duration,
        this.createdBy,
        this.createdOn,
        this.modifiedBy,
        this.modifiedOn,
        this.isDeleted});

  DataDocumentType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    modifiedBy = json['modifiedBy'];
    modifiedOn = json['modifiedOn'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['modifiedBy'] = this.modifiedBy;
    data['modifiedOn'] = this.modifiedOn;
    data['isDeleted'] = this.isDeleted;
    return data;
  }
}

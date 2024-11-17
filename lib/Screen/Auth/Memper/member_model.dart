class MemberModel {
  bool? success;
  Data? data;
  String? message;

  MemberModel({this.success, this.data, this.message});

  MemberModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  Facility? facility;
  Members? members;

  Data({this.facility, this.members});

  Data.fromJson(Map<String, dynamic> json) {
    facility = json['facility'] != null
        ? new Facility.fromJson(json['facility'])
        : null;
    members =
    json['members'] != null ? new Members.fromJson(json['members']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.facility != null) {
      data['facility'] = this.facility!.toJson();
    }
    if (this.members != null) {
      data['members'] = this.members!.toJson();
    }
    return data;
  }
}

class Facility {
  int? facilityId;
  String? facilityName;
  String? facilityName2;
  String? facilityLogo;
  String? facilityPhone;
  String? facilityMobile;
  String? facilityEmail;
  Null? facilitySite;
  String? facilityAddress;

  Facility(
      {this.facilityId,
        this.facilityName,
        this.facilityName2,
        this.facilityLogo,
        this.facilityPhone,
        this.facilityMobile,
        this.facilityEmail,
        this.facilitySite,
        this.facilityAddress});

  Facility.fromJson(Map<String, dynamic> json) {
    facilityId = json['facilityId'];
    facilityName = json['facilityName'];
    facilityName2 = json['facilityName2'];
    facilityLogo = json['facilityLogo'];
    facilityPhone = json['facilityPhone'];
    facilityMobile = json['facilityMobile'];
    facilityEmail = json['facilityEmail'];
    facilitySite = json['facilitySite'];
    facilityAddress = json['facilityAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facilityId'] = this.facilityId;
    data['facilityName'] = this.facilityName;
    data['facilityName2'] = this.facilityName2;
    data['facilityLogo'] = this.facilityLogo;
    data['facilityPhone'] = this.facilityPhone;
    data['facilityMobile'] = this.facilityMobile;
    data['facilityEmail'] = this.facilityEmail;
    data['facilitySite'] = this.facilitySite;
    data['facilityAddress'] = this.facilityAddress;
    return data;
  }
}

class Members {
  int? id;
  String? memberID;
  String? apiUrl;
  String? erpUrl;
  String? dbName;
  String? dbUsername;
  String? dbPassword;
  String? dbUrl;
  String? connectionString;

  Members(
      {this.id,
        this.memberID,
        this.apiUrl,
        this.erpUrl,
        this.dbName,
        this.dbUsername,
        this.dbPassword,
        this.dbUrl,
        this.connectionString});

  Members.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberID = json['member_ID'];
    apiUrl = json['apiUrl'];
    erpUrl = json['erpUrl'];
    dbName = json['dbName'];
    dbUsername = json['dbUsername'];
    dbPassword = json['dbPassword'];
    dbUrl = json['dbUrl'];
    connectionString = json['connectionString'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['member_ID'] = this.memberID;
    data['apiUrl'] = this.apiUrl;
    data['erpUrl'] = this.erpUrl;
    data['dbName'] = this.dbName;
    data['dbUsername'] = this.dbUsername;
    data['dbPassword'] = this.dbPassword;
    data['dbUrl'] = this.dbUrl;
    data['connectionString'] = this.connectionString;
    return data;
  }
}


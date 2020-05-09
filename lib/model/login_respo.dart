class LoginRespo {
  String status;
  String message;
  Data data;

  LoginRespo({this.status, this.message, this.data});

  LoginRespo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String ssoId;
  String password;
  String firstName;
  String email;
  String joiningDate;
  String contactNo;
  int lastloginDate;
  int invalidPassCount;
  bool isActive;
  bool isResetPassword;
  bool contactVerified;
  bool emailVerified;
  String lastName;
  String gender;
  String countrycode;
  String dateofbirth;
  List<UserProfiles> userProfiles;
  String token;
  Null upid;
  Null uptype;
  Null status1;
  Null lastlogin;

  Data(
      {this.id,
        this.ssoId,
        this.password,
        this.firstName,
        this.email,
        this.joiningDate,
        this.contactNo,
        this.lastloginDate,
        this.invalidPassCount,
        this.isActive,
        this.isResetPassword,
        this.contactVerified,
        this.emailVerified,
        this.lastName,
        this.gender,
        this.countrycode,
        this.dateofbirth,
        this.userProfiles,
        this.token,
        this.upid,
        this.uptype,
        this.status1,
        this.lastlogin});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ssoId = json['ssoId'];
    password = json['password'];
    firstName = json['firstName'];
    email = json['email'];
    joiningDate = json['joiningDate'];
    contactNo = json['contactNo'];
    lastloginDate = json['lastloginDate'];
    invalidPassCount = json['invalidPassCount'];
    isActive = json['isActive'];
    isResetPassword = json['isResetPassword'];
    contactVerified = json['contactVerified'];
    emailVerified = json['emailVerified'];
    lastName = json['lastName'];
    gender = json['gender'];
    countrycode = json['countrycode'];
    dateofbirth = json['dateofbirth'];
    if (json['userProfiles'] != null) {
      userProfiles = new List<UserProfiles>();
      json['userProfiles'].forEach((v) {
        userProfiles.add(new UserProfiles.fromJson(v));
      });
    }
    token = json['token'];
    upid = json['upid'];
    uptype = json['uptype'];
    status1 = json['status1'];
    lastlogin = json['lastlogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ssoId'] = this.ssoId;
    data['password'] = this.password;
    data['firstName'] = this.firstName;
    data['email'] = this.email;
    data['joiningDate'] = this.joiningDate;
    data['contactNo'] = this.contactNo;
    data['lastloginDate'] = this.lastloginDate;
    data['invalidPassCount'] = this.invalidPassCount;
    data['isActive'] = this.isActive;
    data['isResetPassword'] = this.isResetPassword;
    data['contactVerified'] = this.contactVerified;
    data['emailVerified'] = this.emailVerified;
    data['lastName'] = this.lastName;
    data['gender'] = this.gender;
    data['countrycode'] = this.countrycode;
    data['dateofbirth'] = this.dateofbirth;
    if (this.userProfiles != null) {
      data['userProfiles'] = this.userProfiles.map((v) => v.toJson()).toList();
    }
    data['token'] = this.token;
    data['upid'] = this.upid;
    data['uptype'] = this.uptype;
    data['status1'] = this.status1;
    data['lastlogin'] = this.lastlogin;
    return data;
  }
}

class UserProfiles {
  int id;
  String type;

  UserProfiles({this.id, this.type});

  UserProfiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}
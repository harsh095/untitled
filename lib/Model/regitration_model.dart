class RegisterModel {
  String? message;
  String? accessToken;
  User? user;

  RegisterModel({this.message, this.accessToken, this.user});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['AccessToken'];
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['AccessToken'] = this.accessToken;
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  bool? isVerified;
  bool? isPaidUser;
  bool? isDeleted;
  int? iD;
  String? name;
  String? email;
  int? loginType;
  bool? isOtpVerified;
  Null? otpExpirationTime;
  int? userRoleID;

  User(
      {this.isVerified,
        this.isPaidUser,
        this.isDeleted,
        this.iD,
        this.name,
        this.email,
        this.loginType,
        this.isOtpVerified,
        this.otpExpirationTime,
        this.userRoleID});

  User.fromJson(Map<String, dynamic> json) {
    isVerified = json['Is_verified'];
    isPaidUser = json['Is_paid_user'];
    isDeleted = json['Is_deleted'];
    iD = json['ID'];
    name = json['Name'];
    email = json['Email'];
    loginType = json['Login_type'];
    isOtpVerified = json['Is_otp_verified'];
    otpExpirationTime = json['Otp_expiration_time'];
    userRoleID = json['UserRoleID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Is_verified'] = this.isVerified;
    data['Is_paid_user'] = this.isPaidUser;
    data['Is_deleted'] = this.isDeleted;
    data['ID'] = this.iD;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['Login_type'] = this.loginType;
    data['Is_otp_verified'] = this.isOtpVerified;
    data['Otp_expiration_time'] = this.otpExpirationTime;
    data['UserRoleID'] = this.userRoleID;
    return data;
  }
}
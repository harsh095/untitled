class VerifyOtpModel {
  String? message;
  String? accessToken;
  User? user;

  VerifyOtpModel({this.message, this.accessToken, this.user});

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
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
  int? iD;
  String? name;
  String? email;
  String? countryCode;
  String? phone;
  bool? isOtpVerified;
  Null? otpExpirationTime;
  bool? isVerified;
  bool? isPaidUser;
  String? loginType;
  int? userRoleID;
  bool? isDeleted;

  User(
      {this.iD,
        this.name,
        this.email,
        this.countryCode,
        this.phone,
        this.isOtpVerified,
        this.otpExpirationTime,
        this.isVerified,
        this.isPaidUser,
        this.loginType,
        this.userRoleID,
        this.isDeleted});

  User.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    email = json['Email'];
    countryCode = json['Country_code'];
    phone = json['Phone'];
    isOtpVerified = json['Is_otp_verified'];
    otpExpirationTime = json['Otp_expiration_time'];
    isVerified = json['Is_verified'];
    isPaidUser = json['Is_paid_user'];
    loginType = json['Login_type'];
    userRoleID = json['UserRoleID'];
    isDeleted = json['Is_deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['Country_code'] = this.countryCode;
    data['Phone'] = this.phone;
    data['Is_otp_verified'] = this.isOtpVerified;
    data['Otp_expiration_time'] = this.otpExpirationTime;
    data['Is_verified'] = this.isVerified;
    data['Is_paid_user'] = this.isPaidUser;
    data['Login_type'] = this.loginType;
    data['UserRoleID'] = this.userRoleID;
    data['Is_deleted'] = this.isDeleted;
    return data;
  }
}
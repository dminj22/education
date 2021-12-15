// To parse this JSON data, do
//
//     final emailSignUpModel = emailSignUpModelFromJson(jsonString);

import 'dart:convert';

EmailSignUpModel emailSignUpModelFromJson(String str) => EmailSignUpModel.fromJson(json.decode(str));

String emailSignUpModelToJson(EmailSignUpModel data) => json.encode(data.toJson());

class EmailSignUpModel {
  EmailSignUpModel({
    this.status,
    this.token,
    this.msg,
    this.user,
  });

  bool? status;
  String? token;
  String? msg;
  User? user;

  factory EmailSignUpModel.fromJson(Map<String, dynamic> json) => EmailSignUpModel(
    status: json["status"] == null ? null : json["status"],
    token: json["token"] == null ? null : json["token"],
    msg: json["msg"] == null ? null : json["msg"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "token": token == null ? null : token,
    "msg": msg == null ? null : msg,
    "user": user == null ? null : user!.toJson(),
  };
}

class User {
  User({
    this.id,
    this.firstname,
    this.lastname,
    this.mobile,
    this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? firstname;
  String? lastname;
  int? mobile;
  String? email;
  String? password;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"] == null ? null : json["_id"],
    firstname: json["firstname"] == null ? null : json["firstname"],
    lastname: json["lastname"] == null ? null : json["lastname"],
    mobile: json["mobile"] == null ? null : json["mobile"],
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "firstname": firstname == null ? null : firstname,
    "lastname": lastname == null ? null : lastname,
    "mobile": mobile == null ? null : mobile,
    "email": email == null ? null : email,
    "password": password == null ? null : password,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "__v": v == null ? null : v,
  };
}

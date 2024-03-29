// To parse this JSON data, do
//
//     final classModel = classModelFromJson(jsonString);

import 'dart:convert';

ClassModel classModelFromJson(String str) => ClassModel.fromJson(json.decode(str));

String classModelToJson(ClassModel data) => json.encode(data.toJson());

class ClassModel {
  ClassModel({
    this.status,
    this.msg,
    this.data,
  });

  bool? status;
  String? msg;
  List<Datum>? data;

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
    status: json["status"] == null ? null : json["status"],
    msg: json["msg"] == null ? null : json["msg"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "msg": msg == null ? null : msg,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.classesName,
    this.maincategory,
    this.sortorder,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? classesName;
  String? maincategory;
  int? sortorder;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"] == null ? null : json["_id"],
    classesName: json["classes_name"] == null ? null : json["classes_name"],
    maincategory: json["maincategory"] == null ? null : json["maincategory"],
    sortorder: json["sortorder"] == null ? null : json["sortorder"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "classes_name": classesName == null ? null : classesName,
    "maincategory": maincategory == null ? null : maincategory,
    "sortorder": sortorder == null ? null : sortorder,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "__v": v == null ? null : v,
  };
}

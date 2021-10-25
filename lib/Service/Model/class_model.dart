// To parse this JSON data, do
//
//     final classModel = classModelFromJson(jsonString);

import 'dart:convert';

ClassModel classModelFromJson(String str) => ClassModel.fromJson(json.decode(str));

String classModelToJson(ClassModel data) => json.encode(data.toJson());

class ClassModel {
  ClassModel({
    this.status,
    this.data,
  });

  bool? status;
  List<Datum>? data;

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.catId,
    this.className,
    this.v,
  });

  String? id;
  String? catId;
  String? className;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"] == null ? null : json["_id"],
    catId: json["cat_id"] == null ? null : json["cat_id"],
    className: json["class_name"] == null ? null : json["class_name"],
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "cat_id": catId == null ? null : catId,
    "class_name": className == null ? null : className,
    "__v": v == null ? null : v,
  };
}

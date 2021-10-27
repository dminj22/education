// To parse this JSON data, do
//
//     final chaptersModel = chaptersModelFromJson(jsonString);

import 'dart:convert';

ChaptersModel chaptersModelFromJson(String str) => ChaptersModel.fromJson(json.decode(str));

String chaptersModelToJson(ChaptersModel data) => json.encode(data.toJson());

class ChaptersModel {
  ChaptersModel({
    this.status,
    this.msg,
    this.data,
  });

  bool? status;
  String? msg;
  List<Datum>? data;

  factory ChaptersModel.fromJson(Map<String, dynamic> json) => ChaptersModel(
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
    this.chapterName,
    this.subject,
    this.sortorder,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? chapterName;
  Subject? subject;
  int? sortorder;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"] == null ? null : json["_id"],
    chapterName: json["chapter_name"] == null ? null : json["chapter_name"],
    subject: json["subject"] == null ? null : Subject.fromJson(json["subject"]),
    sortorder: json["sortorder"] == null ? null : json["sortorder"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "chapter_name": chapterName == null ? null : chapterName,
    "subject": subject == null ? null : subject!.toJson(),
    "sortorder": sortorder == null ? null : sortorder,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "__v": v == null ? null : v,
  };
}

class Subject {
  Subject({
    this.id,
    this.subjectName,
    this.classes,
    this.sortorder,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  dynamic id;
  dynamic subjectName;
  dynamic classes;
  int? sortorder;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    id: json["_id"] == null ? null : json["_id"],
    subjectName: json["subject_name"] == null ? null : json["subject_name"],
    classes: json["classes"] == null ? null : json["classes"],
    sortorder: json["sortorder"] == null ? null : json["sortorder"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "subject_name": subjectName == null ? null :subjectName,
    "classes": classes == null ? null : classes,
    "sortorder": sortorder == null ? null : sortorder,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "__v": v == null ? null : v,
  };
}
// To parse this JSON data, do
//
//     final testDescriptionModel = testDescriptionModelFromJson(jsonString);

import 'dart:convert';

TestDescriptionModel testDescriptionModelFromJson(String str) => TestDescriptionModel.fromJson(json.decode(str));

String testDescriptionModelToJson(TestDescriptionModel data) => json.encode(data.toJson());

class TestDescriptionModel {
  TestDescriptionModel({
    this.status,
    this.msg,
    this.data,
  });

  bool? status;
  String? msg;
  List<Datum>? data;

  factory TestDescriptionModel.fromJson(Map<String, dynamic> json) => TestDescriptionModel(
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
    this.userRegistered,
    this.syllabusTags,
    this.id,
    this.title,
    this.description,
    this.chapter,
    this.costing,
    this.duration,
    this.numberOfQues,
    this.sortorder,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  List<dynamic>? userRegistered;
  List<String>? syllabusTags;
  String? id;
  String? title;
  String? description;
  Chapter? chapter;
  String? costing;
  String? duration;
  int? numberOfQues;
  int? sortorder;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    userRegistered: json["user_registered"] == null ? null : List<dynamic>.from(json["user_registered"].map((x) => x)),
    syllabusTags: json["syllabus_tags"] == null ? null : List<String>.from(json["syllabus_tags"].map((x) => x)),
    id: json["_id"] == null ? null : json["_id"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    chapter: json["chapter"] == null ? null : Chapter.fromJson(json["chapter"]),
    costing: json["costing"] == null ? null : json["costing"],
    duration: json["duration"] == null ? null : json["duration"],
    numberOfQues: json["number_of_ques"] == null ? null : json["number_of_ques"],
    sortorder: json["sortorder"] == null ? null : json["sortorder"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "user_registered": userRegistered == null ? null : List<dynamic>.from(userRegistered!.map((x) => x)),
    "syllabus_tags": syllabusTags == null ? null : List<dynamic>.from(syllabusTags!.map((x) => x)),
    "_id": id == null ? null : id,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "chapter": chapter == null ? null : chapter!.toJson(),
    "costing": costing == null ? null : costing,
    "duration": duration == null ? null : duration,
    "number_of_ques": numberOfQues == null ? null : numberOfQues,
    "sortorder": sortorder == null ? null : sortorder,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "__v": v == null ? null : v,
  };
}

class Chapter {
  Chapter({
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
  String? subject;
  int? sortorder;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
    id: json["_id"] == null ? null : json["_id"],
    chapterName: json["chapter_name"] == null ? null : json["chapter_name"],
    subject: json["subject"] == null ? null : json["subject"],
    sortorder: json["sortorder"] == null ? null : json["sortorder"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "chapter_name": chapterName == null ? null : chapterName,
    "subject": subject == null ? null : subject,
    "sortorder": sortorder == null ? null : sortorder,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "__v": v == null ? null : v,
  };
}

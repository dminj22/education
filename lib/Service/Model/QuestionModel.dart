// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

QuestionModel questionModelFromJson(String str) => QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
  QuestionModel({
    this.status,
    this.msg,
    this.data,
  });

  bool? status;
  String? msg;
  List<Datum>? data;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
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
    this.markForReview,
    this.attempted,
    this.unattempted,
    this.unseen,
    this.id,
    this.question,
    this.questionDesc,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.correctoption,
    this.correctoptionDesc,
    this.timeLapsed,
    this.markWeightage,
    this.test,
    this.sortorder,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  bool? markForReview;
  bool? attempted;
  bool? unattempted;
  bool? unseen;
  String? id;
  String? question;
  String? questionDesc;
  String? option1;
  String? option2;
  String? option3;
  String? option4;
  String? correctoption;
  String? correctoptionDesc;
  String? timeLapsed;
  int? markWeightage;
  Test? test;
  int? sortorder;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    markForReview: json["mark_for_review"] == null ? null : json["mark_for_review"],
    attempted: json["attempted"] == null ? null : json["attempted"],
    unattempted: json["unattempted"] == null ? null : json["unattempted"],
    unseen: json["unseen"] == null ? null : json["unseen"],
    id: json["_id"] == null ? null : json["_id"],
    question: json["question"] == null ? null : json["question"],
    questionDesc: json["question_desc"] == null ? null : json["question_desc"],
    option1: json["option1"] == null ? null : json["option1"],
    option2: json["option2"] == null ? null : json["option2"],
    option3: json["option3"] == null ? null : json["option3"],
    option4: json["option4"] == null ? null : json["option4"],
    correctoption: json["correctoption"] == null ? null : json["correctoption"],
    correctoptionDesc: json["correctoption_desc"] == null ? null : json["correctoption_desc"],
    timeLapsed: json["time_lapsed"] == null ? null : json["time_lapsed"],
    markWeightage: json["mark_weightage"] == null ? null : json["mark_weightage"],
    test: json["test"] == null ? null : Test.fromJson(json["test"]),
    sortorder: json["sortorder"] == null ? null : json["sortorder"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "mark_for_review": markForReview == null ? null : markForReview,
    "attempted": attempted == null ? null : attempted,
    "unattempted": unattempted == null ? null : unattempted,
    "unseen": unseen == null ? null : unseen,
    "_id": id == null ? null : id,
    "question": question == null ? null : question,
    "question_desc": questionDesc == null ? null : questionDesc,
    "option1": option1 == null ? null : option1,
    "option2": option2 == null ? null : option2,
    "option3": option3 == null ? null : option3,
    "option4": option4 == null ? null : option4,
    "correctoption": correctoption == null ? null : correctoption,
    "correctoption_desc": correctoptionDesc == null ? null : correctoptionDesc,
    "time_lapsed": timeLapsed == null ? null : timeLapsed,
    "mark_weightage": markWeightage == null ? null : markWeightage,
    "test": test == null ? null : test!.toJson(),
    "sortorder": sortorder == null ? null : sortorder,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "__v": v == null ? null : v,
  };
}

class Test {
  Test({
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
  String? chapter;
  String? costing;
  String? duration;
  int? numberOfQues;
  int? sortorder;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Test.fromJson(Map<String, dynamic> json) => Test(
    userRegistered: json["user_registered"] == null ? null : List<dynamic>.from(json["user_registered"].map((x) => x)),
    syllabusTags: json["syllabus_tags"] == null ? null : List<String>.from(json["syllabus_tags"].map((x) => x)),
    id: json["_id"] == null ? null : json["_id"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    chapter: json["chapter"] == null ? null : json["chapter"],
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
    "chapter": chapter == null ? null : chapter,
    "costing": costing == null ? null : costing,
    "duration": duration == null ? null : duration,
    "number_of_ques": numberOfQues == null ? null : numberOfQues,
    "sortorder": sortorder == null ? null : sortorder,
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "__v": v == null ? null : v,
  };
}

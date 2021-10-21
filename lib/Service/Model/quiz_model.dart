// To parse this JSON data, do
//
//     final quizModel = quizModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

QuizModel quizModelFromJson(String str) => QuizModel.fromJson(json.decode(str));

String quizModelToJson(QuizModel data) => json.encode(data.toJson());

class QuizModel {
  QuizModel({
    @required this.status,
    @required this.msg,
    @required this.data,
  });

  dynamic status;
  dynamic msg;
  dynamic data;

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    status: json["status"],
    msg: json["msg"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    @required this.que,
    @required this.opt1,
    @required this.opt2,
    @required this.opt3,
    @required this.opt4,
  });

  dynamic que;
  dynamic opt1;
  dynamic opt2;
  dynamic opt3;
  dynamic opt4;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    que: json["que"],
    opt1: json["opt1"],
    opt2: json["opt2"],
    opt3: json["opt3"],
    opt4: json["opt4"],
  );

  Map<String, dynamic> toJson() => {
    "que": que,
    "opt1": opt1,
    "opt2": opt2,
    "opt3": opt3,
    "opt4": opt4,
  };
}

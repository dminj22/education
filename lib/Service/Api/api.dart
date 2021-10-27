import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:education/Service/Model/QuestionModel.dart';
import 'package:education/Service/Model/chapters_model.dart';
import 'package:education/Service/Model/class_model.dart';
import 'package:education/Service/Model/subject_model.dart';
import 'package:education/Service/Model/test_description_model.dart';

import 'package:logger/logger.dart';

final url = "http://13.126.38.134/api";
Logger log = Logger();
Dio dio = Dio();

Future<ClassModel?> getClass() async {
  final response = await dio.get("$url/admin/allclasses");
  if (response.statusCode == 200) {
    var str = response.data;
    log.d(str);
    return classModelFromJson(json.encode(str));
  } else {
    return null;
  }
}

//by class id
Future<SubjectModel?> getSubjectById(classId) async {
  final response = await dio.get("$url/admin/allsubjectofclasses/$classId");
  if (response.statusCode == 200) {
    var str = response.data;
    log.d(str);
    return subjectModelFromJson(json.encode(str));
  } else {
    return null;
  }
}

//by subject id
Future<ChaptersModel?> getChapterById(subId) async {
  final response = await dio.get("$url/admin/allchapterofsubject/$subId");
  if (response.statusCode == 200) {
    var str = response.data;
    log.d(str);
    return chaptersModelFromJson(json.encode(str));
  } else {
    return null;
  }
}

//by chapter id
Future<TestDescriptionModel?> getTestDesById(chaId) async {
  final response = await dio.get("$url/admin/alltestofchapter/$chaId");
  if (response.statusCode == 200) {
    var str = response.data;
    log.d(str);
    return testDescriptionModelFromJson(json.encode(str));
  } else {
    return null;
  }
}

//by test id
Future<QuestionModel?> getQueById(testId) async {
  final response = await dio.get("$url/admin/allquestionoftest/$testId");
  if (response.statusCode == 200) {
    var str = response.data;
    log.d(str);
    return questionModelFromJson(json.encode(str));
  } else {
    return null;
  }
}

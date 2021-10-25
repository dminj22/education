import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:education/Service/Model/class_model.dart';
import 'package:education/Service/Model/main_category_model.dart';
import 'package:logger/logger.dart';

final url = "http://3.6.39.71:8000";
Logger log = Logger();
Dio dio = Dio();

Future<CategoryModel?> mainCategory() async {
  final response = await dio.get("$url/get_category");
  if (response.statusCode == 200) {
    var str = response.data;
    log.d(str);
    return categoryModelFromJson(json.encode(str));
  } else {
    return null;
  }
}


Future<ClassModel?> getClass(catId) async {
  final response = await dio.get("$url/get_class/$catId");
  if (response.statusCode == 200) {
    var str = response.data;
    log.d(str);
    return classModelFromJson(json.encode(str));
  } else {
    return null;
  }
}
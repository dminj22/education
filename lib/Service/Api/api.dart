import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:education/Service/Model/main_category_model.dart';
import 'package:logger/logger.dart';

final url = "http://13.126.38.134/api";
Logger log = Logger();
Dio dio = Dio();

Future<MainCategoryModel?> mainCategory() async {
  final response = await dio.get("$url/admin/allmaincategory");
  if (response.statusCode == 200) {
    var str = response.data;
    log.d(str);
    return mainCategoryModelFromJson(json.encode(str));
  } else {
    return null;
  }
}

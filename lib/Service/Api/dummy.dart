import 'package:education/Service/Model/quiz_model.dart';
import 'package:flutter/services.dart';
Future<QuizModel?> readQuiz()async{
  final String response = await rootBundle.loadString('assets/quiz.json');
  if(response.isNotEmpty){
    final data = response;
    print(data);
    return quizModelFromJson(data);
  }else{
    return null;
  }
}
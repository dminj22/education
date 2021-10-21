import 'package:flutter/material.dart';

class QuizOverPage extends StatefulWidget {
  const QuizOverPage({Key? key}) : super(key: key);

  @override
  _QuizOverPageState createState() => _QuizOverPageState();
}

class _QuizOverPageState extends State<QuizOverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
        Text('Quiz Over'),
    IconButton(onPressed: (){
      Navigator.pushNamed(context, '/homePage');
    }, icon: Icon(Icons.arrow_forward))
  ],
),),
    );
  }
}

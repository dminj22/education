import 'dart:async';

import 'package:education/Service/Api/dummy.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CourseQuestionPage extends StatefulWidget {
  const CourseQuestionPage({Key? key}) : super(key: key);

  @override
  _CourseQuestionPageState createState() => _CourseQuestionPageState();
}

class _CourseQuestionPageState extends State<CourseQuestionPage> {


  dynamic selected;

  Timer? timer;
  int _start = 10;
  dynamic percent = 0.0;

  int activeStep = 0;

  var pageController = PageController();

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
            percent = _start/10;
            if(percent == 0.0){
              Navigator.pushNamed(context, '/quizOverPage');
            }

          });
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    readQuiz();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: CircularPercentIndicator(
          radius: 30.0,
          lineWidth: 5.0,
          percent: percent,
          progressColor: Colors.green,
        ),
        title: Text("$_start"),
        actions: [TextButton(onPressed: () {}, child: Text('Submit'))],
      ),
      body: ListView(
        children: [

          FutureBuilder(
              future: readQuiz(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var page = <int>[];
                  var data = snapshot.data.data;
                  print(data.length);
                  for(var i = 0 ; i < data.length; i++){
                    page.add(i+1);
                  }
                  return Container(

                    child: Column(
                      children: [
                        NumberStepper(
                          onStepReached: (value){
                            setState(() {
                              pageController.jumpToPage(value);
                            });
                          },
                          stepRadius: 14,
                          numbers: page,
                          lineLength: 15,
                          activeStep: activeStep,
                          lineColor: Colors.grey,
                        ),
                        Container(
                          width: size.width,
                          height: size.height * .84,
                          child: PageView.builder(
                            itemBuilder: (context, position) {
                              return Column(
                                children: [
                                  ListTile(
                                    title: Text("Ques.${position + 1}"),
                                  ),
                                  Card(
                                    child: Container(
                                      width: size.width,
                                      height: size.height * .25,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("${data[position].que}"),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: ListTile(
                                      selected: selected == data[position].opt1 ? true : false,
                                      onTap: () {
                                        setState(() {
                                          selected = data[position].opt1;
                                        });
                                      },
                                      title: Text(data[position].opt1),
                                    ),
                                  ),
                                  Card(
                                    child: ListTile(
                                      selected: selected == data[position].opt2 ? true : false,
                                      onTap: () {
                                        setState(() {
                                          selected = data[position].opt2;
                                        });
                                      },
                                      title: Text(data[position].opt2),
                                    ),
                                  ),
                                  Card(
                                    child: ListTile(
                                      selected: selected == data[position].opt3 ? true : false,
                                      onTap: () {
                                        setState(() {
                                          selected = data[position].opt3;
                                        });
                                      },
                                      title: Text(data[position].opt3),
                                    ),
                                  ),
                                  Card(
                                    child: ListTile(
                                      selected: selected == data[position].opt4 ? true : false,
                                      onTap: () {
                                        setState(() {
                                          selected = data[position].opt4;
                                        });
                                      },
                                      title: Text(data[position].opt4),
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: data.length,
                            controller: pageController,
                            onPageChanged: (value){
                              print(value);
                              setState(() {
                                activeStep = value;
                              });
                            },

                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Icon(Icons.error_outline);
                } else {
                  return CircularProgressIndicator();
                }
              })
        ],
      ),
    );
  }
}

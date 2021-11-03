import 'package:education/Service/Api/api.dart';
import 'package:education/Service/Api/dummy.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';


class CourseQuestionPage extends StatefulWidget {
  const CourseQuestionPage({Key? key, this.testId}) : super(key: key);
  final testId;


  @override
  _CourseQuestionPageState createState() => _CourseQuestionPageState(testId);
}

class _CourseQuestionPageState extends State<CourseQuestionPage> {
  final testId;


  dynamic selected;





  int activeStep = 0;

  var pageController = PageController();

  _CourseQuestionPageState(this.testId);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          bool willLeave = false;
          // show the confirm dialog
          await showDialog(
              context: context,
              builder: (_) => AlertDialog(
            title: Text('Are you sure want to leave?'),

            actions: [
              ElevatedButton(
                  onPressed: () {
                    willLeave = true;
                    Navigator.of(context).pop();
                  },
                  child: Text('Yes')),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('No'))
            ],
          ));
          return willLeave;
        },
        child: FutureBuilder(
            future: getQueById(testId),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if (snapshot.hasData) {

                var page = <int>[];
                var data = snapshot.data.data;
                print(data.length);
                for(var i = 0 ; i < data.length; i++){
                  page.add(i+1);
                }
                return Scaffold(
                  appBar: AppBar(
                    // leading: CircularPercentIndicator(
                    //   radius: 30.0,
                    //   lineWidth: 5.0,
                    //   percent: percent,
                    //   progressColor: Colors.green,
                    // ),
                    // title: Text("$_start"),
                    actions: [TextButton(onPressed: () {}, child: Text('Submit'))],
                  ),
                  body: ListView(
                    children: [
                      Container(
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
                                            child: Text("${data[position].question}"),
                                          ),
                                        ),
                                      ),
                                      Card(
                                        child: ListTile(
                                          selected: selected == data[position].option1 ? true : false,
                                          onTap: () {
                                            setState(() {
                                              selected = data[position].option1;
                                            });
                                          },
                                          title: Text(data[position].option1),
                                        ),
                                      ),
                                      Card(
                                        child: ListTile(
                                          selected: selected == data[position].option2 ? true : false,
                                          onTap: () {
                                            setState(() {
                                              selected = data[position].option2;
                                            });
                                          },
                                          title: Text(data[position].option2),
                                        ),
                                      ),
                                      Card(
                                        child: ListTile(
                                          selected: selected == data[position].option3 ? true : false,
                                          onTap: () {
                                            setState(() {
                                              selected = data[position].option3;
                                            });
                                          },
                                          title: Text(data[position].option3),
                                        ),
                                      ),
                                      Card(
                                        child: ListTile(
                                          selected: selected == data[position].option4 ? true : false,
                                          onTap: () {
                                            setState(() {
                                              selected = data[position].option4;
                                            });
                                          },
                                          title: Text(data[position].option4),
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
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Icon(Icons.error_outline);
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}

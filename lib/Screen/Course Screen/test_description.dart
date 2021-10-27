import 'package:education/Screen/Course%20Screen/question_screen.dart';
import 'package:education/Service/Api/api.dart';
import 'package:flutter/material.dart';

class TestDescriptionPage extends StatefulWidget {
  const TestDescriptionPage({Key? key, this.chaId}) : super(key: key);
  final chaId;

  @override
  _TestDescriptionPageState createState() => _TestDescriptionPageState(chaId);
}

class _TestDescriptionPageState extends State<TestDescriptionPage> {
  final chaId;

  _TestDescriptionPageState(this.chaId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Description"),
      ),
      body: FutureBuilder(
          future: getTestDesById(chaId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data.data;
              return data.isEmpty
                  ? Center(child: Text("Soon Test Will be added"))
                  : ListView(
                      children: [
                        ListTile(
                          dense: true,
                          title: Text("Chapter Name"),
                          subtitle: Text(data[0].chapter.chapterName),
                        ),
                        ListTile(
                          dense: true,
                          title: Text("Title"),
                          subtitle: Text(data[0].title),
                        ),
                        ListTile(
                          dense: true,
                          title: Text("Description"),
                          subtitle: Text(
                            "${data[0].description}",
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text("Time Duration"),
                          trailing: Text(
                            "${data[0].duration} min",
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text("Number Of Question"),
                          trailing: Text(
                            "${data[0].numberOfQues}",
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        ListTile(
                          dense: true,
                          title: Text("Created On"),
                          trailing: Text(
                            "${data[0].createdAt}",
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CourseQuestionPage(testId: data[0].id, time:  20,)));
                            },
                            child: Text("Begin"))
                      ],
                    );
            } else if (snapshot.hasError) {
              return Icon(Icons.error_outline);
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

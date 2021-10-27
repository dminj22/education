import 'package:education/Screen/Course%20Screen/chapter_list_screen.dart';
import 'package:education/Service/Api/api.dart';
import 'package:flutter/material.dart';

class SubjectListScreen extends StatefulWidget {
  const SubjectListScreen({Key? key, this.classId}) : super(key: key);
  final classId;

  @override
  _SubjectListScreenState createState() => _SubjectListScreenState(classId);
}

class _SubjectListScreenState extends State<SubjectListScreen> {
  final classId;

  _SubjectListScreenState(this.classId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subjects"),
      ),
      body: FutureBuilder(
          future: getSubjectById(classId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data.data;
              return data.isEmpty ? Center(child: Text("No Subject"),):
                ListView.builder(itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> CourseHomePage(subId: data[index].id,)));
                      },
                      title: Text(data[index].subjectName),
                    ),
                  );
                },);
            } else if (snapshot.hasError) {
              return Icon(Icons.error_outline);
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

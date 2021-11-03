import 'package:education/Screen/Course%20Screen/subject_list_screen.dart';
import 'package:education/Service/Api/api.dart';
import 'package:flutter/material.dart';

class CourseListPage extends StatefulWidget {
  const CourseListPage({Key? key}) : super(key: key);


  @override
  _CourseListPageState createState() => _CourseListPageState();
}

class _CourseListPageState extends State<CourseListPage> {


  var title = [
    "11th Class",
    "12th Class",
    "SSC"
  ];
  var columnCount = 2;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: FutureBuilder(
          future: getClass(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var cName = snapshot.data.data;
              return ListView(children: [
                Center(child: Padding(
                  padding:  EdgeInsets.all(8),
                  child: Text('For which exam you want to take test today?'),
                )),
                ListView.builder(
                  shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: cName.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SubjectListScreen(classId: cName[index].id,)));
                            },
                            child: Card(
                              elevation: 4,
                              child: ListTile(
                                dense: true,
                                leading: ImageIcon(AssetImage("images/icons/vuesax-bulk-book.png"), size: 30,),
                                title: Text("${cName[index].classesName}"),
                                subtitle: Text("Tap to see ${cName[index].classesName} subjects"),
                                trailing: Icon(Icons.arrow_forward),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
              ],);
            } else if (snapshot.hasError) {
              return Icon(Icons.error_outline);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          })
    );
  }
}

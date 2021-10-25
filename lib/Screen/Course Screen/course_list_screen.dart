import 'package:education/Service/Api/api.dart';
import 'package:flutter/material.dart';

class CourseListPage extends StatefulWidget {
  const CourseListPage({Key? key, this.catId}) : super(key: key);
  final catId;

  @override
  _CourseListPageState createState() => _CourseListPageState(catId);
}

class _CourseListPageState extends State<CourseListPage> {
  _CourseListPageState(this.catId);
  final catId;
  var title = [
    "11th Class",
    "12th Class",
    "SSC"
  ];
  var columnCount = 2;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: getClass(catId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var cName = snapshot.data.data;
              return ListView(children: [
                Center(child: Padding(
                  padding:  EdgeInsets.all(8),
                  child: Text('For which exam you want to take test today?'),
                )),
                GridView.count(
                  childAspectRatio: 1.5,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  crossAxisCount: columnCount,
                  children: List.generate(
                    cName.length,
                        (int index) {
                      return InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/courseHomePage');
                        },
                        child: Card(child: Container(
                          child: Column(children: [
                            Expanded(child: ImageIcon(AssetImage("images/icons/vuesax-bulk-book.png"), size: 50,)),
                            Expanded(child: Center(child: Text(cName[index].className)))
                          ],),
                        )),
                      );
                    },
                  ),
                ),
              ],);
            } else if (snapshot.hasError) {
              return Icon(Icons.error_outline);
            } else {
              return CircularProgressIndicator();
            }
          })
    );
  }
}

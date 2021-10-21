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
      appBar: AppBar(),
      body: ListView(children: [
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
            title.length,
                (int index) {
              return InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/courseHomePage');
                },
                child: Card(child: Container(
                  child: Column(children: [
                    Expanded(child: ImageIcon(AssetImage("images/icons/vuesax-bulk-book.png"), size: 50,)),
                    Expanded(child: Center(child: Text(title[index])))
                  ],),
                )),
              );
            },
          ),
        ),
      ],),

    );
  }
}

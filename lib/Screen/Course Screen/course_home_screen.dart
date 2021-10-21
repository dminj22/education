import 'package:flutter/material.dart';

class CourseHomePage extends StatefulWidget {
  const CourseHomePage({Key? key}) : super(key: key);

  @override
  _CourseHomePageState createState() => _CourseHomePageState();
}

class _CourseHomePageState extends State<CourseHomePage> {
  var title = [
    "Chapter 1",
    "Chapter 2",
    "Chapter 3",
    "Chapter 4",
    "Chapter 5",
    "Chapter 6",
    "Chapter 7",
    "Chapter 8",
    "Chapter 9",
    "Chapter 10",
    "Chapter 11",
    "Chapter 12",
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(headerSliverBuilder: (context, value){
          return [
            SliverAppBar(
              floating: false,
              pinned: true,
              title: Text("Course Name"),
              expandedHeight: 250,
              bottom: TabBar(
                tabs: [
                  Tab(text: "Quiz"),
                  Tab(text: "Tests"),
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  "https://img.freepik.com/free-photo/education-day-arrangement-table-with-copy-space_23-2148721266.jpg?size=626&ext=jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),

          ];
        }, body: TabBarView(children: [
          ListView.builder(
            shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          SizedBox(width: size.width*.01,),
                          ImageIcon(AssetImage("images/icons/vuesax-bulk-book.png")),
                          Text("Course Name")
                        ],),
                      ),
                      ListTile(
                        title: Text(title[0]),
                        subtitle: Row(
                          children: [
                            ImageIcon(AssetImage("images/icons/vuesax-bulk-people.png")),
                            Text("0.0k enroll"),
                          ],
                        ),
                        trailing: TextButton.icon(
                            autofocus: true,
                            onPressed: (){
                              Navigator.pushNamed(context, '/courseQuestionPage');
                            }, icon: ImageIcon(AssetImage("images/icons/vuesax-bulk-arrow-right.png")), label: Text('Start Quiz')),
                      ),
                      // Container(
                      //   width: size.width,
                      //   height: size.height*.01,
                      //   color: Colors.grey,
                      // )
                    ],
                  ),
                );
              },
            ),
          ListView.builder(
            shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          SizedBox(width: size.width*.01,),
                          Icon(Icons.tag),
                          Text("Course Name")
                        ],),
                      ),
                      ListTile(
                        title: Text(title[0]),
                        subtitle: Row(
                          children: [
                            ImageIcon(AssetImage("images/icons/vuesax-bulk-people.png")),
                            Text("tests"),
                          ],
                        ),
                        trailing: TextButton.icon(
                            autofocus: true,
                            onPressed: (){}, icon: Icon(Icons.arrow_forward), label: Text('Start Quiz')),
                      ),
                      // Container(
                      //   width: size.width,
                      //   height: size.height*.04,
                      //   color: Colors.grey,
                      // )
                    ],
                  ),
                );
              },
            ),
        ])),
      )
    );
  }
}

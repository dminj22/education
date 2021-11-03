import 'package:education/Screen/Course%20Screen/test_description.dart';
import 'package:education/Service/Api/api.dart';
import 'package:flutter/material.dart';

class CourseHomePage extends StatefulWidget {
  const CourseHomePage({Key? key, this.subId, this.subName}) : super(key: key);
  final subId;
  final subName;

  @override
  _CourseHomePageState createState() => _CourseHomePageState(subId, subName);
}

class _CourseHomePageState extends State<CourseHomePage> {
  final subId;
  final subName;

  _CourseHomePageState(this.subId, this.subName);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: DefaultTabController(
          length: 1,
          child: NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [
                  SliverAppBar(
                    floating: false,
                    pinned: true,
                    title: Text(subName),
                    expandedHeight: 250,
                    bottom: TabBar(
                      tabs: [
                        Tab(text: "Exam"),
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
              },
              body: TabBarView(children: [
                FutureBuilder(
                    future: getChapterById(subId),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data.data;
                        return data.isEmpty
                            ? Center(
                                child: Text("Soon We will update"),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                  elevation: 4,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: size.width * .01,
                                              ),
                                              ImageIcon(AssetImage(
                                                  "images/icons/vuesax-bulk-book.png")),
                                              SizedBox(
                                                width: size.width * .01,
                                              ),
                                              Text("${data[index].chapterName}")
                                            ],
                                          ),
                                        ),
                                        ListTile(
                                          dense: true,
                                          // title: Text(data[index].chapterName),
                                          subtitle: Row(
                                            children: [
                                              ImageIcon(AssetImage(
                                                  "images/icons/vuesax-bulk-people.png")),
                                              Text("0.0k enroll"),
                                            ],
                                          ),
                                          trailing: TextButton.icon(
                                              autofocus: true,
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TestDescriptionPage(
                                                              chaId: data[index]
                                                                  .id,
                                                            )));
                                              },
                                              icon: ImageIcon(AssetImage(
                                                  "images/icons/vuesax-bulk-arrow-right.png")),
                                              label: Text('Start Quiz')),
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
                              );
                      } else if (snapshot.hasError) {
                        return Icon(Icons.error_outline);
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ])),
        ));
  }
}

import 'package:education/Screen/Home%20Screen/TabScreen/doubts_tabbar/all_doubts_screen.dart';
import 'package:flutter/material.dart';

class DoubtsScreen extends StatefulWidget {
  const DoubtsScreen({Key? key}) : super(key: key);

  @override
  _DoubtsScreenState createState() => _DoubtsScreenState();
}

class _DoubtsScreenState extends State<DoubtsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                leading:Icon(Icons.person),
                title: SizedBox(height: 30,
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context , '/createDoubtPage');
                    },
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.camera_alt),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        )
                      ),
                    ),
                  ),
                ),
                actions: [
                  Icon(Icons.camera_alt, color: Colors.transparent,)
                ],
                floating: true,
                pinned: true,

                expandedHeight: 100,
                bottom: TabBar(
                  tabs: [
                    Tab(text: "All Doubts"),
                    Tab(text: "Your Doubts"),
                    Tab(text: "Your Answers"),
                  ],
                ),
                flexibleSpace: FlexibleSpaceBar(

                ),
              ),
            ];
          },
          body: TabBarView(children: [
        AllDoubtsScreen(),
        AllDoubtsScreen(),
        AllDoubtsScreen(),
          ])),
    );
  }
}

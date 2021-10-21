import 'package:flutter/material.dart';

class LeaderBoardPage extends StatefulWidget {
  const LeaderBoardPage({Key? key}) : super(key: key);

  @override
  _LeaderBoardPageState createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: size.width,
              height: size.height * .25,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 40,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://img.etimg.com/thumb/width-1200,height-900,imgsize-41900,resizemode-1,msid-80691574/industry/media/entertainment/virat-kohli-remains-indias-most-valuable-celebrity-with-brand-value-of-237-7-mn.jpg"),
                        radius: 35,
                      ),
                    ),
                  )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                            backgroundColor: Colors.yellow,
                            radius: 80,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://ichef.bbci.co.uk/news/976/cpsprodpb/C26C/production/_111927794_gettyimages-1192169655.jpg"),
                              radius: 75,
                            )),
                      )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.pinkAccent,
                      radius: 40,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://img.etimg.com/thumb/width-1200,height-900,imgsize-41900,resizemode-1,msid-80691574/industry/media/entertainment/virat-kohli-remains-indias-most-valuable-celebrity-with-brand-value-of-237-7-mn.jpg"),
                        radius: 35,
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Card(
              child: ListTile(
                dense: true,
                title: Text('Your Currently Rank'),
                trailing: Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Rank"),
                      ImageIcon(
                        AssetImage(
                          'images/icons/vuesax-bulk-arrow-circle-up.png',
                        ),
                        color: Colors.green,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: size.shortestSide,
              height: size.shortestSide,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      dense: true,
                      title: Text('Your Currently Rank'),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Rank"),
                            ImageIcon(
                              AssetImage(
                                'images/icons/vuesax-bulk-arrow-circle-up.png',
                              ),
                              color: Colors.green,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

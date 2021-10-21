import 'package:education/Style/Utility.dart';
import 'package:flutter/material.dart';

class IssueConnectionPage extends StatefulWidget {
  const IssueConnectionPage({Key? key}) : super(key: key);

  @override
  _IssueConnectionPageState createState() => _IssueConnectionPageState();
}

class _IssueConnectionPageState extends State<IssueConnectionPage> {
  Utility util = Utility();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/no-internet.png"),
            Text("Check Connection"),
            ElevatedButton(
              onPressed: () {
                util.checkConnection(context);
              },
              child: Text("Refresh"),
            )
          ],
        ),
      ),
    );
  }
}

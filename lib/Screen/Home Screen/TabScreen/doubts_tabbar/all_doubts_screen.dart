import 'package:flutter/material.dart';

class AllDoubtsScreen extends StatefulWidget {
  const AllDoubtsScreen({Key? key}) : super(key: key);

  @override
  _AllDoubtsScreenState createState() => _AllDoubtsScreenState();
}

class _AllDoubtsScreenState extends State<AllDoubtsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 2, itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
            child: Column(children: [
              ListTile(
                dense: true,
                leading: Icon(Icons.person),
                title: Text("User Name"),
                subtitle: Text("Type of Question"),
                trailing: Icon(Icons.more_vert_outlined),
              ),
              ListTile(
                dense: true,
                title: Text("Comment By users"),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network("https://images.ctfassets.net/hrltx12pl8hq/3MbF54EhWUhsXunc5Keueb/60774fbbff86e6bf6776f1e17a8016b4/04-nature_721703848.jpg?fit=fill&w=480&h=270"),
              ),
              ),
              ListTile(
                leading: Icon(Icons.thumb_up_alt_sharp),
                title: SizedBox(height: 30,
                  child: InkWell(
                    onTap: (){},
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintStyle: TextStyle(fontSize: 10),
                        hintText: "       Tap to give answers",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          )
                      ),
                    ),
                  )),
              )
            ],),
          ),
        );
      },),
    );
  }
}

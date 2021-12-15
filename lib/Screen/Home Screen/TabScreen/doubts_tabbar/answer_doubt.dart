import 'package:flutter/material.dart';

class AnswerDoubtPage extends StatefulWidget {
  const AnswerDoubtPage({Key? key}) : super(key: key);

  @override
  _AnswerDoubtPageState createState() => _AnswerDoubtPageState();
}

class _AnswerDoubtPageState extends State<AnswerDoubtPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Answer to this Doubt"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("User Name"),
            subtitle: Text(''),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
                "https://images.ctfassets.net/hrltx12pl8hq/3MbF54EhWUhsXunc5Keueb/60774fbbff86e6bf6776f1e17a8016b4/04-nature_721703848.jpg?fit=fill&w=480&h=270"),
          ),
          TextField(
            maxLines: 10,
            decoration: InputDecoration(
              hintText: "Provide a details answer for complete clarity"
            ),
          )
        ],
      ),
      bottomSheet: Container(
        child: Row(children: [
          IconButton(onPressed: (){
            // getImage();
          }, icon: Icon(Icons.camera_alt)),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){}, child: Text("NEXT")),
          ))
        ],),
      ),
    );
  }
}

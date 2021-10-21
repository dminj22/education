import 'package:education/Style/widget.dart';
import 'package:flutter/material.dart';

class PassPage extends StatefulWidget {
  const PassPage({Key? key}) : super(key: key);

  @override
  _PassPageState createState() => _PassPageState();
}

class _PassPageState extends State<PassPage> {
  var plan;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Pass"),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(child: Column(children: [
              ListTile(
                onTap: (){
                  setState(() {
                    plan = 1;
                  });
                },
                leading: Radio(value: 1, groupValue: plan, onChanged: (value){
                  setState(() {
                    plan = value;
                  });
                }),
                title: Text('Monthly Plan'),
                subtitle: Text("Valid for 30 days"),
             trailing: Text("₹249"),
              ),
              Container(width: size.width, height: size.height*.01,color: Colors.blue,)
            ],),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: EDButton(child: Text("Buy"), onPressed: (){},),
        ),
      ],),
    );
  }
}

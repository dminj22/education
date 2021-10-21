import 'package:education/Style/variables.dart';
import 'package:flutter/material.dart';


class ShowPassPage extends StatefulWidget {
  const ShowPassPage({Key? key}) : super(key: key);

  @override
  _ShowPassPageState createState() => _ShowPassPageState();
}

class _ShowPassPageState extends State<ShowPassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        ListTile(
          title: Text('Days Remaining', style: mediumFont,),
          subtitle: Text("--/--" , style: lightFont,),
          trailing: TextButton(onPressed: (){}, child: Text("Buy Pass" , style: normalFont,),),
        ),
        Divider(),
        ListTile(
          title: Text('Expiry Date', style: mediumFont,),
          subtitle: Text("--/--" , style: lightFont,),
        ),


      ],),
    );
  }
}

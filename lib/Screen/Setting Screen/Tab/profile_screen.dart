import 'package:education/Style/Utility.dart';
import 'package:education/Style/variables.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool nameEdit = false;
  bool pinCodeEdit = false;
  bool dobEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        ListTile(
          title: Text("Name", style: mediumFont,),
          subtitle:nameEdit? TextField(
            onSubmitted: (value){
              showSnackBar(context, "Name Updated Successfully");
              setState(() {
                nameEdit = false;
              });
            },
          ) : Text("User Name Will be shown here", style: lightFont,),
          trailing: InkWell(
              onTap: (){
                setState(() {
                  nameEdit =! nameEdit;
                });
              },
              child: Icon(Icons.edit)),
        ),
        Divider(),
        ListTile(
          title: Text("Pincode", style: mediumFont,),
          subtitle:pinCodeEdit? TextField(
            onSubmitted: (value){
              showSnackBar(context, "Name Updated Successfully");
              setState(() {
                pinCodeEdit = false;
              });
            },
          ) : Text("--/--", style: lightFont,),
          trailing: InkWell(
              onTap: (){
                setState(() {
                  pinCodeEdit =! pinCodeEdit;
                });
              },
              child: Icon(Icons.edit)),
        ),
        Divider(),
        ListTile(
          title: Text("Date Of Birth", style: mediumFont,),
          subtitle:dobEdit? TextField(
            onSubmitted: (value){
              showSnackBar(context, "Name Updated Successfully");
              setState(() {
                dobEdit = false;
              });
            },
          ) : Text("--/--", style: lightFont,),
          trailing: InkWell(
              onTap: (){
                setState(() {
                  dobEdit =! dobEdit;
                });
              },
              child: Icon(Icons.edit)),
        ),
      ],),
    );
  }
}

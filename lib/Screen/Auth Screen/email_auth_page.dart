
import 'package:education/Provider/user_provider.dart';
import 'package:education/Service/Api/api.dart';
import 'package:education/Service/Model/email_sign_up_model.dart';
import 'package:education/Style/Utility.dart';
import 'package:education/Style/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailAuthPage extends StatefulWidget {
  const EmailAuthPage({Key? key}) : super(key: key);

  @override
  _EmailAuthPageState createState() => _EmailAuthPageState();
}

class _EmailAuthPageState extends State<EmailAuthPage> {
  Utility util = Utility();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  saveUser(token, userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', token);
    pref.setString('userId', userId);
  }

  Future<void> emailSignUpHandle(context , token , userId) async {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        mobileController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passController.text.isNotEmpty) {
      try {
        util.showSnackBar(context, "Please Wait");
        var firstName = firstNameController.text;
        var lastName = lastNameController.text;
        var mobile = mobileController.text;
        var email = emailController.text;
        var password = passController.text;
        EmailSignUpModel? model =
            await emailSignUp(firstName, lastName, mobile, email, password);
        if (model!.status == true) {
          saveUser(model.token, model.user!.id);
          token = model.token;
          userId = model.user!.id;
          Navigator.pushNamed(context, '/homePage');
          util.showSnackBar(context, "Welcome ${model.user!.firstname}");
        }
      } catch (e) {
        print(e);
      }
    } else {
      util.showSnackBar(context, "Fill All Details");
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: ListView(
        children: [
          EDTextField(
            controller: firstNameController,
            label: Text("First Name"),
          ),
          EDTextField(
            controller: lastNameController,
            label: Text("Last Name"),
          ),
          EDTextField(
            controller: mobileController,
            label: Text("Mobile Number"),
          ),
          EDTextField(
            controller: emailController,
            label: Text("Email Id"),
          ),
          EDTextField(
            controller: passController,
            label: Text("Password"),
          ),
          EDButton(
            onPressed: () {
              emailSignUpHandle(context, user.token , user.userId);
            },
            child: Text("Sign Up"),
          )
        ],
      ),
    );
  }
}

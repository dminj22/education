import 'package:education/Style/Utility.dart';
import 'package:education/Style/variables.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key, this.phone}) : super(key: key);
  final phone;

  @override
  _OtpPageState createState() => _OtpPageState(phone);
}

class _OtpPageState extends State<OtpPage> {
  final phone;

  _OtpPageState(this.phone);

  Utility util = Utility();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(login),
      ),
      body: Container(
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Please Enter the OTP send to"),
              Row(
                children: [
                  Text("$phone"),
                  TextButton(onPressed: () {}, child: Text("change"))
                ],
              ),
              Text("Enter 6 digit code"),
              PinCodeTextField(
                  pinTheme: PinTheme(fieldWidth: 50),
                  appContext: context,
                  length: 6,
                  onChanged: (value) {
                    if (value.length == 6) {
                      if (value == "123456") {
                        Navigator.pushNamed(context, "/homePage");
                        util.showSnackBar(context, "Otp Verified");
                      } else {
                        util.showSnackBar(context, "Wrong Otp");
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

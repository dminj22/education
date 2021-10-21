import 'package:education/Screen/Auth%20Screen/otp_page.dart';
import 'package:education/Style/Utility.dart';
import 'package:education/Style/variables.dart';
import 'package:education/Style/widget.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mobile_number_picker/mobile_number_picker.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, this.phone}) : super(key: key);
  final phone;

  @override
  _SignUpPageState createState() => _SignUpPageState(phone);
}

class _SignUpPageState extends State<SignUpPage> {
  _SignUpPageState(this.phone);
  final phone;

  Utility util = Utility();
  MobileNumberPicker mobileNumber = MobileNumberPicker();

  var mobileController = TextEditingController();

  getNumber() {
    mobileNumber.mobileNumber();
    mobileNumber.getMobileNumberStream.listen((event) {
      print(event!.completeNumber);
      if(event.phoneNumber.toString() != "1234567890"){
        mobileController.text = event.phoneNumber.toString();
        Navigator.pushNamed(context, '/otpPage',
            arguments: OtpPage(
              phone: mobileController.text,
            ));
        util.showSnackBar(context, "OTP send to +91${mobileController.text}");
      }else{
        util.showSnackBar(context, "Enter Mobile Number");
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getNumber();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mobileController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      gestures: [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: Scaffold(
        appBar: AppBar(
          title: Text(signUp),
          actions: [TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text(login))],
        ),
        body: Container(
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    EDTextField(
                      controller: mobileController,
                      prefixIcon: Icon(Icons.call),
                      keyboardType: TextInputType.phone,
                    ),
                    EDButton(
                      onPressed: () {
                        util.showSnackBar(context,
                            "OTP send to +91${mobileController.text}");
                        Navigator.pushNamed(context, '/otpPage',
                            arguments: OtpPage(
                              phone: mobileController.text,
                            ));
                      },
                      child: Text("Continue"),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Do have an account?"),
                        EDTextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(login),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19),
                      child: FittedBox(
                        child: Row(
                          children: [
                            Text("By continuing you agree to Education's"),
                            EDTextButton(
                              onPressed: () {},
                              child: Text("Privacy Policy"),
                            ),
                            Text("and"),
                            EDTextButton(
                              onPressed: () {},
                              child: Text("Terms of Services"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

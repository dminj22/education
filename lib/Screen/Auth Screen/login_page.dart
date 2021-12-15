import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:education/Provider/user_provider.dart';
import 'package:education/Screen/Auth%20Screen/otp_page.dart';
import 'package:education/Screen/Auth%20Screen/sign_up_page.dart';
import 'package:education/Service/Api/api.dart';
import 'package:education/Service/Model/email_sign_up_model.dart';
import 'package:education/Service/Social/google.dart';
import 'package:education/Style/Utility.dart';
import 'package:education/Style/variables.dart';
import 'package:education/Style/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:mobile_number_picker/mobile_number_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Utility util = Utility();
  MobileNumberPicker mobileNumber = MobileNumberPicker();

  var mobileController = TextEditingController();

  var emailController = TextEditingController();
  var passController = TextEditingController();

  checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    print(connectivityResult);
    if (connectivityResult == ConnectivityResult.mobile) {
      getNumber();
      print("I am connected to a mobile network.");
    } else if (connectivityResult == ConnectivityResult.wifi) {
      getNumber();
      print("I am connected to a wifi network.");
    } else if (connectivityResult == ConnectivityResult.none) {
      Navigator.pushNamed(context, '/issueConnectionPage');
    }
  }

  getNumber() {
    mobileNumber.mobileNumber();
    mobileNumber.getMobileNumberStream.listen((event) {
      print(event!.completeNumber);
      if (event.phoneNumber.toString() != "1234567890") {
        mobileController.text = event.phoneNumber.toString();
        Navigator.push(
            context,
            PageTransition(
              child: OtpPage(
                phone: mobileController.text,
              ),
              type: PageTransitionType.topToBottom,
            ));
        util.showSnackBar(context, "OTP send to +91${mobileController.text}");
      } else {
        util.showSnackBar(context, "Enter Mobile Number");
      }
    });
  }

  saveUser(token, userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', token);
    pref.setString('userId', userId);
  }

  emailSignHandle(token, userId) async {
    if (emailController.text.isNotEmpty && passController.text.isNotEmpty) {
      try {
        var email = emailController.text;
        var password = passController.text;
        EmailSignUpModel? model = await emailSignIn(email, password);
        if (model!.status == true) {
          saveUser(model.token, model.user!.id);
          token = model.token;
          userId = model.user!.id;
          Navigator.pushNamedAndRemoveUntil(
              context, '/homePage', (route) => false);
          util.showSnackBar(context, "Welcome ${model.user!.firstname}");
        } else {
          util.showSnackBar(context, "${model.msg}");
        }
      } catch (e) {
        print(e);
      }
    } else {
      util.showSnackBar(context, "Enter Email & Password");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkConnection();
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
    var user = Provider.of<UserProvider>(context);
    return KeyboardDismisser(
      gestures: [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: Scaffold(
        appBar: AppBar(
          title: Text(login),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/emailAuthPage");
                },
                child: Text(signUp))
          ],
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
                        if (mobileController.text.length == 10) {
                          util.showSnackBar(context,
                              "OTP send to +91${mobileController.text}");
                          Navigator.pushNamed(context, '/otpPage',
                              arguments: SignUpPage(
                                phone: mobileController.text,
                              ));
                        } else {
                          util.showSnackBar(context, "Invalid Mobile Number");
                        }
                      },
                      child: Text("Continue"),
                    ),
                    EDTextField(
                      label: Text("Email Id"),
                      controller: emailController,
                    ),
                    EDTextField(
                      label: Text("Password"),
                      controller: passController,
                    ),
                    EDButton(
                      onPressed: () {
                        emailSignHandle(user.token, user.userId);
                      },
                      child: Text("Sign In"),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  EDButton(
                    onPressed: () async {
                      await googleSignIn(context);
                    },
                    child: Text("Sign in with Google"),
                  ),
                  EDButton(
                    onPressed: () async {
                      final LoginResult result =
                          await FacebookAuth.instance.login();
                      if (result.status == LoginStatus.success) {
                        Navigator.pushNamed(context, '/homePage');
                        final AccessToken accessToken = result.accessToken!;
                        print(accessToken.userId);
                      }
                    },
                    child: Text("Sign in with Facebook"),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        EDTextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signUpPage');
                          },
                          child: Text("Sign Up"),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

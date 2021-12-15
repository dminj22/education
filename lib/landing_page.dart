import 'package:education/Provider/user_provider.dart';
import 'package:education/Screen/Auth%20Screen/login_page.dart';
import 'package:education/Screen/Home%20Screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> token;
  late Future<String> userId;

  @override
  void initState() {
    super.initState();
    token = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('token') ?? "");
    });
    userId = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('userId') ?? "");
    });
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context);
    return FutureBuilder<List<String>>(
        future: Future.wait([token, userId]),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              if (snapshot.data![0] == "" && snapshot.data![1] == "") {
                return LoginPage();
              } else if (snapshot.data![0] != "" && snapshot.data![1] != "") {
                user.token = snapshot.data![0];
                user.userId = snapshot.data![1];
                return HomePage();
              } else {
                return LoginPage();
              }
          }
          return LoginPage();
        });
  }
}

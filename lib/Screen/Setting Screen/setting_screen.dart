import 'package:education/Screen/Setting%20Screen/Tab/account_screen.dart';
import 'package:education/Screen/Setting%20Screen/Tab/pass_screen.dart';
import 'package:education/Screen/Setting%20Screen/Tab/profile_screen.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Profile",
              ),
              Tab(
                text: "Account",
              ),
              Tab(
                text: "Pass",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            ProfilePage(),
            AccountSettingPage(),
            ShowPassPage()

          ],
        ),
      ),
    );
  }
}

import 'package:education/Style/variables.dart';
import 'package:education/Style/widget.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class AccountSettingPage extends StatefulWidget {
  const AccountSettingPage({Key? key}) : super(key: key);

  @override
  _AccountSettingPageState createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
  final GlobalKey<ExpansionTileCardState> passTile = new GlobalKey();

  var passwordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var againPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "General",
              style: boldFont,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    title: Text(
                      "Email Id",
                      style: mediumFont,
                    ),
                    subtitle: Text(
                      'dminj22@gmail.com',
                      style: lightFont,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    title: Text(
                      "Phone Number",
                      style: mediumFont,
                    ),
                    subtitle: Text(
                      '7049202363',
                      style: lightFont,
                    ),
                  ),
                  ExpansionTileCard(
                    title: Text(
                      "Password",
                      style: mediumFont,
                    ),
                    subtitle: Text(
                      "*********",
                      style: lightFont,
                    ),
                    key: passTile,
                    children: [
                      EDTextField(

                        label: Text("   Password"),
                        controller: passwordController,
                        obscureText: true,
                      ),
                      EDTextField(
                        label: Text("   New Password"),
                        controller: newPasswordController,
                        obscureText: true,
                      ),
                      EDTextField(
                        label: Text("   Again Password"),
                        controller: againPasswordController,
                        obscureText: true,
                      ),
                      EDButton(
                        onPressed: () {},
                        child: Text(
                          "Confirm",
                          style: mediumFont,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

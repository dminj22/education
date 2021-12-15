import 'package:education/Provider/dark_mode_provider.dart';
import 'package:education/Provider/user_provider.dart';
import 'package:education/Screen/Home%20Screen/TabScreen/doubts_screen.dart';
import 'package:education/Screen/Home%20Screen/TabScreen/home_screen.dart';

import 'package:education/Style/restart.dart';
import 'package:education/Style/widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  setDarkMode(darkMode) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('dark', darkMode);
  }
  logout(token, userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', token);
    pref.setString('userId', userId);
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    DoubtsScreen(),
  ];



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var dark = Provider.of<DarkModeProvider>(context);
    var user = Provider.of<UserProvider>(context);
    var size = MediaQuery.of(context).size;
    print(user.userId);
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        actions: [
          IconButton(onPressed: (){}, icon: ImageIcon(AssetImage("images/icons/vuesax-bulk-notification.png"))),
          IconButton(onPressed: (){}, icon: ImageIcon(AssetImage("images/icons/vuesax-bulk-search-status-1.png")))

        ],
      ),
      drawer: Drawer(

        child: Container(
          height: size.height,
          child: Column(
            children: [
              DrawerHeader(child: Container()),
              EDDrawerListTile(
                leading: ImageIcon(AssetImage("images/icons/vuesax-bulk-teacher.png")),
                title: "Home",
              ),
              EDDrawerListTile(
                leading: ImageIcon(AssetImage("images/icons/vuesax-bulk-ticket-star.png")),
                title: "Pass",
                onTap: (){
                  Navigator.pushNamed(context, '/passPage');
                },
              ),
              EDDrawerListTile(
                leading: ImageIcon(AssetImage("images/icons/vuesax-bulk-direct.png")),
                title: "Support",
              ),
              EDDrawerListTile(
                leading: ImageIcon(AssetImage("images/icons/vuesax-bulk-candle-2.png")),
                title: "Dark Mode",
                trailing: Switch(
                  value: dark.darkMode,
                  onChanged: (bool value) {
                    setState(() {
                      dark.darkMode = value;
                      setDarkMode(dark.darkMode);
                      RestartWidget.restartApp(context);
                    });
                  },
                ),
              ),
              EDDrawerListTile(
                leading: ImageIcon(AssetImage("images/icons/vuesax-bulk-setting-2.png")),
                title: "Settings",
                onTap: (){
                  Navigator.pushNamed(context, '/settingPage');
                },
              ),
              EDDrawerListTile(
                leading: ImageIcon(AssetImage("images/icons/vuesax-bulk-key.png")),
                title: "Privacy & Policy",
              ),
              EDDrawerListTile(
                leading: ImageIcon(AssetImage("images/icons/vuesax-bulk-security-user.png")),
                title: "Terms & Conditions",
              ),
              EDDrawerListTile(
                onTap: (){
                  logout("", "");
                  Navigator.pushNamedAndRemoveUntil(context, '/loginPage', (route) => false);
                },
                leading: ImageIcon(AssetImage("images/icons/vuesax-bulk-lock.png")),
                title: "Logout",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("images/icons/vuesax-bulk-teacher.png")),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("images/icons/vuesax-bulk-ticket-star.png")),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("images/icons/vuesax-bulk-direct.png")),
            label: 'Doubts',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightGreen,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

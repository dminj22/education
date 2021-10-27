import 'package:education/Provider/dark_mode_provider.dart';
import 'package:education/Screen/Auth%20Screen/login_page.dart';
import 'package:education/Screen/Connection/issue_connectivity.dart';
import 'package:education/Screen/Course%20Screen/chapter_list_screen.dart';
import 'package:education/Screen/Course%20Screen/question_screen.dart';
import 'package:education/Screen/Course%20Screen/quiz_over.dart';
import 'package:education/Screen/Pass%20Screen/pass_screen.dart';
import 'package:education/Screen/Setting%20Screen/Tab/account_screen.dart';
import 'package:education/Screen/Setting%20Screen/setting_screen.dart';
import 'package:education/Style/restart.dart';
import 'package:education/landing_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screen/Auth Screen/otp_page.dart';
import 'Screen/Auth Screen/sign_up_page.dart';
import 'Screen/Course Screen/class_list_screen.dart';
import 'Screen/Home Screen/home_page.dart';
import 'Screen/LeaderBoard Screen/leader_board_screen.dart';
import 'Style/theme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });



  runApp(RestartWidget(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late Future<bool> darkMode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    darkMode = _prefs.then((SharedPreferences prefs) {
      return (prefs.getBool('dark') ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DarkModeProvider())
      ],
      child: FutureBuilder(
          future: darkMode,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              var dark = Provider.of<DarkModeProvider>(context);

              dark.darkMode = snapshot.data;

              return MaterialApp(
                builder: (context, child) {
                  return MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                      child: child!);
                },
                routes: {
                  "/loginPage": (context) => LoginPage(),
                  "/signUpPage": (context) => SignUpPage(),
                  "/otpPage": (context) => OtpPage(),
                  "/homePage": (context) => HomePage(),
                  "/courseHomePage": (context) => CourseHomePage(),
                  "/courseQuestionPage": (context) => CourseQuestionPage(),
                  "/quizOverPage": (context) => QuizOverPage(),
                  "/issueConnectionPage": (context) => IssueConnectionPage(),
                  "/courseListPage": (context) => CourseListPage(),
                  "/leaderBoardPage": (context) => LeaderBoardPage(),
                  "/passPage": (context) => PassPage(),
                  "/settingPage": (context) => SettingPage(),
                  "/accountSettingPage": (context) => AccountSettingPage(),
                },
                theme: Styles.themeData(snapshot.data, context),
                home: LandingPage(),
              );
            } else if (snapshot.hasError) {
              return Icon(Icons.error_outline);
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

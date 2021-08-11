import 'package:flutter/material.dart';
import 'package:flutter_Onboarding/onboadringhome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './homepage.dart';

int initScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Onboarding',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: OnBoardHome.routename,
      routes: {
        OnBoardHome.routename: (ctx) => OnBoardHome(),
        MyHomePage.routename: (ctx) => MyHomePage()
      },
    );
  }
}

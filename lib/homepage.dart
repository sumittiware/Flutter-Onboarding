import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  static const routename = '/homepage';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Onboaring'),
      ),
      body: Center(
        child: Text('Entered the app after on onboarding!!!'),
      ),
    );
  }
}

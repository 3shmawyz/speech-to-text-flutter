import 'package:flutter/material.dart';
import 'package:speechtotext/screens/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
       accentColor: Colors.white
      ),
      home: Home(),
    );
  }
}

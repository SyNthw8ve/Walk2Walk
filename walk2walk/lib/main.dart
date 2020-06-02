import 'package:flutter/material.dart';
import 'screens/home/home.dart';

void main() => runApp(MyApp());

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      home: Home()
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

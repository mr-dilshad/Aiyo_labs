import 'package:flutter/material.dart';

import 'UI/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aiyo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(title: "AiyoLabs"),
    );
  }
}


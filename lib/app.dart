import 'package:flutter/material.dart';
import 'package:sporttt/ui/login_screen.dart';
import './ui/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soccer',
      debugShowCheckedModeBanner: false,
      home: LognPage(),
    );
  }
}

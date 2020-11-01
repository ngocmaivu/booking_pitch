import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sporttt/ui/login_screen.dart';
import './ui/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Promotion Platform',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color.fromRGBO(236, 240, 243, 1),
        lightSource: LightSource.topLeft,
        depth: 20,
        intensity: 1,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      home: LognPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tabor/layout/layout_screen.dart';
import 'package:tabor/modules/login/login_screen.dart';
import 'package:tabor/modules/on_bording/on_bording.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffE9EBEB),
        primarySwatch: Colors.green,
        fontFamily: 'ReadexPro',
      ),
      debugShowCheckedModeBanner: false,
      home: Directionality(
          textDirection: TextDirection.rtl, child: onBoardingScreen()),
    );
  }
}

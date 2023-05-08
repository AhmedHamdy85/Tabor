import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/layout/layout_screen.dart';
import 'package:tabor/modules/login/login_screen.dart';
import 'package:tabor/modules/on_bording/on_bording.dart';
import 'package:tabor/shared/network/local/cashe_helper.dart';
import 'package:tabor/shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  CasheHelper.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar','EG'),
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

import 'package:flutter/material.dart';
import 'package:tabor/layout/cubit/logic.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();

class Variables {
  static var selectedServise = 0;
}

const Color mainColor = Color(0xff009c7b);
int x = 15;
String token = '';
String refreshToken = '';
num? id;

const googleKey = 'AIzaSyDwB2nI3G71zR6bSyIHEb5bheCMTyOkTZ4';

Map<String, String> banksLogo = {
  'البنك الاهلى':
      'http://www.citystars-heliopolis.com.eg/public/images/brand_logo/rkNYnmDFMx-main.jpeg?1506775959531',
  'بنك مصر':
      'https://play-lh.googleusercontent.com/tnKul4kP0mldSGs06J3mjkwUDKox6-TmPfwzGO8ZJQ6_CUkuryF9IcMp4Gp64fIMfmY=w480-h960-rw',
  'بنك القاهرة':
      'https://www.agri2day.com/wp-content/uploads/2022/05/%D8%B1%D9%82%D9%85-%D8%AE%D8%AF%D9%85%D8%A9-%D8%B9%D9%85%D9%84%D8%A7%D8%A1-%D8%A8%D9%86%D9%83-%D8%A7%D9%84%D9%82%D8%A7%D9%87%D8%B1%D8%A9-%D8%A7%D9%84%D8%AE%D8%B7-%D8%A7%D9%84%D8%B3%D8%A7%D8%AE%D9%86.jpeg',
  'اتصالات':
      'https://www.xadtechnologies.com/wp-content/uploads/2022/10/Eti-New-logo.png',
};
/*
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
 */
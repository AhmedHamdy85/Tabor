//import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
final scaffoldKey = GlobalKey<ScaffoldState>();
var selectedTransport=0;
var selectedServise=0;
DateTime? date ;
//TimeOfDay? time ;
String formattedDate = DateFormat.yMMMEd().format(date!);
//String formattedtime = time!.format(c).toString();
//String formattedDate = DateFormat('dd MMMM yyyy').format(now);

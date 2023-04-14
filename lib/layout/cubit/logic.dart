import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/layout/cubit/states.dart';
import 'package:tabor/modules/Home/homeScreen.dart';
import 'package:tabor/modules/favoret/favoret_screen.dart';
import 'package:tabor/modules/tecket/tecket_scrren.dart';

class layoutCubit extends Cubit<layoutStates> {
  layoutCubit() : super(layoutInatialState());

  static layoutCubit get(context) => BlocProvider.of(context);

  int curentIndex = 0;

  List<Widget> bottmScreen = [HomeScreen(), TecketScrren(), FavoretScreen()];
  void changeNaveBar(int index) {
    curentIndex = index;
    emit(changeBottmnaveState());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/layout/cubit/states.dart';
import 'package:tabor/modules/Home/homeScreen.dart';
import 'package:tabor/modules/favoret/favoret_screen.dart';
import 'package:tabor/modules/tecket/tecket_scrren.dart';
import 'package:tabor/shared/endpints.dart';
import 'package:tabor/shared/network/remote/dio_helper.dart';

import '../../model/bankmodels/allbanks.dart';

class layoutCubit extends Cubit<layoutStates> {
  layoutCubit() : super(layoutInatialState());

  static layoutCubit get(context) => BlocProvider.of(context);

  int curentIndex = 0;
  String currentTransport = '';
  bool isPassword = true;
  int notificationsNumber = 1;
  bool lightMode = true;
  bool darktMode = false;
  Color t1 = Color(0xffbceee3);
  Color t2 = Color(0xffbceee3);
  Color t3 = Color(0xffbceee3);
  bool b1 = false;
  bool b2 = false;
  bool b3 = false;
  List<Widget> bottmScreen = [HomeScreen(), TecketScrren(), FavoretScreen()];
  void changeNaveBar(int index) {
    curentIndex = index;
    emit(changeBottmnaveState());
  }

  void chooseTransport(String index) {
    currentTransport = index;
    emit(serviceRadioButtonState());
  }

  void hideShowPassword() {
    isPassword = !isPassword;
    emit(passwordState());
  }

  void toggleLightMode() {
    lightMode = true;
    darktMode = false;
    emit(toggleMode());
  }

  void toggleDarkMode() {
    lightMode = false;
    darktMode = true;
    emit(toggleMode());
  }

  late AllBanksModel bankModel;
  void getAllBanks() {
    emit(GetAllBanksLoadingState());
    DioHelper.getData(url: ALLBANKS).then((value) {
      print(value);
      bankModel = AllBanksModel.fromJson(value.data);
      emit(GetAllBanksSuccesState(bankModel));
    }).catchError((erorr) {
      print('error is ' + erorr.toString());
      emit(GetAllBanksErorrState());
    });
  }
}

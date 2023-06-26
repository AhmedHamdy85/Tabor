import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/layout/cubit/states.dart';
import 'package:tabor/model/add_favoret_model/add_favoret_model.dart';
import 'package:tabor/modules/Home/homeScreen.dart';
import 'package:tabor/modules/favoret/favoret_screen.dart';
import 'package:tabor/modules/tecket/tecket_scrren.dart';
import 'package:tabor/shared/componants/constants.dart';
import 'package:tabor/shared/endpints.dart';
import 'package:tabor/shared/network/remote/dio_helper.dart';

import '../../model/active_teckit_model/active_teckit_model.dart';
import '../../model/bankmodels/all_banks_model/all_banks_model.dart';
import '../../model/favoret_model/favoret_model.dart';

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

  List<AllBanksModel> bankModel = [];
  List<AllBanksModel> favoretIteams = [];
  Map<num?, bool?> favoret = {};
  void getAllBanks() {
    emit(GetAllBanksLoadingState());
    DioHelper.getData(url: ALLBANKS).then((value) {
      bankModel
          .addAll((value.data as List).map(((e) => AllBanksModel.fromJson(e))));

      bankModel.forEach((element) {
        if (element.favorite == true) {
          favoretIteams.add(element);
        }
        favoret.addAll({
          element.id: element.favorite,
        });
      });

      //  print(favoret.toString());
      //print(favoretIteams.length);
      emit(GetAllBanksSuccesState());
    }).catchError((erorr) {
      print('error is ' + erorr.toString());
      emit(GetAllBanksErorrState());
    });
  }

  List<FavoretModel> favoretModel = [];

  void getFavoretBanks() {
    emit(GetFavoretBanksLoadingState());
    DioHelper.getData(url: FAVORETBANKS, token: token).then((value) {
      // favoretModel
      //     .addAll((value.data as List).map(((e) => FavoretModel.fromJson(e))));

      print('favoret 1 is ${value.statusMessage}');
      emit(GetFavoretBanksSuccesState());
    }).catchError((erorr) {
      print('favoret error is ' + erorr.toString());
      emit(GetFavoretBanksErorrState());
    });
  }

  late ChangeFavoretModel changeModel;
  void changeFavorets(num? id, bool? status) async {
    favoret[id] = !favoret[id]!;
    emit(ChangeFavoretState());
    DioHelper.putData(
      url: '$ADDTOFAVORET${id.toString()}',
      token: token,
      data: {'favorite': !status!},
    ).then((value) {
      changeModel = ChangeFavoretModel.fromJson(value.data);
      // getAllBanks();
      print(value.data);

      emit(ChangeFavoretSuccesState());
    }).catchError((erorr) {
      favoret[id] = !favoret[id]!;
      print(erorr.toString());
      emit(ChangeFavoretErorrState());
    });
  }

  List<TeckitModel> activeTeckit = [];

  void getActiveTeckit() {
    emit(GetActiveTeckitLoadingState());
    DioHelper.getData(url: ACTIVETICET, token: token).then((value) {
      activeTeckit
          .addAll((value.data as List).map(((e) => TeckitModel.fromJson(e))));

      //  print('tecits ${activeTeckit[0].numOfTurn}');
      emit(GetActiveTeckitSuccesState());
    }).catchError((erorr) {
      print('Teckit error is ' + erorr.toString());
      emit(GetActiveTeckitErorrState());
    });
  }

  List<TeckitModel> completedTeckit = [];

  void getCompletedTeckit() {
    emit(GetCompletedTeckitLoadingState());
    DioHelper.getData(url: COMPLETEDTICKETS, token: token).then((value) {
      completedTeckit
          .addAll((value.data as List).map(((e) => TeckitModel.fromJson(e))));

      print(' completed tecits ${completedTeckit[0].active}');
      emit(GetCompletedTeckitSuccesState());
    }).catchError((erorr) {
      print('Teckit error is ' + erorr.toString());
      emit(GetCompletedTeckitErorrState());
    });
  }
}

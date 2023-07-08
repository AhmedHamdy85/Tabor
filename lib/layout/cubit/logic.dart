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
import '../../modules/branshes/search/search_branches.dart';

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
  static List<String> mainHomeList = [
    'خدمة عملاء فودافون ',
    'خدمة عملاء اتصالات',
    'خدمة عملاءاورانج',
    'خدمة عملاء وي',
    'بنك القاهرة',
    'بنك الاسكنتدرية',
    'بنك مصر',
    'البنك الاهلي المصري',
    'بنك ابوظبي'
  ];
  List<String> displayHomeList = List.from(mainHomeList);
  static List<ListDataModel> mainBranchesList = [
    ListDataModel('الفيوم-فرع الجامعة', 'assets/images/status1.svg'),
    ListDataModel('الفيوم-فرع السواقي', 'assets/images/status2.svg'),
    ListDataModel('الفيوم-فرع المسلة', 'assets/images/status3.svg'),
    ListDataModel('الفيوم-فرع مخيمر تاون', 'assets/images/status1.svg'),
    ListDataModel('الفيوم-فرع سنهور البحرية سيتي', 'assets/images/status1.svg'),
    ListDataModel('الاسكندرية-فرع سموحه', 'assets/images/status2.svg'),
    ListDataModel('القاهرة-فرع الزمالك', 'assets/images/status3.svg'),
    ListDataModel('القليوبية-فرع شبرا الخيمة', 'assets/images/status1.svg'),
  ];
  List<ListDataModel> displayBranchesList = List.from(mainBranchesList);
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
  Map<num?, bool?> favoret = {};
  void getAllBanks() {
    emit(GetAllBanksLoadingState());
    DioHelper.getData(url: ALLBANKS).then((value) {
      bankModel
          .addAll((value.data as List).map(((e) => AllBanksModel.fromJson(e))));

      bankModel.forEach((element) {
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

  List<AllBanksModel> favoretModel = [];

  void getFavoretBanks() {
    emit(GetFavoretBanksLoadingState());
    DioHelper.getData(url: FAVORETBANKS, token: token).then((value) {
      favoretModel
          .addAll((value.data as List).map(((e) => AllBanksModel.fromJson(e))));

      print('favoret 1 is ${favoretModel}');
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
      favoretModel.clear();
      getFavoretBanks();
      print(value.data);

      emit(ChangeFavoretSuccesState());
    }).catchError((erorr) {
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

  void filterHomeList(String value) {
    displayHomeList =
        mainHomeList.where((element) => element.contains(value)).toList();
    emit(ListHomeSearch());
  }

  void filterBranchesList(String value) {
    displayBranchesList = mainBranchesList
        .where((element) => element.title.contains(value))
        .toList();
    emit(ListBranchesSearch());
  }

}

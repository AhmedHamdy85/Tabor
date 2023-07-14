import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/model/regester_model.dart';
import 'package:tabor/modules/sinup_screen/cubit/states.dart';
import 'package:tabor/shared/network/remote/dio_helper.dart';

import '../../../shared/endpints.dart';

class RegestrCubit extends Cubit<RegesterStates> {
  RegestrCubit() : super(RegesterInatialState());

  static RegestrCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  void changePasswordVisabilty() {
    isPassword = !isPassword;
    emit(ChangePassworsdVizabiltyState());
  }

  bool isChecked = false;
  void changeCheckBox() {
    isChecked = !isChecked;
    emit(ChangePassworsdVizabiltyState());
  }

  RegesterModel? regesterModel;

  void userRegester(
      {required phoneNumber,
      required password,
      required confirmPasword,
      required userName}) {
    emit(RegesterLoadingState());
    DioHelper.postData(url: REGESTER, data: {
      'mobile': phoneNumber,
      'password': password,
      'username': userName,
      'confirm_password': confirmPasword
    }).then((value) {
      regesterModel = RegesterModel.fromJson(value.data);
      print(value);
      emit(RegesterSuccesState(regesterModel));
    }).catchError((erorr) {
      print('error is $erorr');
      emit(RegesterErrorState());
    });
  }
}

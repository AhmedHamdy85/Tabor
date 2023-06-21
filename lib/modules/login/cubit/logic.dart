import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/model/login.dart';
import 'package:tabor/modules/login/cubit/states.dart';
import 'package:tabor/shared/network/remote/dio_helper.dart';

import '../../../shared/endPints.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInatialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  void changePasswordVisabilty() {
    isPassword = !isPassword;
    emit(ChangePasswordVizabiltyState());
  }

  bool isChecked = false;
  void changeCheckBox() {
    isChecked = !isChecked;
    emit(ChangePasswordVizabiltyState());
  }

  late LoginModel loginModel;

  void userLogin({required String phoneNumber, required String password}) {
    emit(LogInLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data: {'mobile': phoneNumber, 'password': password}).then((value) {
      print(value);
      loginModel = LoginModel.fromjson(value.data);
      emit(LogInSuccesState(loginModel));
    }).catchError((erorr) {
      print('error is ' + erorr.toString());
      emit(LogInErrorState());
    });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/modules/login/cubit/states.dart';

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
}

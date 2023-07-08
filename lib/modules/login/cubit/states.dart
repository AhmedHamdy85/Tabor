import 'package:tabor/model/login.dart';

abstract class LoginStates {}

class LoginInatialState extends LoginStates {}

class ChangePasswordVizabiltyState extends LoginStates {}

class LogInLoadingState extends LoginStates {}

class LogInSuccesState extends LoginStates {
  final LoginModel? loginModel;

  LogInSuccesState(this.loginModel);
}

class LogInErrorState extends LoginStates {}

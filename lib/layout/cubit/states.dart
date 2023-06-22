import '../../model/bankmodels/allbanks.dart';

abstract class layoutStates {}

class layoutInatialState extends layoutStates {}

class changeBottmnaveState extends layoutStates {}

class serviceRadioButtonState extends layoutStates {}

class passwordState extends layoutStates {}

class toggleMode extends layoutStates {}

class GetAllBanksLoadingState extends layoutStates {}

class GetAllBanksSuccesState extends layoutStates {
  final AllBanksModel bankModel;

  GetAllBanksSuccesState(this.bankModel);
}

class GetAllBanksErorrState extends layoutStates {}

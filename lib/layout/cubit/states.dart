import '../../model/bankmodels/all_banks_model/all_banks_model.dart';

abstract class layoutStates {}

class layoutInatialState extends layoutStates {}

class changeBottmnaveState extends layoutStates {}

class serviceRadioButtonState extends layoutStates {}

class passwordState extends layoutStates {}

class toggleMode extends layoutStates {}

class GetAllBanksLoadingState extends layoutStates {}

class GetAllBanksSuccesState extends layoutStates {}

class GetAllBanksErorrState extends layoutStates {}

class GetFavoretBanksLoadingState extends layoutStates {}

class GetFavoretBanksSuccesState extends layoutStates {}

class GetFavoretBanksErorrState extends layoutStates {}

class ChangeFavoretState extends layoutStates {}

class ChangeFavoretSuccesState extends layoutStates {}

class ChangeFavoretErorrState extends layoutStates {}

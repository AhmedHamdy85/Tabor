
import '../../../model/regester_model.dart';

abstract class RegesterStates {}

class RegesterInatialState extends RegesterStates {}

class ChangePassworsdVizabiltyState extends RegesterStates {}

class RegesterLoadingState extends RegesterStates {}

class RegesterSuccesState extends RegesterStates {
  final RegesterModel? regesterModel;

  RegesterSuccesState(this.regesterModel);
}

class RegesterErrorState extends RegesterStates {}

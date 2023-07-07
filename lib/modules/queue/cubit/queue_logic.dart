import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/shared/endpints.dart';

import '../../../model/queue_model/queue_model.dart';
import '../../../model/serveses_model/serveses_model.dart';
import '../../../shared/componants/constants.dart';
import '../../../shared/network/remote/dio_helper.dart';
part 'queue_state.dart';

class QueueCubit extends Cubit<QueueState> {
  QueueCubit() : super(QueueInitial());
  static QueueCubit get(context) => BlocProvider.of(context);
  List<QueueModel> queuesModel = [];
  List<String> dropDownTitleItem = [];
  void getQueues() {
    emit(GetQueueLoadingState());
    DioHelper.getData(url: QUEUE, token: token).then((value) {
      queuesModel
          .addAll((value.data as List).map(((e) => QueueModel.fromJson(e))));

      if (queuesModel.isNotEmpty) {
        queuesModel.forEach((element) {
          dropDownTitleItem.add('${element.nameOfQueue}');
        });
      }
      //   print('serveses $dropDownService');
      print('queues is ${dropDownTitleItem[0]}');
      print('queue 1 is ${queuesModel[0].nameOfQueue}');
      emit(GetQueueSuccesState());
    }).catchError((erorr) {
      print('queue error is ' + erorr.toString());
      emit(GetQueueErorrState());
    });
  }

  List<ServesesModel> servecModel = [];
  List<String> dropDownService = [];
  List<num?> servicesId = [];
  void getServices() {
    emit(GetServicesLoadingState());
    DioHelper.getData(url: SERVECISE, token: token).then((value) {
      servecModel
          .addAll((value.data as List).map(((e) => ServesesModel.fromJson(e))));

      if (servecModel.isNotEmpty) {
        servecModel.forEach((element) {
          dropDownService.add('${element.name}');
          servicesId.add(element.id);
        });
      }
      print('serveses ${dropDownService.length}');
      print('serveses id ${servicesId.length}');

      // print(' is ${dropDownTitleItem[0]}');
      print('service 1 is ${servecModel[0].name}');
      emit(GetServicesSuccesState());
    }).catchError((erorr) {
      print('service error is ' + erorr.toString());
      emit(GetServecesErorrState());
    });
  }
}

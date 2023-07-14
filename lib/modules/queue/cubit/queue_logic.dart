import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabor/shared/endpints.dart';

import '../../../model/create_tecit_model.dart';
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
        for (var element in queuesModel) {
          dropDownTitleItem.add('${element.nameOfQueue}');
        }
      }
      //   print('serveses $dropDownService');
      print('queues is ${dropDownTitleItem[0]}');
      print('queue 1 is ${queuesModel[0].nameOfQueue}');
      emit(GetQueueSuccesState());
    }).catchError((erorr) {
      print('queue error is $erorr');
      emit(GetQueueErorrState());
    });
  }

  List<ServesesModel> servecModel = [];
  List<String> dropDownService = [];
  Map<String, dynamic> servicesId = {};
  void getServices() {
    emit(GetServicesLoadingState());
    DioHelper.getData(url: SERVECISE, token: token).then((value) {
      servecModel
          .addAll((value.data as List).map(((e) => ServesesModel.fromJson(e))));

      if (servecModel.isNotEmpty) {
        for (var element in servecModel) {
          dropDownService.add('${element.name}');
        }

        for (var element in servecModel) {
          String name = '${element.name}';
          num? id = element.id;
          servicesId[name] = id;
        }
      }
      print('serveses ${dropDownService.length}');
      print('serveses id ${servicesId.length}');

      // print(' is ${dropDownTitleItem[0]}');
      print('service 1 is ${servecModel[0].name}');
      emit(GetServicesSuccesState());
    }).catchError((erorr) {
      print('service error is $erorr');
      emit(GetServicesErorrState());
    });
  }

  CreateTecitModel? createModel;
  dynamic parsedTime;
  void createTeckit(num? serviceId) {
    emit(CreateTeckitLoadingState());
    DioHelper.postData(
        url: CREATETECITE,
        token: token,
        data: {'service': servicesId}).then((value) async {
      var data = json.encode(value.data);
      var data2 = await json.decode(data);
      // var model = CreateTecitModel.fromJson(data2);
      // parsedTime = parseTime('${createModel.waitingTime}');
      //   print(createModel);
      print('status ${value.statusCode}');
      print('message ${value.statusMessage}');
      print(data2);
      emit(CreateTeckitSuccesState());
    }).catchError((erorr) {
      print('create tickit error is ${erorr.toString()}');
      emit(CreateTeckitErorrState());
    });
  }

  static Map<String, int> parseTime(String timeString) {
    // Split the time string into hours and minutes parts
    final parts = timeString.split(' ');

    // Extract the hours and minutes as strings
    final timeParts = parts[1].split(':');
    final hoursString = parts[0];

    final minutesString = timeParts[1];

    // Convert the hours and minutes strings to integers
    final hours = int.tryParse(hoursString) ?? 0;
    final minutes = int.tryParse(minutesString) ?? 0;

    // Create a map to store the parsed values
    final parsedTime = {'hours': hours, 'minutes': minutes};

    return parsedTime;
  }
}

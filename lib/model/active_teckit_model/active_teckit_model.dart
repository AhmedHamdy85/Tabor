import 'service.dart';
import 'user.dart';

class ActiveTeckitModel {
  num? id;
  num? numOfTurn;
  num? numOfWaitings;
  bool? active;
  String? waitingTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
  Service? service;

  ActiveTeckitModel({
    this.id,
    this.numOfTurn,
    this.numOfWaitings,
    this.active,
    this.waitingTime,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.service,
  });

  factory ActiveTeckitModel.fromJson(Map<String, dynamic> json) {
    return ActiveTeckitModel(
      id: num.tryParse(json['id'].toString()),
      numOfTurn: num.tryParse(json['num_of_turn'].toString()),
      numOfWaitings: num.tryParse(json['num_of_waitings'].toString()),
      active: json['active']?.toString().contains("true"),
      waitingTime: json['waiting_time']?.toString(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.tryParse(json['created_at'].toString()),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.tryParse(json['updated_at'].toString()),
      user: json['user'] == null
          ? null
          : User.fromJson(Map<String, dynamic>.from(json['user'])),
      service: json['service'] == null
          ? null
          : Service.fromJson(Map<String, dynamic>.from(json['service'])),
    );
  }

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (numOfTurn != null) 'num_of_turn': numOfTurn,
        if (numOfWaitings != null) 'num_of_waitings': numOfWaitings,
        if (active != null) 'active': active,
        if (waitingTime != null) 'waiting_time': waitingTime,
        if (createdAt != null) 'created_at': createdAt?.toIso8601String(),
        if (updatedAt != null) 'updated_at': updatedAt?.toIso8601String(),
        if (user != null) 'user': user?.toJson(),
        if (service != null) 'service': service?.toJson(),
      };
}

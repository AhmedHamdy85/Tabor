class CreateTecitModel {
  num? id;
  num? numOfTurn;
  num? numOfWaitings;
  bool? active;
  String? waitingTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? user;
  num? service;

  CreateTecitModel({
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

  factory CreateTecitModel.fromJson(Map<String, dynamic> json) {
    return CreateTecitModel(
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
      user: num.tryParse(json['user'].toString()),
      service: num.tryParse(json['service'].toString()),
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
        if (user != null) 'user': user,
        if (service != null) 'service': service,
      };
}

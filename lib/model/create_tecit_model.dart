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

  CreateTecitModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numOfTurn = json['num_of_turn'];
    numOfWaitings = json['num_of_waitings'];
    active = json['active'];
    waitingTime = json['waiting_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'];
    service = json['service'];
  }
}

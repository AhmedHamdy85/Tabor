import 'service.dart';

class QueueModel {
  num? id;
  String? nameOfQueue;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? branch;
  List<Service>? services;

  QueueModel({
    this.id,
    this.nameOfQueue,
    this.createdAt,
    this.updatedAt,
    this.branch,
    this.services,
  });

  factory QueueModel.fromJson(Map<String, dynamic> json) => QueueModel(
        id: num.tryParse(json['id'].toString()),
        nameOfQueue: json['name_of_queue']?.toString(),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.tryParse(json['created_at'].toString()),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.tryParse(json['updated_at'].toString()),
        branch: json['branch']?.toString(),
        services: (json['services'] as List<dynamic>?)
            ?.map((e) => Service.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (nameOfQueue != null) 'name_of_queue': nameOfQueue,
        if (createdAt != null) 'created_at': createdAt?.toIso8601String(),
        if (updatedAt != null) 'updated_at': updatedAt?.toIso8601String(),
        if (branch != null) 'branch': branch,
        if (services != null)
          'services': services?.map((e) => e.toJson()).toList(),
      };
}

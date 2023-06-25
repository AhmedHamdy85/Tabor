import 'branch.dart';

class Queue {
  num? id;
  String? nameOfQueue;
  DateTime? createdAt;
  DateTime? updatedAt;
  Branch? branch;

  Queue({
    this.id,
    this.nameOfQueue,
    this.createdAt,
    this.updatedAt,
    this.branch,
  });

  factory Queue.fromJson(Map<String, dynamic> json) => Queue(
        id: num.tryParse(json['id'].toString()),
        nameOfQueue: json['name_of_queue']?.toString(),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.tryParse(json['created_at'].toString()),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.tryParse(json['updated_at'].toString()),
        branch: json['branch'] == null
            ? null
            : Branch.fromJson(Map<String, dynamic>.from(json['branch'])),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (nameOfQueue != null) 'name_of_queue': nameOfQueue,
        if (createdAt != null) 'created_at': createdAt?.toIso8601String(),
        if (updatedAt != null) 'updated_at': updatedAt?.toIso8601String(),
        if (branch != null) 'branch': branch?.toJson(),
      };
}

class Service {
  num? id;
  String? name;
  String? information;
  num? timeTaken;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? queue;

  Service({
    this.id,
    this.name,
    this.information,
    this.timeTaken,
    this.createdAt,
    this.updatedAt,
    this.queue,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: num.tryParse(json['id'].toString()),
        name: json['name']?.toString(),
        information: json['information']?.toString(),
        timeTaken: num.tryParse(json['time_taken'].toString()),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.tryParse(json['created_at'].toString()),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.tryParse(json['updated_at'].toString()),
        queue: json['queue']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (information != null) 'information': information,
        if (timeTaken != null) 'time_taken': timeTaken,
        if (createdAt != null) 'created_at': createdAt?.toIso8601String(),
        if (updatedAt != null) 'updated_at': updatedAt?.toIso8601String(),
        if (queue != null) 'queue': queue,
      };
}

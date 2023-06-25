class Bank {
  num? id;
  String? name;
  num? numberOfBranchs;
  dynamic image;
  bool? favorite;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? user;

  Bank({
    this.id,
    this.name,
    this.numberOfBranchs,
    this.image,
    this.favorite,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        id: num.tryParse(json['id'].toString()),
        name: json['name']?.toString(),
        numberOfBranchs: num.tryParse(json['number_of_branchs'].toString()),
        image: json['image'],
        favorite: json['favorite']?.toString().contains("true"),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.tryParse(json['created_at'].toString()),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.tryParse(json['updated_at'].toString()),
        user: num.tryParse(json['user'].toString()),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (numberOfBranchs != null) 'number_of_branchs': numberOfBranchs,
        if (image != null) 'image': image,
        if (favorite != null) 'favorite': favorite,
        if (createdAt != null) 'created_at': createdAt?.toIso8601String(),
        if (updatedAt != null) 'updated_at': updatedAt?.toIso8601String(),
        if (user != null) 'user': user,
      };
}

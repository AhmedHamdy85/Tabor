class ChangeFavoretModel {
  num? id;
  dynamic image;
  String? name;
  num? numberOfBranchs;
  bool? favorite;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? user;

  ChangeFavoretModel({
    this.id,
    this.image,
    this.name,
    this.numberOfBranchs,
    this.favorite,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory ChangeFavoretModel.fromJson(Map<String, dynamic> json) {
    return ChangeFavoretModel(
      id: num.tryParse(json['id'].toString()),
      image: json['image'],
      name: json['name']?.toString(),
      numberOfBranchs: num.tryParse(json['number_of_branchs'].toString()),
      favorite: json['favorite']?.toString().contains("true"),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.tryParse(json['created_at'].toString()),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.tryParse(json['updated_at'].toString()),
      user: num.tryParse(json['user'].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (image != null) 'image': image,
        if (name != null) 'name': name,
        if (numberOfBranchs != null) 'number_of_branchs': numberOfBranchs,
        if (favorite != null) 'favorite': favorite,
        if (createdAt != null) 'created_at': createdAt?.toIso8601String(),
        if (updatedAt != null) 'updated_at': updatedAt?.toIso8601String(),
        if (user != null) 'user': user,
      };
}

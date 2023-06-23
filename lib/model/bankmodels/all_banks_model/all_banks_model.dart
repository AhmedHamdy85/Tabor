import 'branch.dart';

class AllBanksModel {
  num? id;
  String? name;
  num? numberOfBranchs;
  dynamic image;
  bool? favorite;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? user;
  List<Branch>? branchs;

  AllBanksModel({
    this.id,
    this.name,
    this.numberOfBranchs,
    this.image,
    this.favorite,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.branchs,
  });

  factory AllBanksModel.fromJson(Map<String, dynamic> json) => AllBanksModel(
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
        branchs: (json['Branchs'] as List<dynamic>?)
            ?.map((e) => Branch.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
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
        if (branchs != null)
          'Branchs': branchs?.map((e) => e.toJson()).toList(),
      };
}

class Branch {
  num? id;
  String? nameOfBranch;
  String? distanceBranchUser;
  String? image;
  num? numberOfQueues;
  bool? favorite;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? user;
  String? bank;

  Branch({
    this.id,
    this.nameOfBranch,
    this.distanceBranchUser,
    this.image,
    this.numberOfQueues,
    this.favorite,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.bank,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: num.tryParse(json['id'].toString()),
        nameOfBranch: json['name_of_branch']?.toString(),
        distanceBranchUser: json['Distance_branch_user']?.toString(),
        image: json['image']?.toString(),
        numberOfQueues: num.tryParse(json['number_of_queues'].toString()),
        favorite: json['favorite']?.toString().contains("true"),
        createdAt: json['created_at'] == null
            ? null
            : DateTime.tryParse(json['created_at'].toString()),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.tryParse(json['updated_at'].toString()),
        user: num.tryParse(json['user'].toString()),
        bank: json['bank']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (nameOfBranch != null) 'name_of_branch': nameOfBranch,
        if (distanceBranchUser != null)
          'Distance_branch_user': distanceBranchUser,
        if (image != null) 'image': image,
        if (numberOfQueues != null) 'number_of_queues': numberOfQueues,
        if (favorite != null) 'favorite': favorite,
        if (createdAt != null) 'created_at': createdAt?.toIso8601String(),
        if (updatedAt != null) 'updated_at': updatedAt?.toIso8601String(),
        if (user != null) 'user': user,
        if (bank != null) 'bank': bank,
      };
}

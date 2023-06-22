class AllBanksModel {
  int? id;
  String? name;
  int? numberOfBranchs;
  String? image;
  bool? favorite;
  String? createdAt;
  String? updatedAt;
  int? user;
  List<Branchs>? branchs;

  AllBanksModel(
      {this.id,
      this.name,
      this.numberOfBranchs,
      this.image,
      this.favorite,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.branchs});

  AllBanksModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    numberOfBranchs = json['number_of_branchs'];
    image = json['image'];
    favorite = json['favorite'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'];
    if (json['Branchs'] != null) {
      branchs = <Branchs>[];
      json['Branchs'].forEach((v) {
        branchs!.add(new Branchs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number_of_branchs'] = this.numberOfBranchs;
    data['image'] = this.image;
    data['favorite'] = this.favorite;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user'] = this.user;
    if (this.branchs != null) {
      data['Branchs'] = this.branchs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Branchs {
  int? id;
  String? nameOfBranch;
  String? distanceBranchUser;
  String? image;
  int? numberOfQueues;
  bool? favorite;
  String? createdAt;
  String? updatedAt;
  int? user;
  String? bank;

  Branchs(
      {this.id,
      this.nameOfBranch,
      this.distanceBranchUser,
      this.image,
      this.numberOfQueues,
      this.favorite,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.bank});

  Branchs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameOfBranch = json['name_of_branch'];
    distanceBranchUser = json['Distance_branch_user'];
    image = json['image'];
    numberOfQueues = json['number_of_queues'];
    favorite = json['favorite'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'];
    bank = json['bank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_of_branch'] = this.nameOfBranch;
    data['Distance_branch_user'] = this.distanceBranchUser;
    data['image'] = this.image;
    data['number_of_queues'] = this.numberOfQueues;
    data['favorite'] = this.favorite;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user'] = this.user;
    data['bank'] = this.bank;
    return data;
  }
}










// class AllBanksModel {
//   late int id;
//   late String name;
//   late int numberOfBranchs;
//   String? image;
//   late bool favorite;
//   late int user;
//   List<Branches>? branchs;

//   AllBanksModel.fromjson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     numberOfBranchs = json['number_of_branchs'];
//     image = json['image'];
//     favorite = json['favorite'];
//     if (json['Branchs'] != null) {
//       branchs = <Branchs>[];
//       json['Branchs'].forEach((v) {
//         branchs!.add(new Branchs.fromJson(v));
//       });
    
//   }
// }

// class Branches {
//   late int id;

//   String? image;
//   late int numberOfQueues;
//   late bool favorite;

//   int? user;
//   String? bank;
//   Branches.fromjson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['image'];
//     numberOfQueues = json['number_of_queues'];
//     favorite = json['favorite'];
//     user = json['user'];
//     bank = json['bank'];

    
//   }
// }

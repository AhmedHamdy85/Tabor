class RegesterModel {
  num? id;
  String? mobile;
  String? username;
  String? password;
  String? confirmPassword;
  dynamic governorate;
  bool? isStaff;

  RegesterModel({
    this.id,
    this.mobile,
    this.username,
    this.password,
    this.confirmPassword,
    this.governorate,
    this.isStaff,
  });

  factory RegesterModel.fromJson(Map<String, dynamic> json) => RegesterModel(
        id: num.tryParse(json['id'].toString()),
        mobile: json['mobile']?.toString(),
        username: json['username']?.toString(),
        password: json['password']?.toString(),
        confirmPassword: json['confirm_password']?.toString(),
        governorate: json['governorate'],
        isStaff: json['is_staff']?.toString().contains("true"),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (mobile != null) 'mobile': mobile,
        if (username != null) 'username': username,
        if (password != null) 'password': password,
        if (confirmPassword != null) 'confirm_password': confirmPassword,
        if (governorate != null) 'governorate': governorate,
        if (isStaff != null) 'is_staff': isStaff,
      };
}

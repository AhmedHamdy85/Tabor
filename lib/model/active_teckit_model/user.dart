class User {
  num? id;
  dynamic lastLogin;
  bool? isSuperuser;
  String? mobile;
  bool? isVerified;
  String? username;
  String? password;
  String? confirmPassword;
  dynamic governorate;
  bool? isStaff;
  bool? isActive;
  DateTime? dateJoined;
  List<dynamic>? groups;
  List<dynamic>? userPermissions;

  User({
    this.id,
    this.lastLogin,
    this.isSuperuser,
    this.mobile,
    this.isVerified,
    this.username,
    this.password,
    this.confirmPassword,
    this.governorate,
    this.isStaff,
    this.isActive,
    this.dateJoined,
    this.groups,
    this.userPermissions,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: num.tryParse(json['id'].toString()),
        lastLogin: json['last_login'],
        isSuperuser: json['is_superuser']?.toString().contains("true"),
        mobile: json['mobile']?.toString(),
        isVerified: json['isVerified']?.toString().contains("true"),
        username: json['username']?.toString(),
        password: json['password']?.toString(),
        confirmPassword: json['confirm_password']?.toString(),
        governorate: json['governorate'],
        isStaff: json['is_staff']?.toString().contains("true"),
        isActive: json['is_active']?.toString().contains("true"),
        dateJoined: json['date_joined'] == null
            ? null
            : DateTime.tryParse(json['date_joined'].toString()),
        groups: List<dynamic>.from(json['groups'] ?? []),
        userPermissions: List<dynamic>.from(json['user_permissions'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (lastLogin != null) 'last_login': lastLogin,
        if (isSuperuser != null) 'is_superuser': isSuperuser,
        if (mobile != null) 'mobile': mobile,
        if (isVerified != null) 'isVerified': isVerified,
        if (username != null) 'username': username,
        if (password != null) 'password': password,
        if (confirmPassword != null) 'confirm_password': confirmPassword,
        if (governorate != null) 'governorate': governorate,
        if (isStaff != null) 'is_staff': isStaff,
        if (isActive != null) 'is_active': isActive,
        if (dateJoined != null) 'date_joined': dateJoined?.toIso8601String(),
        if (groups != null) 'groups': groups,
        if (userPermissions != null) 'user_permissions': userPermissions,
      };
}

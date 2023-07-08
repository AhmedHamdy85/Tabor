class LoginModel {
  late String token;
  late String refreshToken;
  late UserData data;
  LoginModel.fromjson(Map<String, dynamic> json) {
    token = json['access'];
    refreshToken = json['refresh'];
    data = UserData.fromjson(json['user']);
  }
}

class UserData {
  late String mopilePhone;
  late String name;
  late num id;
  UserData.fromjson(Map<String, dynamic> json) {
    mopilePhone = json['mobile'];
    name = json['username'];
    id = json['id'];
  }
}

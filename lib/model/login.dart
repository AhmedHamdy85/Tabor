class LoginModel {
  late String token;
  late UserData data;
  LoginModel.fromjson(Map<String, dynamic> json) {
    token = json['access'];
    data = UserData.fromjson(json['user']);
  }
}

class UserData {
  late String mopilePhone;
  late String name;
  UserData.fromjson(Map<String, dynamic> json) {
    mopilePhone = json['mobile'];
    name = json['username'];
  }
}

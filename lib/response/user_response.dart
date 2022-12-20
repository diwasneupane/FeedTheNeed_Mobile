class LoginResponse {
  String? msg;
  String? token;

  LoginResponse({this.msg, this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      msg: json["msg"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "msg": msg,
      "token": token,
    };
  }
}

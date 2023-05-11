class LoginResponse {
  bool? error;
  String? message, token, username;

  LoginResponse.fromJson(json) {
    error = json["error"] ?? true;
    message = json['data']["message"] ?? "";
    token = json['data']["token"] ?? "";
    username = json['data']["username"] ?? "";
  }
  LoginResponse.withError(msg){
    error = true;
    message = msg ?? "Something is wrong";
  }
}

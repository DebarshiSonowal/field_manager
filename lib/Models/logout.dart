class LogoutResponse {
//  "error": false,
//     "data": "Successfully Logged Out!"
  bool? error;
  String? message;

  LogoutResponse.fromJson(json) {
    error = json["error"] ?? true;
    message = json["data"] ?? "Something went wrong";
  }

  LogoutResponse.withError(msg) {
    error = true;
    message = msg;
  }
}

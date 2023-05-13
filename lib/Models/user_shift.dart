class UserShift {
  int? sunday, monday, tuesday, wednesday, thursday, friday, saturday;
  String? startTime, endTime, employee;

  UserShift.fromJson(json) {
    sunday = json["sunday"] ?? 0;
    monday = json["monday"] ?? 0;
    tuesday = json["tuesday"] ?? 0;
    wednesday = json["wednesday"] ?? 0;
    thursday = json["thursday"] ?? 0;
    friday = json["friday"] ?? 0;
    saturday = json["saturday"] ?? 0;
    startTime = json["startTime"] ?? "";
    endTime = json["endTime"] ?? "";
    employee = "${json["employee"] ?? ""}";
  }
}

class UserShiftResponse {
  bool? error;
  UserShift? userShift;
  String? message;

  UserShiftResponse.fromJson(json) {
    error = json["error"] ?? true;
    userShift = UserShift.fromJson(json["data"]["userShift"]);
  }

  UserShiftResponse.withError(msg) {
    error = true;
    message = msg;
  }
}

class LeaveType {
//  leaveType
//id": 1,
//                 "leaveName": "Casual Leave"
  int? id;
  String? leaveName;

  LeaveType.fromJson(json) {
    id = json["id"] ?? 0;
    leaveName = json["leaveName"] ?? "";
  }
}

class LeaveResponse {
  bool? error;
  List<LeaveType>? leaveTypes;
  String? message;

  LeaveResponse.fromJson(json) {
    error = json["error"] ?? true;
    leaveTypes = json["data"]["leaveType"] == null
        ? []
        : (json["data"]["leaveType"] as List)
            .map((e) => LeaveType.fromJson(e))
            .toList();
  }
  LeaveResponse.withError(msg) {
    error = true;
    message = msg;
  }
}

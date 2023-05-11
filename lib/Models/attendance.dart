// "error": false,
//     "data": {
//         "attendanceInfo": {
//             "present": 0,
//             "halfDay": 0,
//             "absent": 0,
//             "on_leave": 0,
//             "available": 0,
//             "weeklyOff": 0
//         }
//     }
class Attendance {
  int? present, halfDay, absent, onLeave, available, weeklyOff;

  Attendance.fromJson(json) {
    present = json["present"] ?? 0;
    halfDay = json["half_day"] ?? 0;
    absent = json["absent"] ?? 0;
    onLeave = json["on_leave"] ?? 0;
    available = json["available"] ?? 0;
    weeklyOff = json["weekly_off"] ?? 0;
  }
}

class AttendanceResponse{
  bool? error;
  Attendance? data;

  AttendanceResponse.fromJson(json){
    error = json["error"]??true;
    data = json["data"];
  }

  AttendanceResponse.withError(msg){
    error = true;
  }

}
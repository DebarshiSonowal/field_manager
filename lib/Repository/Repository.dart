import 'package:flutter/cupertino.dart';

import '../Models/attendance.dart';
import '../Models/leaveType.dart';
import '../Models/user_shift.dart';

class Repository extends ChangeNotifier {
  late bool _isDark, _notification;
  late int _index;
  Attendance? _attendance;
  UserShift? _userShift;
  bool? _isCheckedIn;
  List<LeaveType> _leaveTypes=[];
  Repository() {
    _isDark = false;
    _notification = false;
    _index = 0;
  }

  void setCheckedIn(bool val) {
    _isCheckedIn = val;
    notifyListeners();
  }

  void setTypeOfLeaves(List<LeaveType> val) {
    _leaveTypes = val;
    notifyListeners();
  }

  void setAttendance(Attendance data) {
    _attendance = data;
    notifyListeners();
  }

  void setUserShift(UserShift data) {
    _userShift = data;
    notifyListeners();
  }

  void changeTheme(bool val) {
    _isDark = val;
    notifyListeners();
  }

  void changeNotification(bool val) {
    _notification = val;
    notifyListeners();
  }

  void updateIndex(int val) {
    _index = val;
    notifyListeners();
  }

  int get index => _index;

  bool get isDark => _isDark;

  bool get notification => _notification;

  List<LeaveType> get leaveTypes => _leaveTypes;

  bool get isCheckedIn => _isCheckedIn ?? false;

  Attendance? get getAttendance => _attendance;

  UserShift? get getUserShift => _userShift;
}

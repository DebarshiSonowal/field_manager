import 'package:field_manager/Models/expense.dart';
import 'package:flutter/cupertino.dart';

import '../Models/attendance.dart';
import '../Models/client.dart';
import '../Models/leaveType.dart';
import '../Models/user_shift.dart';

class Repository extends ChangeNotifier {
  late bool _isDark, _notification;
  late int _index;
  Attendance? _attendance;
  UserShift? _userShift;
  bool? _isCheckedIn;
  List<ExpenseType> _expenseTypes = [];
  List<Expense> _expenses = [];
  List<LeaveType> _leaveTypes = [];
  List<Client> _client = [];

  Repository() {
    _isDark = false;
    _notification = false;
    _index = 0;
  }

  void setCheckedIn(bool val) {
    _isCheckedIn = val;
    notifyListeners();
  }

  void setTypesOfExpenses(List<ExpenseType> val) {
    _expenseTypes = val;
    notifyListeners();
  }

  void setClients(List<Client> val) {
    _client = val;
    notifyListeners();
  }

  void setOfExpenses(List<Expense> val) {
    _expenses = val;
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

  List<ExpenseType> get getExpenseTypes => _expenseTypes;

  List<Expense> get getExpenses => _expenses;

  List<Client> get getClients => _client;
}

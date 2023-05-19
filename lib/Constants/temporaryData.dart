import 'package:field_manager/Models/attendance_info.dart';

import '../Models/expense.dart';

class TemporaryData{
  static final attendanceList=[
      Attendance(title: "Present",val: 1),
      Attendance(title: "Half Day",val: 0),
      Attendance(title: "Absent",val: 24),
      Attendance(title: "Weekly Off",val: 1),
      Attendance(title: "On Leave",val: 0),
      Attendance(title: "Available Leave",val: 10),
  ];
  static final expenseList=[
    ExpenseDemo(title: "Approved",val:0),
    ExpenseDemo(title: "Pending",val:0),
    ExpenseDemo(title: "Rejected",val:0),
  ];
}
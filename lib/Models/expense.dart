import 'dart:math';

class ExpenseDemo {
  String? title;
  int? val;

  ExpenseDemo({this.title, this.val});
}

class Expense {
//      "id": 1,
//                 "expenseName": "Food ",
//                 "claimed": 500,
//                 "status": "Pending"
  int? id, claimed;
  String? expenseName, status;

  Expense.fromJson(json) {
    id = json['id'] ?? 0;
    claimed = json['claimed'] ?? 0;
    expenseName = json['expenseName'] ?? "";
    status = json['status'] ?? "";
  }
}

class ExpenseType {
//     "id": 1,
//                 "expenseName": "Food "
  int? id;
  String? expenseName;

  ExpenseType.fromJson(json) {
    id = json['id'] ?? 0;
    expenseName = json['expenseName'] ?? "";
  }
}

class ExpenseResponse {
  bool? error;
  List<Expense> expenses = [];
  String? message;

  ExpenseResponse.fromJson(json) {
    error = json['error'] ?? true;
    expenses = json['data']['getExpensesByEmp'] == null
        ? []
        : (json['data']['getExpensesByEmp'] as List)
            .map((e) => Expense.fromJson(e))
            .toList();
  }

  ExpenseResponse.withError(msg) {
    error = false;
    message = msg;
  }
}

class ExpenseTypeResponse {
  bool? error;
  List<ExpenseType> expenseTypes = [];
  String? message;

  ExpenseTypeResponse.fromJson(json) {
    error = json['error'] ?? true;
    expenseTypes = json['data']['getAllExpenseType'] == null
        ? []
        : (json['data']['getAllExpenseType'] as List)
            .map((e) => ExpenseType.fromJson(e))
            .toList();
  }

  ExpenseTypeResponse.withError(msg) {
    error = false;
    message = msg;
  }
}

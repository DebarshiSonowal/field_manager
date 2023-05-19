import 'package:field_manager/Models/expense.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Navigation/navigation.dart';
import '../../Repository/Repository.dart';
import '../../Router/routes.dart';
import '../CreateExpense/widgets/expenses_item.dart';

class Expenses_page extends StatelessWidget {
  const Expenses_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Expense",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        margin: EdgeInsets.symmetric(
          horizontal: 1.w,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 1.h,
        ),
        child: Consumer<Repository>(builder: (context, data, _) {
          return data.getExpenses.isEmpty
              ? Center(
                  child: Text(
                    "No Request",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var item = data.getExpenses[index];
                    return ExpensesItem(item: item);
                  },
                  itemCount: data.getExpenses.length,
                );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigation.instance.navigate(Routes.createExpensesPage);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}



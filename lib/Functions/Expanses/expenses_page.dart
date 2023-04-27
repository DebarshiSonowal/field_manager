import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Navigation/navigation.dart';
import '../../Router/routes.dart';

class Expenses_page extends StatelessWidget {
  const Expenses_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
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
        child: Center(
          child: Text("No Request",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.black,
          ),),
        ),
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

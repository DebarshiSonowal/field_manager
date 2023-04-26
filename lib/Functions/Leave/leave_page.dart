import 'package:field_manager/Navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Router/routes.dart';
import '../../widgets/custom_bottom_navigation.dart';

class LeavePage extends StatelessWidget {
  const LeavePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text(
          "Leave",
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
      bottomNavigationBar: const CustomBottomNavigation(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigation.instance.navigate(Routes.leaveRequestPage);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

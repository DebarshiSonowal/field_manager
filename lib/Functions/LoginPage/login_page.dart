import 'package:field_manager/Constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Widgets/login_card.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 7.w,
          ),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                LoginCard(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "By logging in you're agreed to the privacy policy",
                  style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                    fontSize: 12.sp,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Click here to read privacy policy",
                  style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.purple,
                    fontSize: 12.sp,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

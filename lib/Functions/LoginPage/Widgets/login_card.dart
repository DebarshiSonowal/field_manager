import 'package:field_manager/Navigation/navigation.dart';
import 'package:field_manager/Router/routes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/assets.dart';
import '../../../widgets/custom_button.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            // border: Border.all(
            //   color: Colors.red[500],
            // ),
            borderRadius: BorderRadius.all(Radius.circular(18))),
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 2.h,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
              child: Center(
                child: Image.asset(
                  Assets.logo,
                  scale: 2,
                ),
              ),
            ),
            Text(
              "Field Manager",
              style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.black,
                fontSize: 17.sp,
                // fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 2.5.w,
                vertical: 1.8.h,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black87,
                  width: 1.2,
                ),
                borderRadius:
                const BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.people_alt_rounded,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: emailController,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(
                        color: Colors.black,
                        fontSize: 15.sp,
                      ),
                      decoration: InputDecoration.collapsed(
                        hintText: 'Email',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                          color: Colors.black54,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 2.5.w,
                vertical: 1.8.h,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black87,
                  width: 1.2,
                ),
                borderRadius:
                const BorderRadius.all(Radius.circular(15)),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: passwordController,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(
                        color: Colors.black,
                        fontSize: 15.sp,
                      ),
                      decoration: InputDecoration.collapsed(
                        hintText: 'Password',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                          color: Colors.black54,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomButton(
              title: "Login",
              onClick: (){
                Navigation.instance.navigate(Routes.deviceCheckingPage);
              },
            ),
            SizedBox(
              height: 1.7.h,
            ),
            Text(
              "Forgot Password?",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.purple,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


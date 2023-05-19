import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:field_manager/Api/api_provider.dart';
import 'package:field_manager/Navigation/navigation.dart';
import 'package:field_manager/Router/routes.dart';
import 'package:field_manager/Storage/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
    return Builder(builder: (context) {
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
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
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
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
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
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.black,
                              fontSize: 15.sp,
                            ),
                        decoration: InputDecoration.collapsed(
                          hintText: 'Email',
                          hintStyle:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
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
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
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
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.black,
                              fontSize: 15.sp,
                            ),
                        obscureText: true,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Password',
                          hintStyle:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
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
                onClick: () {
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    if (isEmail(emailController.text)) {
                      login(emailController.text, passwordController.text,
                          context);
                    } else {
                      CherryToast.error(
                              title: Text(
                                "Oops! Wrong Email",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                              ),
                              displayTitle: true,
                              description: Text(
                                "Please enter your email",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.black45,
                                      fontSize: 10.sp,
                                    ),
                              ),
                              animationType: AnimationType.fromTop,
                              animationDuration:
                                  const Duration(milliseconds: 1000),
                              autoDismiss: true)
                          .show(context);
                    }
                  } else {
                    CherryToast.error(
                            title: Text(
                              "Oops! Empty fields",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
                                  ),
                            ),
                            displayTitle: true,
                            description: Text(
                              "Please fill all the fields",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.black45,
                                    fontSize: 10.sp,
                                  ),
                            ),
                            animationType: AnimationType.fromTop,
                            animationDuration:
                                const Duration(milliseconds: 1000),
                            autoDismiss: true)
                        .show(context);
                  }
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
    });
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }

  void login(String email, String password, BuildContext context) async {
    EasyLoading.show(status: 'loading...');
    final response = await ApiProvider.instance.login(email, password);
    if (response.error ?? true) {
      EasyLoading.dismiss(animation: true);
      if (!context.mounted) {
        return;
      }
      CherryToast.error(
              title: Text(
                "Oops! Login Failed",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
              ),
              displayTitle: true,
              description: Text(
                response.message ?? "Something went wrong",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black45,
                      fontSize: 10.sp,
                    ),
              ),
              animationType: AnimationType.fromTop,
              animationDuration: const Duration(milliseconds: 1000),
              autoDismiss: true)
          .show(context);
    } else {
      EasyLoading.dismiss(animation: true);
      if (!context.mounted) {
        return;
      }
      CherryToast.success(
              title: Text(
                "Logged in",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
              ),
              displayTitle: true,
              description: Text(
                response.message ?? "Successfully ",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black45,
                      fontSize: 10.sp,
                    ),
              ),
              animationType: AnimationType.fromTop,
              animationDuration: const Duration(milliseconds: 1000),
              autoDismiss: true)
          .show(context);
      Future.delayed(const Duration(seconds: 1), () {
        LocalStorage.instance.setUser(response.token!);
        Navigation.instance.navigate(Routes.deviceCheckingPage);
      });
    }
  }
}

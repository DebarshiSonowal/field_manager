import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/assets.dart';
import '../../Navigation/navigation.dart';
import '../../Router/routes.dart';
import '../../widgets/custom_button.dart';

class DeviceCheckingDone extends StatefulWidget {
  const DeviceCheckingDone({Key? key}) : super(key: key);

  @override
  State<DeviceCheckingDone> createState() => _DeviceCheckingDoneState();
}

class _DeviceCheckingDoneState extends State<DeviceCheckingDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Device Verification",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.black,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 1.h,
        ),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                Assets.verifiedAnimation,
                fit: BoxFit.fill,
                height: 40.h,
                width: 85.w,
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                "Verification Completed",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.black,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Your device verification is successfully completed",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.black87,
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomButton(
                title: "Ok",
                onClick: (){
                  Navigation.instance.navigate(Routes.dashboardPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:device_information/device_information.dart';
import 'package:field_manager/Constants/assets.dart';
import 'package:field_manager/Navigation/navigation.dart';
import 'package:field_manager/Router/routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

class DeviceChecking extends StatefulWidget {
  const DeviceChecking({Key? key}) : super(key: key);

  @override
  State<DeviceChecking> createState() => _DeviceCheckingState();
}

class _DeviceCheckingState extends State<DeviceChecking> {

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
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                Assets.deviceAnimation,
                fit: BoxFit.fill,
                height: 40.h,
                width: 85.w,
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                "Verifying",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Hold on we are verifying your device this might",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.black87,
                  fontSize: 13.sp,
                ),
              ),
              Text(
                "take some time, please wait",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.black87,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchDetails();
  }

  void fetchDetails() async{
    if(await Permission.phone.request().isGranted){
      String imeiNo = await DeviceInformation.deviceIMEINumber;
      debugPrint(imeiNo);
      Future.delayed(const Duration(seconds: 3,),(){
        Navigation.instance.navigate(Routes.deviceCheckingDonePage);
      });
    }else{
      Future.delayed(const Duration(seconds: 3,),(){
        Navigation.instance.navigate(Routes.deviceCheckingDonePage);
      });
    }

  }
}

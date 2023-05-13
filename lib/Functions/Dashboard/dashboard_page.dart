import 'package:cached_network_image/cached_network_image.dart';
import 'package:field_manager/Api/api_provider.dart';
import 'package:field_manager/Functions/Dashboard/Widgets/dashboard_header.dart';
import 'package:field_manager/Repository/Repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/assets.dart';
import '../../widgets/custom_bottom_navigation.dart';
import 'Widgets/dashboard_appbar.dart';
import 'Widgets/dashboard_attendance_info_card.dart';
import 'Widgets/dashboard_distance_card.dart';
import 'Widgets/dashboard_expense_card.dart';
import 'Widgets/dashboard_shift_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      // controller = FlutterGifController(vsync: this);
      fetchDetails(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(7.h),
        child: const DashboardAppbar(),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 1.h,
            horizontal: 1.w,
          ),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: const [
                DashboardHeader(),
                // SizedBox(
                //   height: 1.h,
                // ),
                ShiftCard(),
                AttendanceInfoCard(),
                DistanceCard(),
                ExpenseCard(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }

  void fetchDetails(BuildContext context) async {
    await fetchAttendance(context);
    await fetchShift(context);
  }

  fetchAttendance(BuildContext context) async {
    EasyLoading.show(status: 'loading...');
    final response = await ApiProvider.instance.attendanceInfo();
    if (response.error ?? true) {
      // EasyLoading.dismiss(animation: true);
      return;
    } else {
      // EasyLoading.dismiss(animation: true);
      if (!context.mounted) {
        return;
      }
      Provider.of<Repository>(context, listen: false)
          .setAttendance(response.data!);
      return;
    }
  }

  fetchShift(BuildContext context) async{
    final response = await ApiProvider.instance.getUserShift();
    if(response.error??true){
      EasyLoading.dismiss(animation: true);
      // return;
    }else{
      EasyLoading.dismiss(animation: true);
      if (!context.mounted) {
        return;
      }
      Provider.of<Repository>(context, listen: false)
          .setUserShift(response.userShift!);
      return;
    }
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_bottom_navigation.dart';
import 'Widgets/attendance_checkin_card.dart';
import 'Widgets/attendance_map_widget.dart';
import 'Widgets/attendance_status_widget.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "Attendance",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            MapWidget(),
            const Align(
              alignment: Alignment.topCenter,
              child: AttendanceStatusWidget(),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: CheckInWidget(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}




import 'package:field_manager/Functions/Attendance/attendance_page.dart';
import 'package:field_manager/Functions/Dashboard/dashboard_page.dart';
import 'package:field_manager/Functions/DeviceChecking/device_checking_done.dart';
import 'package:field_manager/Functions/LoginPage/login_page.dart';
import 'package:field_manager/Router/routes.dart';
import 'package:flutter/material.dart';

import '../Functions/DeviceChecking/device_checking.dart';
import '../Functions/Leave/leave_page.dart';
import '../Functions/More/more_page.dart';
import '../Functions/SplashScreen/splash_screen.dart';
import '../widgets/fade_transition.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    //authentication
    case Routes.splashScreen:
      return FadeTransitionPageRouteBuilder(page: const SplashScreen());
    case Routes.loginPage:
      return FadeTransitionPageRouteBuilder(page: LoginPage());
    case Routes.deviceCheckingPage:
      return FadeTransitionPageRouteBuilder(page: const DeviceChecking());
    case Routes.deviceCheckingDonePage:
      return FadeTransitionPageRouteBuilder(page: const DeviceCheckingDone());

    //Main (Bottom Navigate)
    case Routes.dashboardPage:
      return FadeTransitionPageRouteBuilder(page: const DashboardPage());
    case Routes.attendancePage:
      return FadeTransitionPageRouteBuilder(page: const AttendancePage());
    case Routes.leavePage:
      return FadeTransitionPageRouteBuilder(page: const LeavePage());
    case Routes.morePage:
      return FadeTransitionPageRouteBuilder(page: const MorePage());

    //default
    default:
      return FadeTransitionPageRouteBuilder(page: Container());
  }
}

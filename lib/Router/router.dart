import 'package:field_manager/Functions/DeviceChecking/device_checking_done.dart';
import 'package:field_manager/Functions/LoginPage/login_page.dart';
import 'package:field_manager/Router/routes.dart';
import 'package:flutter/material.dart';

import '../Functions/DeviceChecking/device_checking.dart';
import '../Functions/SplashScreen/splash_screen.dart';
import '../widgets/fade_transition.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashScreen:
      return FadeTransitionPageRouteBuilder(page: const SplashScreen());
    case Routes.loginPage:
      return FadeTransitionPageRouteBuilder(page: LoginPage());
    case Routes.deviceCheckingPage:
      return FadeTransitionPageRouteBuilder(page: const DeviceChecking());
    case Routes.deviceCheckingDonePage:
      return FadeTransitionPageRouteBuilder(page: const DeviceCheckingDone());
    default:
      return FadeTransitionPageRouteBuilder(page: Container());
  }
}

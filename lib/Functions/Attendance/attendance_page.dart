import 'dart:async';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:field_manager/Api/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Repository/Repository.dart';
import '../../widgets/custom_bottom_navigation.dart';
import 'Widgets/attendance_checkin_card.dart';
import 'Widgets/attendance_map_widget.dart';
import 'Widgets/attendance_status_widget.dart';

class AttendancePage extends StatelessWidget {
  AttendancePage({Key? key}) : super(key: key);
  loc.Location location = loc.Location();

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
            Align(
              alignment: Alignment.bottomCenter,
              child: Consumer<Repository>(
                builder: (context,data,_) {
                  return CheckInWidget(
                    isCheckedIn: data.isCheckedIn,
                    checkIn: () {
                      checkIn(context);
                    },
                    checkOut: () {
                      checkOut(context);
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }

  void checkIn(BuildContext context) async {
    EasyLoading.show(status: 'loading...');
    LatLng location = await getLocation();
    String address = await getAddress(
      location.latitude,
      location.longitude,
    );
    final response = await ApiProvider.instance.checkIn(
      address,
      location.latitude,
      location.longitude,
    );
    if (response.error ?? true) {
      EasyLoading.dismiss(animation: true);
      if (!context.mounted) {
        return;
      }
      CherryToast.error(
              title: Text(
                "Oops! Check In Failed",
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
      Provider.of<Repository>(context,listen: false).setCheckedIn(true);
    }
  }

  getLocation() async {
    bool _serviceEnabled;
    loc.PermissionStatus _permissionGranted;
    loc.LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    return LatLng(_locationData.latitude!, _locationData.longitude!);
  }

  getAddress(lat, lang) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lang);
    return placemarks.first.name;
  }

  void checkOut(BuildContext context) async{
    EasyLoading.show(status: 'loading...');
    final response = await ApiProvider.instance.checkOut();
    if(response.error??true) {
      EasyLoading.dismiss(animation: true);
      if (!context.mounted) {
        return;
      }
      CherryToast.error(
          title: Text(
            "Oops! Check Out Failed",
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
    }else{
      EasyLoading.dismiss(animation: true);
      if (!context.mounted) {
        return;
      }
      CherryToast.success(
          title: Text(
            "Checked Out",
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
      Provider.of<Repository>(context,listen: false).setCheckedIn(false);
    }
  }
}

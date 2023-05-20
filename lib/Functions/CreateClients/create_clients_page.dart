import 'dart:io';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:field_manager/Api/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:open_settings_plus/open_settings_plus.dart';
import 'package:sizer/sizer.dart';

import '../../Navigation/navigation.dart';
import '../../main.dart';
import '../../widgets/alert.dart';
import '../../widgets/rounded_corner_button.dart';
import '../LeaveRequest/Widgets/leave_date_item.dart';

class CreateClientsPage extends StatefulWidget {
  const CreateClientsPage({Key? key}) : super(key: key);

  @override
  State<CreateClientsPage> createState() => _CreateClientsPageState();
}

class _CreateClientsPageState extends State<CreateClientsPage> {
  String? location;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final contactController = TextEditingController();
  final cityController = TextEditingController();
  final commentsController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    cityController.dispose();
    phoneController.dispose();
    contactController.dispose();
    commentsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigation.instance.goBack();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Create Client",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Builder(builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: 1.h,
            horizontal: 2.w,
          ),
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                    vertical: 0.h,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 0.5.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: nameController,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                          // fontWeight: FontWeight.bold,
                        ),
                    cursorColor: Colors.black,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      hintText: "Name",
                      hintStyle:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.black,
                                fontSize: 14.sp,
                                // fontWeight: FontWeight.bold,
                              ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusColor: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                    vertical: 0.h,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 0.5.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: emailController,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                          // fontWeight: FontWeight.bold,
                        ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      hintText: "Email",
                      hintStyle:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.black,
                                fontSize: 14.sp,
                                // fontWeight: FontWeight.bold,
                              ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusColor: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                    vertical: 0.h,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 0.5.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: phoneController,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                          // fontWeight: FontWeight.bold,
                        ),
                    cursorColor: Colors.black,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                      hintText: "Phone Number",
                      hintStyle:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.black,
                                fontSize: 14.sp,
                                // fontWeight: FontWeight.bold,
                              ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusColor: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                    vertical: 0.h,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 0.5.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: contactController,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                          // fontWeight: FontWeight.bold,
                        ),
                    cursorColor: Colors.black,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.supervised_user_circle,
                        color: Colors.black,
                      ),
                      hintText: "Contact Person",
                      hintStyle:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.black,
                                fontSize: 14.sp,
                                // fontWeight: FontWeight.bold,
                              ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusColor: Colors.black,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getLocation();
                  },
                  child: Container(
                    height: 8.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 0.h,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 0.5.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_city,
                          color: Colors.black,
                          size: 18.sp,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        SizedBox(
                          width: 70.w,
                          child: Text(
                            location ?? "Location",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  // fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // child: LeaveDateItem(
                  //   dateFrom: location ?? "Location",
                  //   icon: Icons.location_city,
                  //   updateDate: (String val) {},
                  // ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                    vertical: 0.h,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 0.5.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: cityController,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                          // fontWeight: FontWeight.bold,
                        ),
                    cursorColor: Colors.black,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.location_city,
                        color: Colors.black,
                      ),
                      hintText: "City",
                      hintStyle:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.black,
                                fontSize: 14.sp,
                                // fontWeight: FontWeight.bold,
                              ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusColor: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                    vertical: 0.h,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 0.5.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: commentsController,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black,
                          fontSize: 14.sp,
                          // fontWeight: FontWeight.bold,
                        ),
                    cursorColor: Colors.black,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                      hintText: "Comments",
                      hintStyle:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.black,
                                fontSize: 14.sp,
                                // fontWeight: FontWeight.bold,
                              ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusColor: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                RoundedCornerButton(
                  txt: "Submit",
                  onClick: () {
                    if (nameController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        phoneController.text.isNotEmpty &&
                        contactController.text.isNotEmpty &&
                        cityController.text.isNotEmpty &&
                        commentsController.text.isNotEmpty &&
                        location != null) {
                      addClient(
                          context,
                          nameController.text,
                          emailController.text,
                          phoneController.text,
                          contactController.text,
                          location!,
                          cityController.text,
                          commentsController.text);
                    } else {
                      CherryToast.error(
                              title: Text(
                                "Oops! Unable to add client",
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
                                "Please enter all the necessary information",
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
              ],
            ),
          ),
        );
      }),
    );
  }

  void addClient(BuildContext context, String name, String email, String phone,
      String contact, String location, String city, String comment) async{
    EasyLoading.show(status: 'loading...');
    final response = await ApiProvider.instance.addClient( name, email, phone, contact,location, city, comment);
    if (response.error ?? true) {
      EasyLoading.dismiss(animation: true);
      if (!context.mounted) {
        return;
      }
      CherryToast.error(
          title: Text(
            "Oops! Adding Client Failed",
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
            "Client Added Successfully",
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
    }
  }

  void getLocation() async {
    EasyLoading.show(status: 'loading...');
    var loc = await _determinePosition();
    List<Placemark> placemarks = await placemarkFromCoordinates(
      loc.latitude,
      loc.longitude,
    );
    EasyLoading.dismiss(animation: true);
    setState(() {
      location = placemarks.first.locality;
    });
  }

  Future<geo.Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      EasyLoading.dismiss(animation: true);
      showError("Please go to settings and enable location services",
          "Location services are disabled", () async {
        if (Platform.isAndroid) {
          await settingsAndroid.locationSource();
          Navigation.instance.goBack();
        } else {
          await settingsiOS.locationServices();
          Navigation.instance.goBack();
        }
      });
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        EasyLoading.dismiss(animation: true);
        showError("Please go to settings and give location permission",
            "Location permission is denied", () async {
          if (Platform.isAndroid) {
            await settingsAndroid.appSettings();
            Navigation.instance.goBack();
          } else {
            await settingsiOS.settings();
            Navigation.instance.goBack();
          }
        });
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      EasyLoading.dismiss(animation: true);
      showError("Please go to settings and give location permission",
          "Location permission is denied", () async {
        if (Platform.isAndroid) {
          await settingsAndroid.appSettings();
          Navigation.instance.goBack();
        } else {
          await settingsiOS.settings();
          Navigation.instance.goBack();
        }
      });
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void showError(String msg, title, Function onTap) {
    AlertX.instance.showAlert(
        title: title ?? "Error",
        msg: msg,
        positiveButtonText: "Done",
        positiveButtonPressed: () {
          onTap();
        });
  }
}

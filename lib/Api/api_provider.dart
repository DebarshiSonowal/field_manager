import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Models/attendance.dart';
import '../Models/generic_response.dart';
import '../Models/leaveType.dart';
import '../Models/login.dart';
import '../Models/logout.dart';
import '../Models/user_shift.dart';
import '../Storage/storage.dart';

class ApiProvider {
  ApiProvider._();

  static final ApiProvider instance = ApiProvider._();

  final String baseUrl = "https://fmgr.h24x7.in";

  final String path = "api/v1";

  Dio? dio;

  Future<LoginResponse> login(String email,String password) async {
    var data = {
      'email': email,
      'password': password,
    };
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer ${Storage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/user/login";
    dio = Dio(option);
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));

    try {
      Response? response = await dio?.post(
        url,
        data: jsonEncode(data),
      );
      debugPrint("login response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return LoginResponse.fromJson(response?.data);
      } else {
        debugPrint("login  error: ${response?.data}");
        return LoginResponse.withError(
            response?.data['message'] ?? "Something went wrong");
      }
    } on DioError catch (e) {
      debugPrint("login  error: ${e.response}");
      return LoginResponse.withError(e.message);
    }
  }

  Future<LogoutResponse> logOut() async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${LocalStorage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/user/logout";
    dio = Dio(option);
    debugPrint(url.toString());
    // debugPrint(jsonEncode(data));

    try {
      Response? response = await dio?.post(url);
      debugPrint("logout response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return LogoutResponse.fromJson(response?.data);
      } else {
        debugPrint("logout  error: ${response?.data}");
        return LogoutResponse.withError(
            response?.data['message'] ?? "Something went wrong");
      }
    } on DioError catch (e) {
      debugPrint("logout response: ${e.response}");
      return LogoutResponse.withError(e.message);
    }
  }


  Future<GenericResponse> checkOut() async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${LocalStorage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/user/checkOut";
    dio = Dio(option);
    debugPrint(url.toString());
    // debugPrint(jsonEncode(data));

    try {
      Response? response = await dio?.post(url);
      debugPrint("checkOut response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return GenericResponse.fromJson(response?.data);
      } else {
        debugPrint("checkOut error: ${response?.data}");
        return GenericResponse.withError(
            response?.data['message'] ?? "Something went wrong");
      }
    } on DioError catch (e) {
      debugPrint("checkOut response: ${e.response}");
      return GenericResponse.withError(e.message);
    }
  }

  Future<AttendanceResponse> attendanceInfo() async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${LocalStorage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/user/calculateAtt";
    dio = Dio(option);
    debugPrint(url.toString());
    // debugPrint(jsonEncode(data));

    try {
      Response? response = await dio?.get(url);
      debugPrint("AttendanceResponse : ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return AttendanceResponse.fromJson(response?.data);
      } else {
        debugPrint("attendance  error: ${response?.data}");
        return AttendanceResponse.withError(
            response?.data['message'] ?? "Something went wrong");
      }
    } on DioError catch (e) {
      debugPrint("Attendance error: ${e.response}");
      return AttendanceResponse.withError(e.message);
    }
  }

  Future<UserShiftResponse> getUserShift() async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${LocalStorage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/user/getUserShift";
    dio = Dio(option);
    debugPrint(url.toString());
    // debugPrint(jsonEncode(data));

    try {
      Response? response = await dio?.get(url);
      debugPrint("UserShiftResponse : ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return UserShiftResponse.fromJson(response?.data);
      } else {
        debugPrint("UserShiftResponse  error: ${response?.data}");
        return UserShiftResponse.withError(
            response?.data['message'] ?? "Something went wrong");
      }
    } on DioError catch (e) {
      debugPrint("UserShiftResponse error: ${e.response}");
      return UserShiftResponse.withError(e.message);
    }
  }

  Future<GenericResponse> checkIn(String checInLocation,double lat,double lang) async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${LocalStorage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var data = {
      'checInLocation': checInLocation,
      'latitude': lat,
      'longitude': lang,
    };
    var url = "$baseUrl/$path/user/checkIn";
    dio = Dio(option);
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));

    try {
      Response? response = await dio?.post(
        url,
        data: jsonEncode(data),
      );
      debugPrint("checkIn Response : ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return GenericResponse.fromJson(response?.data);
      } else {
        debugPrint("checkIn Response  error: ${response?.data}");
        return GenericResponse.withError(
            response?.data['message'] ?? "Something went wrong");
      }
    } on DioError catch (e) {
      debugPrint("checkIn Response error: ${e.response}");
      return GenericResponse.withError(e.message);
    }
  }

  Future<GenericResponse> updateLocation(String checInLocation,double lat,double lang) async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${LocalStorage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var data = {
      'checInLocation': checInLocation,
      'latitude': lat,
      'longitude': lang,
    };
    var url = "$baseUrl/$path/user/updateLocation";
    dio = Dio(option);
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));

    try {
      Response? response = await dio?.post(
        url,
        data: jsonEncode(data),
      );
      debugPrint("updateLocation Response : ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return GenericResponse.fromJson(response?.data);
      } else {
        debugPrint("updateLocation Response  error: ${response?.data}");
        return GenericResponse.withError(
            response?.data['message'] ?? "Something went wrong");
      }
    } on DioError catch (e) {
      debugPrint("updateLocation Response error: ${e.response}");
      return GenericResponse.withError(e.message);
    }
  }

  Future<GenericResponse> addLeaveRequest(
      String fromDate,String toDate,String leaveType,String comments) async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${LocalStorage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var data = {
      'fromDate': fromDate,
      'toDate': toDate,
      'leaveType': leaveType,
      'comments': comments,
    };
    var url = "$baseUrl/$path/user/addLeaveRequest";
    dio = Dio(option);
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));

    try {
      Response? response = await dio?.post(
        url,
        data: jsonEncode(data),
      );
      debugPrint("updateLocation Response : ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return GenericResponse.fromJson(response?.data);
      } else {
        debugPrint("updateLocation Response  error: ${response?.data}");
        return GenericResponse.withError(
            response?.data['message'] ?? "Something went wrong");
      }
    } on DioError catch (e) {
      debugPrint("updateLocation Response error: ${e.response}");
      return GenericResponse.withError(e.message);
    }
  }

  Future<LeaveResponse> getAllLeaveType() async {
    BaseOptions option = BaseOptions(
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 8),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${LocalStorage.instance.token}'
          // 'APP-KEY': ConstanceData.app_key
        });
    var url = "$baseUrl/$path/user/getAllLeaveType";
    dio = Dio(option);
    debugPrint(url.toString());
    // debugPrint(jsonEncode(data));

    try {
      Response? response = await dio?.post(url);
      debugPrint("getAllLeaveType response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return LeaveResponse.fromJson(response?.data);
      } else {
        debugPrint("getAllLeaveType  error: ${response?.data}");
        return LeaveResponse.withError(
            response?.data['message'] ?? "Something went wrong");
      }
    } on DioError catch (e) {
      debugPrint("getAllLeaveType response: ${e.response}");
      return LeaveResponse.withError(e.message);
    }
  }

}

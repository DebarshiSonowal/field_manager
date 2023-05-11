import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Models/attendance.dart';
import '../Models/login.dart';
import '../Models/logout.dart';
import '../Storage/storage.dart';

class ApiProvider {
  ApiProvider._();

  static final ApiProvider instance = ApiProvider._();

  final String baseUrl = "https://fmgr.h24x7.in";

  final String path = "/api/v1";

  Dio? dio;

  Future<LoginResponse> login(email, password) async {
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
    var url = "$baseUrl/user/login";
    dio = Dio(option);
    debugPrint(url.toString());
    debugPrint(jsonEncode(data));

    try {
      Response? response = await dio?.post(url, data: jsonEncode(data));
      debugPrint("login response: ${response?.data}");
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        return LoginResponse.fromJson(response?.data);
      } else {
        debugPrint("login  error: ${response?.data}");
        return LoginResponse.withError(
            response?.data['message'] ?? "Something went wrong");
      }
    } on DioError catch (e) {
      debugPrint("login  response: ${e.response}");
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
    var url = "$baseUrl/user/logout";
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
    var url = "$baseUrl/user/login";
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
}

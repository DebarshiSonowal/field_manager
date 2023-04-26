import 'package:flutter/cupertino.dart';

class Repository extends ChangeNotifier {
  late bool _isDark,_notification;
  late int _index;

  Repository() {
    _isDark = false;
    _notification = false;
    _index = 0;
  }
  void changeTheme(bool val) {
    _isDark = val;
    notifyListeners();
  }
  void changeNotification(bool val) {
    _notification = val;
    notifyListeners();
  }
  void updateIndex(int val) {
    _index = val;
    notifyListeners();
  }
  int get index => _index;
  bool get isDark => _isDark;
  bool get notification => _notification;
}

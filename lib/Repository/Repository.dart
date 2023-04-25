import 'package:flutter/cupertino.dart';

class Repository extends ChangeNotifier {
  late bool _isDark;
  late int _index;

  Repository() {
    _isDark = false;
    _index = 0;
  }

  void updateIndex(int val) {
    _index = val;
    notifyListeners();
  }
  int get index => _index;
  bool get isDark => _isDark;
}

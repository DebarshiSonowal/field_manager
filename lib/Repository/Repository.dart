
import 'package:flutter/cupertino.dart';

class Repository extends ChangeNotifier{
  late bool _isDark;
  Repository() {
    _isDark = false;
  }

  bool get isDark => _isDark;
}
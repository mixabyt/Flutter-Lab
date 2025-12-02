import 'package:flutter/material.dart';

class RgbModel extends ChangeNotifier {
  double _red = 0;
  double _green = 0;
  double _blue = 0;

  double get red => _red;
  double get green => _green;
  double get blue => _blue;

  void setRed(double value) {
    _red = value;
    notifyListeners();
  }

  void setGreen(double value) {
    _green = value;
    notifyListeners();
  }

  void setBlue(double value) {
    _blue = value;
    notifyListeners();
  }
}
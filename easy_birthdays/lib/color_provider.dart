import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier {
  Color _colorSetting = Colors.blue;

  Color get colorSetting => _colorSetting;

  set colorSetting(Color newColor) {
    _colorSetting = newColor;
    notifyListeners();
  }
}

class PriceProvider with ChangeNotifier {
  bool _priceSetting = true;

  bool get priceSetting => _priceSetting;

  set priceSetting(bool value) {
    _priceSetting = value;
    notifyListeners();
  }
}

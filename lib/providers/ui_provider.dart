import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOpt = 0;
  int get selectedMenuOpt => _selectedMenuOpt;

  set selectedMenuOpt(value) {
    _selectedMenuOpt = value;
    notifyListeners();
  }
}

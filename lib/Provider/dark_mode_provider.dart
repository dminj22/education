import 'package:flutter/foundation.dart';

class DarkModeProvider extends ChangeNotifier{
  var darkMode = false;
  void onChange(value){
    darkMode = value;
    notifyListeners();
  }
}
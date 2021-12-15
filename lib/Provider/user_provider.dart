import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  var token;
  var userId;

  void onChange(value) async {
    token = value;
    userId = value;
    notifyListeners();
  }
}

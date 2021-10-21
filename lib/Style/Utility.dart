import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

showSnackBar(context, msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
    duration: Duration(seconds: 3),
  ));
}

class Utility {
  showSnackBar(context, msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: Duration(seconds: 3),
    ));
  }

  checkConnection(context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    print(connectivityResult);
    if (connectivityResult == ConnectivityResult.mobile) {
      Navigator.pop(context);
    } else if (connectivityResult == ConnectivityResult.wifi) {
      Navigator.pop(context);
    } else if (connectivityResult == ConnectivityResult.none) {
      Navigator.pushNamed(context, '/issueConnectionPage');
    }
  }
}

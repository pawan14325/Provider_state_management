import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDBManager extends ChangeNotifier {
  Future<void> setValue({required String key, required dynamic value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw Exception("Invalid type for SharedPreferences");
    }

    notifyListeners();
  }
  Future<dynamic> getValue({required String key,}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

   var value = prefs.get(key);
   log("VALUE $value");
    notifyListeners();
    return value;

  }
}

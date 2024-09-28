import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/local_services/local_storage.dart';

class ThemeManager extends ChangeNotifier {
  bool _isDarkMode = true;

  bool getTheme() => _isDarkMode;


  Future<void> checkTheme(BuildContext context) async {
    var localDBManager = Provider.of<LocalDBManager>(context, listen: false);
    _isDarkMode = await localDBManager.getValue(key: "theme") ?? true;
    notifyListeners();
  }

  void changeTheme(BuildContext context, {required bool value}) {
    _isDarkMode = value;
    saveTheme(context, _isDarkMode);
    notifyListeners();
  }

  void saveTheme(BuildContext context, bool value) {
    Provider.of<LocalDBManager>(context, listen: false).setValue(key: "theme", value: _isDarkMode);
  }
}

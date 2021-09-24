import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_ui/utils/progressBarManager/progressModels.dart';
import 'package:flutter_test_ui/utils/progressBarManager/progressService.dart';

import '../locator.dart';

class BaseModel extends ChangeNotifier {
  final ProgressService _dialogService = locator<ProgressService>();
  ProgressResponse hh;

  bool _busy = false;
  bool get busy => _busy;

  bool _isVisible = false;
  bool get isVisible => _isVisible;

  changeVisi() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

//This tells the app, the app is busy and dialog starts immediately and ends if it is equal to false
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
    if (value == true) {
      _dialogService.showDialog();
    } else {
      _dialogService.dialogComplete(hh);
    }
  }
}

import 'package:flutter/foundation.dart';

class UserData extends ChangeNotifier {
  bool _isNightMode;
  bool _dataSavingMode;
  bool _gifsAutoplay;
  bool _preventAccidentalExit;
  bool _openWebInApp;

  bool _pressedBackOnce;

  UserData() {
    _isNightMode = false;
    _dataSavingMode = false;
    _gifsAutoplay = false;
    _preventAccidentalExit = true;
    _openWebInApp = true;
    _pressedBackOnce = false;
  }

  bool get isNightMode => _isNightMode;
  bool get dataSavingMode => _dataSavingMode;
  bool get gifsAutoplay => _gifsAutoplay;
  bool get preventAccidentalExit => _preventAccidentalExit;
  bool get openWebInApp => _openWebInApp;
  bool get pressedBackOnce => _pressedBackOnce;

  set isNightMode(bool newValue) {
    _isNightMode = newValue;
    notifyListeners();
  }

  set dataSavingMode(bool newValue) {
    _dataSavingMode = newValue;
    notifyListeners();
  }

  set gifsAutoplay(bool newValue) {
    _gifsAutoplay = newValue;
    notifyListeners();
  }

  set preventAccidentalExit(bool newValue) {
    _preventAccidentalExit = newValue;
    notifyListeners();
  }

  set openWebInApp(bool newValue) {
    _openWebInApp = newValue;
    notifyListeners();
  }

  set pressedBackOnce(bool newValue) {
    _pressedBackOnce = newValue;
    notifyListeners();
  }
}

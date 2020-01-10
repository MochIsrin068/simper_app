import 'package:flutter/foundation.dart';

class ChangeCommandDisposistion with ChangeNotifier{

  String _value = "Hadiri dan Laporkan";

  String get value => _value;

  set value(String newValue){
    _value = newValue;
    notifyListeners();
  }
}
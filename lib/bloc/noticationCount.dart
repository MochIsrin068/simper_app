import 'package:flutter/foundation.dart';

class NotificationCount with ChangeNotifier{

  int _value = 0;

  int get value => _value;

  set value(int newValue){
    _value = newValue;
    notifyListeners();
  }

  notifCount(){
    value++;
    notifyListeners();
  }

}
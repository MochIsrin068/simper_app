import 'package:flutter/foundation.dart';

class AddDispositionBloc with ChangeNotifier{

  String _value = "";

  String get value => _value;

  set value(String newValue){
    _value = newValue;
    notifyListeners();
  }

}
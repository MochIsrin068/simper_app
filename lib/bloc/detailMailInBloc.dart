import 'package:flutter/foundation.dart';

class CheckPDF with ChangeNotifier{

  bool _pdfPage = true;

  bool get pdfPage => _pdfPage;

  set pdfPage(bool newState){
    _pdfPage = newState;
    notifyListeners();
  }
}
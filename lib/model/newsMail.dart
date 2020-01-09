import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simper_app/config/api.dart';

var newsMail;

Future newsMailData(String username, String password) async{
  var res = await http.post( baseUrl+"login", body: {
    "username" : username,
    "password" : password
  });

  var jsonData = json.decode(res.body);
  newsMail = jsonData["suratbaru"];
  return jsonData["suratbaru"];
} 
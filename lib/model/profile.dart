import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simper_app/config/api.dart';

var profile;

Future profileData(String idUser) async{
  var res = await http.get(baseUrl+"profile?id_user=$idUser");
  var jsonData = json.decode(res.body);
  profile = jsonData["data"][0];
  return jsonData["data"][0];
} 
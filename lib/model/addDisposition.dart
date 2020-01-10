import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simper_app/config/api.dart';

var addDisposition;

Future addDispositionData(Map<String, String> data) async {
  for (var i = 0; i < data.length; i++) {}

  var res = await http.post(baseUrl + "buat_disposisi", body: data);

  var jsonData = json.decode(res.body);
  addDisposition = jsonData;
  return jsonData;
}

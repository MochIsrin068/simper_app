import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simper_app/config/api.dart';

var dataDetailDisposisiMasuk;

Future detailDisposisiMasukData(String disposisiId) async {
  var res =
      await http.get(baseUrl + "detail_disposisi?id_disposisi=$disposisiId");

  var jsonData = json.decode(res.body);
  dataDetailDisposisiMasuk = jsonData;
  return jsonData;
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simper_app/config/api.dart';

var tujuanMailInData;

Future getDataTujuanMailIn(String idJabatan, String idDisposisi, String idSurat) async {
  var res = await http.get(baseUrl +
      "user_disposisi?id_jabatan=$idJabatan&id_disposisi=$idDisposisi&id_surat=$idSurat");
  var jsonData = json.decode(res.body);

  tujuanMailInData = jsonData;
  return jsonData;
}

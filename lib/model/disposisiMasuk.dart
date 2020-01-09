import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simper_app/config/api.dart';

var dataDisposisiMasuk;

Future disposisiMasukData(String idUser) async{
  var res = await http.get(baseUrl+"list_surat_masuk?id_user=$idUser");

  var jsonData = json.decode(res.body);
  dataDisposisiMasuk = jsonData;
  return jsonData;
} 
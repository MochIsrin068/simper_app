import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simper_app/config/api.dart';

var suratMasukSelesai;

Future suratMasukSelesaiData(String idUser) async{
  var res = await http.get(baseUrl+"list_surat_selesai?id_user=$idUser");
  var jsonData = json.decode(res.body);
  suratMasukSelesai = jsonData;
  return jsonData;
} 
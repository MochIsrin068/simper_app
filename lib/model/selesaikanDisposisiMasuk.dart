import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simper_app/config/api.dart';

var selesaikanDisposisiMasuk;

Future selesaikanDisposisiMasukData(String disposisiId, String disposisiStatus) async{
  var res = await http.post( baseUrl+"selesai_disposisi", body: {
    "disposisi_id" : disposisiId,
    "disposisi_status" : disposisiStatus
  });

  var jsonData = json.decode(res.body);
  selesaikanDisposisiMasuk = jsonData;
  return jsonData;
} 
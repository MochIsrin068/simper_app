import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simper_app/config/api.dart';

var editProfile;

Future editProfiledata(String idUser, String username, String firstName,
    String lastName, String email, String phone, String password) async {
  var res = await http.post(baseUrl + "update_profile", body: {
    "id_user": idUser,
    "username": username,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "password": password,
  });

  var jsonData = json.decode(res.body);
  editProfile = jsonData;
  return jsonData;
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simper_app/bloc/addMailInBloc.dart';
import 'package:simper_app/bloc/changeCommandDisposition.dart';
import 'package:simper_app/model/addDisposition.dart';
import 'package:simper_app/model/dispositionData.dart';
import 'package:simper_app/model/tujuanMailInDisposisi.dart';

class AddMailInDisposisi extends StatefulWidget {
  final String idJabatan;
  final String idDisposisi;
  final String idSurat;

  AddMailInDisposisi({this.idJabatan, this.idDisposisi, this.idSurat});

  @override
  _AddMailInDisposisiState createState() => _AddMailInDisposisiState();
}

class _AddMailInDisposisiState extends State<AddMailInDisposisi> {
  final Future<SharedPreferences> _sharedPref = SharedPreferences.getInstance();

  String jabatanId;
  String userId;

  getIdJabatan() async {
    final sha = await _sharedPref;
    jabatanId = sha.getString('jabatan_id');
    userId = sha.getString('id');
    setState(() {});
  }

  setPendisposisi() async {
    final sha = await _sharedPref;
    sha.setString("pendisposisi", jabatanId);
  }

  @override
  void initState() {
    super.initState();
    getIdJabatan();
  }

  List<bool> _valueOfData = [];

  itreablesBoolean(int _valueChecked) {
    for (var i = 0; i < _valueChecked; i++) {
      _valueOfData.add(false);
    }
  }

  // Data Tujuan Disposisi
  List _tujuanDisposisi;

  // Add New Perintah
  final Map<String, String> dataDisposisi = {};
  final List<Map<String, String>> dispositionCommand = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20.0),
        child: ListView(children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Tambah Disposisi",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18.0)),
                      SizedBox(height: 4.0),
                      Text("Tambah atau buat disposisi ke bawahan anda",
                          style: TextStyle(fontSize: 14.0))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(
            height: 20.0,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text("Tujuan Disposisi:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blueAccent))),
          Divider(),
          FutureBuilder(
            future: getDataTujuanMailIn(
                widget.idJabatan, widget.idDisposisi, widget.idSurat),
            builder: (context, snap) {
              if (snap.hasData) {
                if (snap.data["data"] == null) {
                  return Center(child: Text("Tidak Dapat Mendisposisi"));
                } else {
                  itreablesBoolean(snap.data["data"].length);
                  return ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snap.data["data"].length,
                    itemBuilder: (context, i) {
                      return Container(
                          child: CheckboxListTile(
                        onChanged: (newValue) {
                          _tujuanDisposisi = snap.data["perintah"];

                          if (_valueOfData[i] == false) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    title: Text("Perintah Disposisi"),
                                    content: Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: DropdownButtonHideUnderline(
                                            child: Consumer<
                                                ChangeCommandDisposistion>(
                                          builder: (context, command, _) {
                                            return DropdownButton(
                                                hint: Text("Pilih Item"),
                                                value: command.value,
                                                onChanged: (newValue) {
                                                  print(command.value);
                                                  command.value = newValue;
                                                  print(command.value);
                                                },
                                                items: _tujuanDisposisi
                                                    .map((value) {
                                                  return DropdownMenuItem(
                                                    value: value,
                                                    child: Text(value,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 10.0)),
                                                  );
                                                }).toList());
                                          },
                                        ))),
                                    actions: <Widget>[
                                      Consumer<ChangeCommandDisposistion>(
                                        builder: (context, command, _) {
                                          return MaterialButton(
                                            onPressed: () {
                                              setState(() {
                                                dataDisposisi.addAll({
                                                  "id_surat[]${snap.data["data"][i]["id"]}":
                                                      snap.data["id_surat"],
                                                  "jabatan_asal[]${snap.data["data"][i]["id"]}":
                                                      jabatanId,
                                                  "jabatan_tujuan[]${snap.data["data"][i]["id"]}":
                                                      snap.data["data"][i]
                                                          ["jabatan_id"],
                                                  "user_asal[]${snap.data["data"][i]["id"]}":
                                                      userId,
                                                  "user_tujuan[]${snap.data["data"][i]["id"]}":
                                                      snap.data["data"][i]
                                                          ["id"],
                                                  "instruksi[]${snap.data["data"][i]["id"]}":
                                                      command.value,
                                                });
                                                // dispositionCommand.addAll([
                                                //   {
                                                //     "idSurat" : snap.data["id_surat"],
                                                //     "jabatanAsal" : jabatanId,
                                                //     "jabatanTujuan" : snap.data["data"][i]
                                                //         ["jabatan_id"],
                                                //     "userAsal" : userId,
                                                //     "userTujuan" : snap.data["data"][i]["id"],
                                                //     "instruksi" : command.value,
                                                //   }
                                                // ]);
                                              });
                                              print(dataDisposisi);
                                              Navigator.of(context).pop();
                                            },
                                            color: Colors.amber[600],
                                            child: Text("OK",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          );
                                        },
                                      )
                                    ],
                                  );
                                });
                          }
                          setState(() {
                            _valueOfData[i] = newValue;
                          });
                        },
                        value: _valueOfData[i],
                        title: Text(
                            snap.data["data"][i]["first_name"] +
                                " " +
                                snap.data["data"][i]["last_name"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54)),
                        subtitle: Text(snap.data["data"][i]["jabatan_name"]),
                      ));
                    },
                  );
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(10.0),
            child: MaterialButton(
              onPressed: () {
                if (dataDisposisi.isEmpty) {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                            title: Text("Status Disposisi"),
                            content: Container(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                  "Silahkan Pilih Tujuan Disposisi Terlebih Dahulu"),
                            ),
                            actions: <Widget>[
                              MaterialButton(
                                color: Colors.amber[600],
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Close",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ));
                } else {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return FutureBuilder(
                          future: addDispositionData(dataDisposisi),
                          builder: (context, snap) {
                            print("snapshot : ${snap.data}");
                            print("data : $addDisposition");
                            if (snap.hasData) {
                              print("snapshot : ${snap.data}");
                              print("data : $addDisposition");
                              return CupertinoAlertDialog(
                                title: Text("Status Disposisi"),
                                content: Container(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(snap.data["message"]),
                                ),
                                actions: <Widget>[
                                  MaterialButton(
                                    color: Colors.amber[600],
                                    onPressed: () {
                                      setPendisposisi();
                                      setState(() {
                                        dataDisposisi.clear();
                                      });
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Close",
                                        style: TextStyle(color: Colors.white)),
                                  )
                                ],
                              );
                            } else {
                              print("snapshot : ${snap.data}");
                              print("data : $addDisposition");
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        );
                      });
                }
              },
              color: Colors.green,
              child: Text("Kirim", style: TextStyle(color: Colors.white)),
            ),
          )
        ]),
      ),
    );
  }
}

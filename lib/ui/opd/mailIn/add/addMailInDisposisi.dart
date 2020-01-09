import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:simper_app/bloc/addMailInBloc.dart';
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
  final List peopleDisposition = [
    {
      "nama": "Dodin Jamiluddin, SE",
      "status": "Sub. Bidang Anggaran 1 ( Kasubid )",
      "Dodin Jamiluddin, SE": false
    },
    {
      "nama": "Hanasary Punara, SE, MM",
      "status": "Sub. Bidang Anggaran 2 ( Kasubid )",
      "Hanasary Punara, SE, MM": false
    }
  ];

  final Map<String, Widget> behaviour = {};
  final _curdate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  _newWidgetBuid(String nama) {
    String _dropDownValue;
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Untuk " + nama,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600)),
          SizedBox(height: 10.0),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  // underline: Container(),
                  hint: Text("Pilih Item"),
                  value: _dropDownValue,
                  onChanged: (String newValue) {
                    setState(() {
                      behaviour.remove(nama);
                      _dropDownValue = newValue;
                      behaviour.addAll({nama: _newWidgetBuid(nama)});
                    });
                  },
                  items: itemsBehaviour
                      .map((String value) => DropdownMenuItem(
                            value: value,
                            child:
                                Text(value, style: TextStyle(fontSize: 12.0)),
                          ))
                      .toList()),
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: TextField(
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 12.0),
                  border: InputBorder.none,
                  hintText: "Tambahan"),
            ),
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  List<bool> _valueOfData = [];

  itreablesBoolean(List _valueChecked) {
    for (var i = 0; i < _valueChecked.length; i++) {
      _valueOfData.add(false);
    }
  }

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
                  itreablesBoolean(snap.data["data"]);
                  return ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snap.data["data"].length,
                    itemBuilder: (context, i) {
                      return Container(
                          child: CheckboxListTile(
                        onChanged: (newValue) {
                          // setState(() {
                          //   data["nama"] = newValue;

                          //   if (data[data["nama"]]) {
                          //     behaviour[data["nama"]] =
                          //         _newWidgetBuid(data["nama"]);
                          //   } else {
                          //     behaviour.remove(data["nama"]);
                          //   }
                          // });
                          print(_valueOfData);
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
                  // return Column(
                  //     children: snap.data["data"]
                  //         .map((data) => Container(
                  //                 child: CheckboxListTile(
                  //               onChanged: (newValue) {
                  //                 // setState(() {
                  //                 //   data["nama"] = newValue;

                  //                 //   if (data[data["nama"]]) {
                  //                 //     behaviour[data["nama"]] =
                  //                 //         _newWidgetBuid(data["nama"]);
                  //                 //   } else {
                  //                 //     behaviour.remove(data["nama"]);
                  //                 //   }
                  //                 // });
                  //               },
                  //               value: false,
                  //               title: Text(
                  //                   data["first_name"] +
                  //                       " " +
                  //                       data["last_name"],
                  //                   style: TextStyle(
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Colors.black54)),
                  //               subtitle: Text(data["jabatan_name"]),
                  //             )))
                  //         .toList());
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Divider(),
          // Container(
          //     padding: EdgeInsets.symmetric(horizontal: 10.0),
          //     child: Text("Tanggal Selesai :",
          //         style: TextStyle(
          //             fontWeight: FontWeight.bold, color: Colors.blueAccent))),
          // Container(
          //     padding: EdgeInsets.symmetric(horizontal: 10.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: <Widget>[
          //         Container(
          //             width: 270.0,
          //             child: Consumer<AddMailInBloc>(
          //               builder: (context, addDisposition, _) => TextField(
          //                 controller:
          //                     TextEditingController(text: addDisposition.value),
          //                 keyboardType: TextInputType.datetime,
          //                 decoration: InputDecoration(
          //                     hintText: _curdate.day.toString() +
          //                         "-" +
          //                         _curdate.month.toString() +
          //                         "-" +
          //                         _curdate.year.toString()),
          //               ),
          //             )),
          //         Consumer<AddMailInBloc>(
          //           builder: (context, addDisposition, _) => IconButton(
          //             icon: Icon(Icons.date_range),
          //             onPressed: () {
          //               DatePicker.showDatePicker(context,
          //                   showTitleActions: true,
          //                   minTime: DateTime(2017, 1, 1),
          //                   maxTime: DateTime(2020, 1, 1), onChanged: (date) {
          //                 print('change $date');
          //               }, onConfirm: (date) {
          //                 print('confirm $date');
          //                 String newDate = date.day.toString() +
          //                     "-" +
          //                     date.month.toString() +
          //                     "-" +
          //                     date.year.toString();

          //                 addDisposition.value = newDate;
          //               }, currentTime: DateTime.now(), locale: LocaleType.id);
          //             },
          //           ),
          //         )
          //       ],
          //     )),
          SizedBox(height: 10.0),
          behaviour == null
              ? Container()
              : Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: behaviour.keys.map((key) {
                      return behaviour[key];
                    }).toList(),
                  ),
                ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: MaterialButton(
              onPressed: () {
                if (behaviour.isEmpty) {
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

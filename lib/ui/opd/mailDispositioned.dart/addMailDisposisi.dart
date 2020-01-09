import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:simper_app/bloc/addDispositionBloc.dart';
import 'package:simper_app/model/dispositionData.dart';

class AddMailDisposition extends StatefulWidget {
  @override
  _AddMailDispositionState createState() => _AddMailDispositionState();
}

class _AddMailDispositionState extends State<AddMailDisposition> {
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


  _newWidgetBuid(String nama) {
    String _dropDownValue;

    return Container(
      padding: EdgeInsets.only(left:10.0, right: 10.0, top: 10.0),
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
                      behaviour.addAll({nama : _newWidgetBuid(nama)});
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Disposisi"),
      ),
      body: Container(
        child: ListView(children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text("Tujuan :",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blueAccent))),
          Divider(),
          Column(
              children: peopleDisposition
                  .map((data) => Container(
                          child: CheckboxListTile(
                        onChanged: (newValue) {
                          setState(() {
                            data[data["nama"]] = newValue;

                            if (data[data["nama"]]) {
                              behaviour[data["nama"]] = _newWidgetBuid(data["nama"]);
                            } else {
                              behaviour.remove(data["nama"]);
                            }
                          });
                        },
                        value: data[data["nama"]],
                        title: Text(data["nama"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54)),
                        subtitle: Text(data["status"]),
                      )))
                  .toList()),
          Divider(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text("Tanggal Selesai :",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blueAccent))),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      width: 270.0,
                      child: Consumer<AddDispositionBloc>(
                        builder: (context, addDisposition, _) => TextField(
                          controller:
                              TextEditingController(text: addDisposition.value),
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                              hintText: _curdate.day.toString() +
                                  "-" +
                                  _curdate.month.toString() +
                                  "-" +
                                  _curdate.year.toString()),
                        ),
                      )),
                  Consumer<AddDispositionBloc>(
                    builder: (context, addDisposition, _) => IconButton(
                      icon: Icon(Icons.date_range),
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2017, 1, 1),
                            maxTime: DateTime(2020, 1, 1), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          print('confirm $date');
                          String newDate = date.day.toString() +
                              "-" +
                              date.month.toString() +
                              "-" +
                              date.year.toString();

                          addDisposition.value = newDate;
                        }, currentTime: DateTime.now(), locale: LocaleType.id);
                      },
                    ),
                  )
                ],
              )),
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
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Text(
                                "Silahkan Pilih Tujuan Disposisi Terlebih Dahulu"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Close"),
                              )
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simper_app/model/selesaikanDisposisiMasuk.dart';
import 'package:simper_app/ui/opd/mailIn/add/addMailInDisposisi.dart';

class HistoryMailIn extends StatefulWidget {
  final List treePosition;
  final String instruksi;
  final String disposisiId;
  final String suratId;

  HistoryMailIn({this.treePosition, this.instruksi, this.disposisiId, this.suratId});

  @override
  _HistoryMailInState createState() => _HistoryMailInState();
}

class _HistoryMailInState extends State<HistoryMailIn> {
  final Future<SharedPreferences> _sharedPref = SharedPreferences.getInstance();
  String jabatanId;


  getIdJabatan() async {
    final sha = await _sharedPref;
    jabatanId = sha.getString('jabatan_id');
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    getIdJabatan();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        Container(
          child: ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.treePosition.length,
            itemBuilder: (context, i){
              return ListView(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[   
                  Container(
                            padding: EdgeInsets.only(
                                top: 8.0, right: 8.0, bottom: 8.0),
                            color: Colors.white,
                            margin: EdgeInsets.only(bottom: 4.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: widget.treePosition[i]["disposisi_status"] == "0"
                                          ? Colors.red[300]
                                          :widget.treePosition[i]["disposisi_status"] == "1"
                                              ? Colors.amber[400]
                                              : Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(6.0)),
                                  height: 30.0,
                                  width: 30.0,
                                  child: Icon(
                                    widget.treePosition[i]["disposisi_status"] == "0"
                                        ? FontAwesomeIcons.eyeSlash
                                        : widget.treePosition[i]["disposisi_status"] == "1"
                                            ? FontAwesomeIcons.clock
                                            : FontAwesomeIcons.check,
                                    color: Colors.white,
                                    size: 14.0,
                                  ),
                                ),
                                SizedBox(width: 6.0),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        widget.treePosition[i]["jabatan_name"],
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                      Text(
                                        widget.treePosition[i]["disposisi_status"] == "0"
                                            ? "Belum Diproses"
                                            : widget.treePosition[i]["disposisi_status"] == "1"
                                                ? "Disposisi Kebawah"
                                                : "Selesai",
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          /////////////////////// 2/////////////////
                          widget.treePosition[i]["length"] == 0 ? Container() : ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: widget.treePosition[i]["length"],
                            itemBuilder: (context, i2){
                              return ListView(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                children: <Widget>[
                                  Container(
                            padding: EdgeInsets.only(
                                top: 8.0, right: 8.0, bottom: 8.0, left: 20.0),
                            color: Colors.white,
                            margin: EdgeInsets.only(bottom: 4.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: widget.treePosition[i]["child"][i2]["disposisi_status"] == "0"
                                          ? Colors.red[300]
                                          :widget.treePosition[i]["child"][i2]["disposisi_status"] == "1"
                                              ? Colors.amber[400]
                                              : Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(6.0)),
                                  height: 30.0,
                                  width: 30.0,
                                  child: Icon(
                                    widget.treePosition[i]["child"][i2]["disposisi_status"] == "0"
                                        ? FontAwesomeIcons.eyeSlash
                                        : widget.treePosition[i]["child"][i2]["disposisi_status"] == "1"
                                            ? FontAwesomeIcons.clock
                                            : FontAwesomeIcons.check,
                                    color: Colors.white,
                                    size: 14.0,
                                  ),
                                ),
                                SizedBox(width: 6.0),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        widget.treePosition[i]["child"][i2]["jabatan_name"],
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                      Text(
                                        widget.treePosition[i]["child"][i2]["disposisi_status"] == "0"
                                            ? "Belum Diproses"
                                            : widget.treePosition[i]["child"][i2]["disposisi_status"] == "1"
                                                ? "Disposisi Kebawah"
                                                : "Selesai",
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),


                          /////////////////////// 3/////////////////
                          widget.treePosition[i]["child"][i2]["length"] == 0 ? Container() : ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: widget.treePosition[i]["child"][i2]["length"],
                            itemBuilder: (context, i3){
                              return ListView(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                children: <Widget>[
                                  Container(
                            padding: EdgeInsets.only(
                                top: 8.0, right: 8.0, bottom: 8.0, left: 40.0),
                            color: Colors.white,
                            margin: EdgeInsets.only(bottom: 4.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: widget.treePosition[i]["child"][i2]["child"][i3]["disposisi_status"] == "0"
                                          ? Colors.red[300]
                                          :widget.treePosition[i]["child"][i2]["child"][i3]["disposisi_status"] == "1"
                                              ? Colors.amber[400]
                                              : Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(6.0)),
                                  height: 30.0,
                                  width: 30.0,
                                  child: Icon(
                                    widget.treePosition[i]["child"][i2]["child"][i3]["disposisi_status"] == "0"
                                        ? FontAwesomeIcons.eyeSlash
                                        : widget.treePosition[i]["child"][i2]["child"][i3]["disposisi_status"] == "1"
                                            ? FontAwesomeIcons.clock
                                            : FontAwesomeIcons.check,
                                    color: Colors.white,
                                    size: 14.0,
                                  ),
                                ),
                                SizedBox(width: 6.0),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        widget.treePosition[i]["child"][i2]["child"][i3]["jabatan_name"],
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                      Text(
                                        widget.treePosition[i]["child"][i2]["child"][i3]["disposisi_status"] == "0"
                                            ? "Belum Diproses"
                                            : widget.treePosition[i]["child"][i2]["child"][i3]["disposisi_status"] == "1"
                                                ? "Disposisi Kebawah"
                                                : "Selesai",
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          /////////////////////// 4/////////////////
                          widget.treePosition[i]["child"][i2]["child"][i3]["length"] == 0 ? Container() : ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: widget.treePosition[i]["child"][i2]["child"][i3]["length"],
                            itemBuilder: (context, i4){
                              return ListView(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                children: <Widget>[
                                  Container(
                            padding: EdgeInsets.only(
                                top: 8.0, right: 8.0, bottom: 8.0, left: 60.0),
                            color: Colors.white,
                            margin: EdgeInsets.only(bottom: 4.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: widget.treePosition[i]["child"][i2]["child"][i3]["child"][i4]["disposisi_status"] == "0"
                                          ? Colors.red[300]
                                          :widget.treePosition[i]["child"][i2]["child"][i3]["child"][i4]["disposisi_status"] == "1"
                                              ? Colors.amber[400]
                                              : Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(6.0)),
                                  height: 30.0,
                                  width: 30.0,
                                  child: Icon(
                                    widget.treePosition[i]["child"][i2]["child"][i3]["child"][i4]["disposisi_status"] == "0"
                                        ? FontAwesomeIcons.eyeSlash
                                        : widget.treePosition[i]["child"][i2]["child"][i3]["child"][i4]["disposisi_status"] == "1"
                                            ? FontAwesomeIcons.clock
                                            : FontAwesomeIcons.check,
                                    color: Colors.white,
                                    size: 14.0,
                                  ),
                                ),
                                SizedBox(width: 6.0),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        widget.treePosition[i]["child"][i2]["child"][i3]["child"][i4]["jabatan_name"],
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                      Text(
                                        widget.treePosition[i]["child"][i2]["child"][i3]["child"][i4]["disposisi_status"] == "0"
                                            ? "Belum Diproses"
                                            : widget.treePosition[i]["child"][i2]["child"][i3]["child"][i4]["disposisi_status"] == "1"
                                                ? "Disposisi Kebawah"
                                                : "Selesai",
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),


                          /////////////////////// 5/////////////////
                          widget.treePosition[i]["child"][i2]["child"][i3]["child"][i4]["length"] == 0 ? Container() : ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: widget.treePosition[i]["child"][i2]["child"][i3]["child"][i4]["length"],
                            itemBuilder: (context, i5){
                              return ListView(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                children: <Widget>[
                                  Container(
                            padding: EdgeInsets.only(
                                top: 8.0, right: 8.0, bottom: 8.0, left: 80.0),
                            color: Colors.white,
                            margin: EdgeInsets.only(bottom: 4.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: widget.treePosition[i]["child"][i2]["child"][i3]["child"][i4]["child"][i5]["disposisi_status"] == "0"
                                          ? Colors.red[300]
                                          :widget.treePosition[i]["child"][i2]["child"][i3]["child"][i4]["child"][i5]["disposisi_status"] == "1"
                                              ? Colors.amber[400]
                                              : Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(6.0)),
                                  height: 30.0,
                                  width: 30.0,
                                  child: Icon(
                                    widget.treePosition[i]["child"][i2]["child"][i3]["child"][i4]["child"][i5]["disposisi_status"] == "0"
                                        ? FontAwesomeIcons.eyeSlash
                                        : widget.treePosition[i]["child"][i2]["child"][i3]["child"][i4]["child"][i5]["disposisi_status"] == "1"
                                            ? FontAwesomeIcons.clock
                                            : FontAwesomeIcons.check,
                                    color: Colors.white,
                                    size: 14.0,
                                  ),
                                ),
                                SizedBox(width: 6.0),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        widget.treePosition[i]["child"][i2]["child"][i3]["child"][i4]["child"][i5]["jabatan_name"],
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                      Text(
                                        widget.treePosition[i]["child"][i2]["child"][i3]["child"][i4]["child"][i5]["disposisi_status"] == "0"
                                            ? "Belum Diproses"
                                            : widget.treePosition[i]["child"][i2]["child"][i3]["child"][i4]["child"][i5]["disposisi_status"] == "1"
                                                ? "Disposisi Kebawah"
                                                : "Selesai",
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          
                                ],
                              );
                            },
                          )

                          
                                ],
                              );
                            },
                          )

                          
                                ],
                              );
                            },
                          )

                          
                                ],
                              );
                            },
                          )
                ],
              );
            },
          )
        ),
        Divider(),
        Text("Instruksi Untuk Anda : ${widget.instruksi}"),
        SizedBox(height: 10.0),
        Container(
          child: Row(
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => AddMailInDisposisi(
                            idJabatan: jabatanId,
                            idDisposisi: widget.disposisiId,
                            idSurat: widget.suratId,
                          )));
                },
                color: Colors.cyan,
                child: Text("Buat Disposisi",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              SizedBox(width: 10.0),
              MaterialButton(
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context){
                      return FutureBuilder(
                        future: selesaikanDisposisiMasukData(widget.disposisiId, "2"),
                        builder: (context, snap){
                          if(snap.hasData){
                            return CupertinoAlertDialog(
                              title: Text("Selesaikan Disposisi"),
                              content: Container(
                                padding: EdgeInsets.all(20.0),
                                child: Text(snap.data["message"]),
                              ),
                              actions: <Widget>[
                                MaterialButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  color: Colors.amber[600],
                                  child: Text("Close", style: TextStyle(color: Colors.white)),
                                )
                              ],
                            );
                          }else{
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      );
                    }
                  );
                
                },
                color: Colors.green,
                child: Text("Selesai",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              )
            ],
          ),
        )
      ],
    ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simper_app/model/detailDispositionIn.dart';
import 'package:simper_app/ui/opd/mailIn/detailMailEnd/detailMailEnd.dart';

class ListTileMailEnd extends StatefulWidget {
  final String title, date, nosurat, idDisposisi;
  final Color color;

  ListTileMailEnd(
      {this.title, this.date, this.nosurat, this.color, this.idDisposisi});

  @override
  _ListTileMailDispositionState createState() =>
      _ListTileMailDispositionState();
}

class _ListTileMailDispositionState extends State<ListTileMailEnd> {
  @override
  void initState() {
    super.initState();
    detailDisposisiMasukData(widget.idDisposisi);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 4.0),
      child: ListTile(
        onTap: () {
          print("Tap");
          if (dataDetailDisposisiMasuk == null) {
            showDialog(
                context: context,
                builder: (context) {
                  return Center(child: CircularProgressIndicator());
                });
          } else {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => DetailMailEnd(
                      disposisiId: widget.idDisposisi,
                      url:
                          "${dataDetailDisposisiMasuk["data"][0]["suratmasuk_file"]}",
                    )));
          }
        },
        leading: Container(
            decoration: BoxDecoration(
                color: widget.color, borderRadius: BorderRadius.circular(6.0)),
            height: 45.0,
            width: 45.0,
            child: Center(
              child: Text(widget.nosurat,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            )),
        title: Text(widget.title),
        subtitle: Text(widget.date),
      ),
    );
  }
}

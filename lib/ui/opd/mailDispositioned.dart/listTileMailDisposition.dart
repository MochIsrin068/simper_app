import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simper_app/model/detailDispositionIn.dart';

import 'detail/detailDisposition.dart';

class ListTileMailDisposition extends StatefulWidget {
  final String title, date, nosurat, idDisposisi, nomorsurat;
  final Color color;

  ListTileMailDisposition(
      {this.title,
      this.date,
      this.nosurat,
      this.color,
      this.idDisposisi,
      this.nomorsurat});

  @override
  _ListTileMailDispositionState createState() =>
      _ListTileMailDispositionState();
}

class _ListTileMailDispositionState extends State<ListTileMailDisposition> {
  @override
  void initState() {
    super.initState();
    // detailDisposisiMasukData(widget.idDisposisi);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[100])),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: 4.0),
      child: ListTile(
        onTap: () {
          print("Tap");
          Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
            return FutureBuilder(
              future: detailDisposisiMasukData(widget.idDisposisi),
              builder: (context, snap) {
                if (snap.hasData) {
                  return DetailDispositionSelesai(
                    disposisiId: widget.idDisposisi,
                    url: "${snap.data["data"][0]["suratmasuk_file"]}",
                  );
                } else {
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            );
          }));
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
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 2.0,
            ),
            Text(
                widget.date != ""
                    ? "${widget.date.split("-")[2]} - ${widget.date.split("-")[1]} - ${widget.date.split("-")[0]}"
                    : "",
                style: TextStyle(fontSize: 12.0)),
            SizedBox(
              height: 2.0,
            ),
            Text("No Surat : " + widget.nomorsurat,
                style: TextStyle(fontSize: 12.0))
          ],
        ),
      ),
    );
  }
}

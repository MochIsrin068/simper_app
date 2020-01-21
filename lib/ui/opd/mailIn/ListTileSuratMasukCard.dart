import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simper_app/model/detailDispositionIn.dart';
import 'package:simper_app/ui/opd/mailIn/detail/detailMailIn.dart';

class ListTileSuratMasukCard extends StatefulWidget {
  final String title, date, nosurat, idDisposisi;
  final Color color;

  ListTileSuratMasukCard(
      {this.title, this.date, this.nosurat, this.color, this.idDisposisi});

  @override
  _ListTileSuratMasukCardState createState() => _ListTileSuratMasukCardState();
}

class _ListTileSuratMasukCardState extends State<ListTileSuratMasukCard> {
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
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 4.0),
      child: ListTile(
        onTap: () {
          print("Tap");
          print(widget.idDisposisi);
          print(dataDetailDisposisiMasuk);
          // if (dataDetailDisposisiMasuk == null) {
          //   showDialog(
          //       context: context,
          //       builder: (context) {
          //         return Center(child: CircularProgressIndicator());
          //       });
          // } else {
          //   if (dataDetailDisposisiMasuk["status"] == false) {
          //     showCupertinoDialog(
          //         context: context,
          //         builder: (context) => CupertinoAlertDialog(
          //               title: Text("Status"),
          //               content: Container(
          //                 padding: EdgeInsets.all(20.0),
          //                 child: Text("Mohon Maaf Detail Data Tidak Ada!"),
          //               ),
          //               actions: <Widget>[
          //                 CupertinoButton(
          //                   color: Colors.amber,
          //                   onPressed: () {
          //                     Navigator.of(context).pop();
          //                   },
          //                   child: Text("Kembali",
          //                       style: TextStyle(color: Colors.white)),
          //                 )
          //               ],
          //             ));
          //   } else {

          // FutureBuilder(
          //   future: detailDisposisiMasukData(widget.idDisposisi),
          //   builder: (context, snap) {
          //     if (snap.hasData) {
          //       Navigator.of(context)
          //           .push(CupertinoPageRoute(builder: (context) {
          //         return DetailMailIn(
          //           disposisiId: widget.idDisposisi,
          //           url: "${snap.data["data"][0]["suratmasuk_file"]}",
          //         );
          //       }));
          //     } else {
          //       showDialog(
          //         context: context,
          //         builder: (context){
          //           return Center(child: CircularProgressIndicator());
          //         }
          //       )
          //     }
          //   },
          // );

          Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
            return FutureBuilder(
              future: detailDisposisiMasukData(widget.idDisposisi),
              builder: (context, snap) {
                if (snap.hasData) {
                  return DetailMailIn(
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
          // }
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
        // trailing: Text(perihal, style: TextStyle(color: Colors.blueAccent, fontSize: 9, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

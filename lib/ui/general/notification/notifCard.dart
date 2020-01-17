import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simper_app/model/detailDispositionIn.dart';
import 'package:simper_app/ui/opd/mailIn/detail/detailMailIn.dart';

class NotifCard extends StatefulWidget {
  final String title, subtitle, leading, idDisposisi;

  NotifCard({this.title, this.subtitle, this.leading, this.idDisposisi});

  @override
  _NotifCardState createState() => _NotifCardState();
}

class _NotifCardState extends State<NotifCard> {
  @override
  void initState() {
    super.initState();
    detailDisposisiMasukData(widget.idDisposisi);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.all(0.0),
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
                builder: (context) => DetailMailIn(
                      disposisiId: widget.idDisposisi,
                      url:
                          "${dataDetailDisposisiMasuk["data"][0]["suratmasuk_file"]}",
                    )));
          }
        },
        leading: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blueAccent,
          ),
          child: Text(widget.leading, style: TextStyle(color: Colors.white)),
        ),
        title: Text(widget.title),
        subtitle: Text(widget.subtitle),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileValidateCard extends StatelessWidget {
  final String title, date, nosurat;

  ListTileValidateCard({this.title, this.date, this.nosurat});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 4.0),
      child: ListTile(
        leading: Container(
            decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(6.0)),
            height: 45.0,
            width: 45.0,
            child: Center(
                child: Text(nosurat,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)))),
        title: Text(title),
        subtitle: Text(date),
        trailing: IconButton(
          onPressed: () {
            showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                      title: Text("Menu Pilihan"),
                      actions: <Widget>[
                        CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.of(context).pushNamed("/detailMail");
                          },
                          isDefaultAction: true,
                          child: Text("Lihat"),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () {},
                          isDefaultAction: true,
                          child: Text("Teruskan Ke Pemimpin"),
                        )
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        child:
                            Text("Cancel", style: TextStyle(color: Colors.red)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ));
          },
          icon: Icon(Icons.more_horiz),
        ),
      ),
    );
  }
}

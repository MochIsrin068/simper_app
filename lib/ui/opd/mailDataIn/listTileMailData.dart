import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileMailData extends StatelessWidget {
  final String title, date, nosurat;

  ListTileMailData({this.title, this.date, this.nosurat});

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
            Navigator.of(context).pushNamed("/detailMailopd");
          },
          icon: Icon(Icons.more_horiz),
        ),
      ),
    );
  }
}

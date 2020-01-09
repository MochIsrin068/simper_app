import 'package:flutter/material.dart';

class ListTileDataCard extends StatelessWidget {
  final String title, date, perihal, nosurat;
  final Color color;

  ListTileDataCard({this.title, this.date, this.perihal, this.nosurat, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 4.0),
      child: ListTile(
        onTap: () {
          print("Tap");
          Navigator.of(context).pushNamed("/detailMail");
        },
        leading: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6.0)),
          height: 45.0,
          width: 45.0,
          child: Center(
            child: Text(nosurat, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          )
        ),
        title: Text(title),
        subtitle: Text(date),
        trailing: Text(perihal, style: TextStyle(color: Colors.blueAccent, fontSize: 9, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

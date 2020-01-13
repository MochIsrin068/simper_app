import 'package:flutter/material.dart';

import 'notifCard.dart';

class NotifScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        title: Text("Notifikasi", style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            NotifCard(
              icon: Icon(
                Icons.assignment_turned_in,
                color: Colors.blueAccent,
              ),
              title: "Surat Masuk",
              subtitle: "Dinas Kominfo",
            ),
            NotifCard(
              icon: Icon(
                Icons.assignment_returned,
                color: Colors.amber,
              ),
              title: "Surat Terdisposisi",
              subtitle: "Dinas Kesehatan",
            )
          ],
        ),
      ),
    );
  }
}

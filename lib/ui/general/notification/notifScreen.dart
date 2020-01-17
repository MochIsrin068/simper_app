import 'package:flutter/material.dart';

import 'notifCard.dart';

class NotifScreen extends StatelessWidget {
  final List dataNotif;

  NotifScreen({this.dataNotif});

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
          child: ListView.builder(
            itemCount: dataNotif.length,
            itemBuilder: (context, i) => NotifCard(
              leading: dataNotif[i]["noAgenda"],
              subtitle: dataNotif[i]["title"],
              title: dataNotif[i]["skpdPengirim"],
              idDisposisi: dataNotif[i]["idDisposisi"],
            ),
          )),
    );
  }
}

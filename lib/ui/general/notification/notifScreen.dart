import 'package:flutter/material.dart';

import 'notifCard.dart';

class NotifScreen extends StatelessWidget {

  final List<NotifCard> dataNotif;

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
        child: ListView(
          children: dataNotif
        ),
      ),
    );
  }
}

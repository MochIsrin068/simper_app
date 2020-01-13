import 'package:flutter/material.dart';

class NotifCard extends StatelessWidget {
  final String title, subtitle;
  final Icon icon;

  NotifCard({this.title, this.subtitle, this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.all(0.0),
      child: ListTile(
        leading: icon,
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}

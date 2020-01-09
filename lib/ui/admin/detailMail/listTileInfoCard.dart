import 'package:flutter/material.dart';

class ListTileInfoCard extends StatelessWidget {
  final String title, subtitle;
  final Icon icon;

  ListTileInfoCard({this.title, this.subtitle, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          icon,
          SizedBox(
            width: 10.0,
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 90.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(subtitle),
              ],
            ),
          )
        ],
      ),
    );
  }
}

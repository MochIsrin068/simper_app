import 'package:flutter/material.dart';

class HomeComponents extends StatelessWidget {
  final Color primarycolor;
  final Color secondcolor;
  final String title;
  final Icon icon;
  final String count;

  HomeComponents(
      {this.primarycolor, this.secondcolor, this.title, this.icon, this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: primarycolor,
        ),
        child: Row(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                color: secondcolor,
                ),
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.only(right: 10.0),
                width: 100.0,
                child: icon),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                  SizedBox(height: 6.0),
                  Text(count,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simper_app/ui/admin/mailOut/listTileDataCard.dart';
import 'package:simper_app/ui/general/notification/notifScreen.dart';

import 'homeComponents.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Selamat Datang",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text("Admin Kominfo",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          )),
                    ],
                  ),
                ),
                IconButton(
                    icon: Icon(FontAwesomeIcons.bell),
                    onPressed: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          settings: RouteSettings(isInitialRoute: true),
                          builder: (context) => NotifScreen()));
                    })
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: Colors.grey[200],
            ),
            height: 40.0,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    FontAwesomeIcons.search,
                    size: 20.0,
                  ),
                  hintText: "Search...",
                  border: InputBorder.none),
            ),
          ),

          SizedBox(height: 14.0),

          HomeComponents(
            icon: Icon(
              Icons.mail_outline,
              size: 60.0,
              color: Colors.white,
            ),
            primarycolor: Colors.amber,
            secondcolor: Colors.amber[600],
            count: "122",
            title: "Surat Masuk",
          ),
          SizedBox(height: 10.0),
          HomeComponents(
            icon: Icon(
              FontAwesomeIcons.mailBulk,
              size: 60.0,
              color: Colors.white,
            ),
            primarycolor: Colors.cyan[400],
            secondcolor: Colors.cyan,
            count: "311",
            title: "Surat Keluar",
          ),
          SizedBox(
            height: 20.0,
          ),
          // Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Surat Terbaru"),
                FlatButton(
                  onPressed: () {},
                  color: Colors.grey[200],
                  child: Text("Lihat Semua"),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ListTileDataCard(
            color: Colors.green[300],
            date: "22 Desember 2019",
            nosurat: "123",
            perihal: "Undangan",
            title: "Dinas Kesehatan",
          ),
          ListTileDataCard(
            color: Colors.amber,
            date: "22 Desember 2019",
            nosurat: "123",
            perihal: "Berita Acara",
            title: "Dinas Kominfo",
          ),
        ],
      ),
    );
  }
}

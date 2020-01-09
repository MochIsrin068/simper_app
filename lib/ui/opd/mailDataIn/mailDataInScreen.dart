import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simper_app/ui/opd/mailDataIn/listTileMailData.dart';

class MailDataInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Data Surat Masuk",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18.0)),
                      SizedBox(height: 4.0),
                      Text("Lihat semua data surat yang masuk",
                          style: TextStyle(fontSize: 14.0))
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.playlist_add),
                  tooltip: "Buat Surat Masuk Non - SKPD",
                )
              ],
            ),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.grey[200],
                  ),
                  height: 40.0,
                  width: MediaQuery.of(context).size.width - 70,
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
                IconButton(
                  color: Colors.grey,
                  icon: Icon(FontAwesomeIcons.sort),
                  onPressed: () {},
                )
              ],
            ),
          ),
          ListTileMailData(
            date: "22 Desember 2019",
            nosurat: "123",
            title: "Dinas Kesehatan",
          ),
          ListTileMailData(
            date: "22 Desember 2019",
            nosurat: "123",
            title: "Dinas Kominfo",
          ),
          ListTileMailData(
            date: "22 Desember 2019",
            nosurat: "123",
            title: "Bappeda",
          ),
        ],
      ),
    );
  }
}

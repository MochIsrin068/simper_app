import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simper_app/ui/opd/mailIn/ListTileSuratMasukCard.dart';

class SuratMasukSelesai extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
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
                  padding: EdgeInsets.symmetric(horizontal:10.0),
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
                  onPressed: (){},
                )
              ],
            ),
          ),
          ListTileSuratMasukCard(color: Colors.green[300], date: "22 Desember 2019", nosurat: "123", idDisposisi: "Undangan", title: "Dinas Kesehatan",),
          ListTileSuratMasukCard(color: Colors.amber, date: "22 Desember 2019", nosurat: "123", idDisposisi: "Berita Acara", title: "Dinas Kominfo",),
          ListTileSuratMasukCard(color: Colors.red[400], date: "22 Desember 2019", nosurat: "123", idDisposisi: "Undangan", title: "Bappeda",),
        ],
      ),
    );
  }
}

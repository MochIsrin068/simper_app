import 'package:flutter/material.dart';

import '../listTileInfoCard.dart';

class InfoSurat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Card(
            child: Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width - 50.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTileInfoCard(
                      icon: Icon(
                        Icons.date_range,
                        size: 32.0,
                        color: Colors.black45,
                      ),
                      title: "Tanggal Terima :",
                      subtitle: "2019-12-29",
                    ),
                    Divider(),
                    ListTileInfoCard(
                      icon: Icon(Icons.date_range,
                          size: 32.0, color: Colors.black45),
                      title: "Tanggal Diteruskan :",
                      subtitle: "2019-12-29",
                    ),
                    Divider(),
                    ListTileInfoCard(
                      icon: Icon(Icons.date_range,
                          size: 32.0, color: Colors.black45),
                      title: "Tanggal Surat :",
                      subtitle: "2019-12-29",
                    ),
                    Divider(),
                    ListTileInfoCard(
                      icon: Icon(Icons.list, size: 32.0, color: Colors.black45),
                      title: "Klasifikasi Surat :",
                      subtitle: "Berita Acara",
                    ),
                    Divider(),
                    ListTileInfoCard(
                      icon: Icon(Icons.attach_file,
                          size: 32.0, color: Colors.black45),
                      title: "Nomor Surat :",
                      subtitle: "123",
                    ),
                    Divider(),
                    ListTileInfoCard(
                      icon: Icon(Icons.attach_file,
                          size: 32.0, color: Colors.black45),
                      title: "Nomor Agenda :",
                      subtitle: "123",
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

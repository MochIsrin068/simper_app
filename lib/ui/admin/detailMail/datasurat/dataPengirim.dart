import 'package:flutter/material.dart';

import '../listTileInfoCard.dart';

class DataPengirim extends StatelessWidget {
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
                      icon: Icon(Icons.business,
                          size: 32.0, color: Colors.black45),
                      title: "Instansi/Organisasi/Kelompok Pengirim :",
                      subtitle: "BADAN PERENCANAAN PEMBANGUNAN DAERAH KOTA KENDARI",
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
                      icon: Icon(Icons.face,
                          size: 32.0, color: Colors.black45),
                      title: "Nama Pengirim :",
                      subtitle: "Kepala Badan  User",
                    ),
                    Divider(),
                    ListTileInfoCard(
                      icon: Icon(Icons.face, size: 32.0, color: Colors.black45),
                      title: "Jabatan Pengirim :",
                      subtitle: "Kepala Badan ",
                    ),
                    Divider(),
                    ListTileInfoCard(
                      icon: Icon(Icons.assignment,
                          size: 32.0, color: Colors.black45),
                      title: "Perihal Surat :",
                      subtitle: "-",
                    ),
                    Divider(),
                    ListTileInfoCard(
                      icon: Icon(Icons.location_on,
                          size: 32.0, color: Colors.black45),
                      title: "Alamat Pengirim :",
                      subtitle: "Jl. Drs. H. Abdullah Silondae, No.8, Korumba, Kendari, Kota Kendari",
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
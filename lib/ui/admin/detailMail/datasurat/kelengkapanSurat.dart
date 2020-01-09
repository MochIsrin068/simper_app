import 'package:flutter/material.dart';

import '../listTileInfoCard.dart';

class KelengkapanSurat extends StatelessWidget {
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
                        Icons.warning,
                        size: 32.0,
                        color: Colors.black45,
                      ),
                      title: "Kemanan Surat :",
                      subtitle: "Rahasia",
                    ),
                    Divider(),
                    ListTileInfoCard(
                      icon: Icon(Icons.record_voice_over,
                          size: 32.0, color: Colors.black45),
                      title: "Kecepatan Surat :",
                      subtitle: "Biasa",
                    ),
                    Divider(),
                    ListTileInfoCard(
                      icon: Icon(Icons.chrome_reader_mode,
                          size: 32.0, color: Colors.black45),
                      title: "Ringkasan Surat :",
                      subtitle: "tidak ada",
                    ),
                    SizedBox(height: 10.0),
                    MaterialButton(
                      color: Colors.green[300],
                      onPressed: (){},
                      child: Text("Lihat File Surat Disini", style: TextStyle(color: Colors.white),),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
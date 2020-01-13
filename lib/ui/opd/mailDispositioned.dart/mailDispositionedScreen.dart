import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simper_app/model/suratTerdisposisi.dart';
import 'package:simper_app/ui/general/shimmer/shimmerMailCard.dart';

import 'listTileMailDisposition.dart';

class MailDispositioned extends StatefulWidget {
  @override
  _MailDispositionedState createState() => _MailDispositionedState();
}

class _MailDispositionedState extends State<MailDispositioned> {
  Future<SharedPreferences> _sharedPref = SharedPreferences.getInstance();

  String _id;

  Future getIdUser() async {
    final sha = await _sharedPref;
    _id = sha.getString("id");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getIdUser();
  }

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
                      Text("Surat Terdisposisi",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18.0)),
                      SizedBox(height: 4.0),
                      Text("Lihat semua surat yang telah disposisi",
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
          // Container(
          //   margin: EdgeInsets.only(bottom: 10.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: <Widget>[
          //       Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(6.0),
          //           color: Colors.grey[200],
          //         ),
          //         height: 40.0,
          //         width: MediaQuery.of(context).size.width - 70,
          //         padding: EdgeInsets.symmetric(horizontal: 10.0),
          //         child: TextField(
          //           decoration: InputDecoration(
          //               prefixIcon: Icon(
          //                 FontAwesomeIcons.search,
          //                 size: 20.0,
          //               ),
          //               hintText: "Search...",
          //               border: InputBorder.none),
          //         ),
          //       ),
          //       IconButton(
          //         color: Colors.grey,
          //         icon: Icon(FontAwesomeIcons.sort),
          //         onPressed: () {},
          //       )
          //     ],
          //   ),
          // ),
          FutureBuilder(
            future: suratTerdisposisiData(_id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data["data"] == null) {
                  return Container(
                      padding: EdgeInsets.all(20.0),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey[100],
                      child: Center(child: Text(snapshot.data["message"])));
                } else {
                  return ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data["data"].length,
                    itemBuilder: (context, i) {
                      return ListTileMailDisposition(
                        color: Colors.green[300],
                        date: snapshot.data["data"][i]
                            ["suratmasuk_tanggalterima"],
                        nosurat: snapshot.data["data"][i]
                            ["suratmasuk_noagenda"],
                        idDisposisi: snapshot.data["data"][i]["disposisi_id"],
                        title: snapshot.data["data"][i]["skpd_pengirim"],
                      );
                    },
                  );
                }
              } else {
                return Container(
                  child: ShimmerMailCard(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

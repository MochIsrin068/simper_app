import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simper_app/model/suratMasukSelesai.dart';
import 'package:simper_app/ui/general/shimmer/shimmerMailCard.dart';
import 'package:simper_app/ui/opd/mailIn/listTileMailEnd.dart';

class AllMailInEnd extends StatefulWidget {
  @override
  _AllMailOutState createState() => _AllMailOutState();
}

class _AllMailOutState extends State<AllMailInEnd> {
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
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          // physics: BouncingScrollPhysics(),
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Surat Masuk Disposisi",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18.0)),
                        SizedBox(height: 4.0),
                        Text("Lihat semua surat yang masuk selesai",
                            style: TextStyle(fontSize: 14.0))
                      ],
                    ),
                  ),
                  Container()
                ],
              ),
            ),
            Divider(),
            FutureBuilder(
              future: suratMasukSelesaiData(_id),
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
                        return ListTileMailEnd(
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
      ),
    );
  }
}

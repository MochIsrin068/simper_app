import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simper_app/model/newsMail.dart';
import 'package:simper_app/ui/general/notification/notifScreen.dart';
import 'package:simper_app/ui/general/shimmer/shimmerMailCard.dart';
import 'package:simper_app/ui/opd/allMail/allMailIn.dart';
import 'package:simper_app/ui/opd/allMail/allMailOut.dart';
import 'package:simper_app/ui/opd/mailIn/ListTileSuratMasukCard.dart';

import 'homeComponents.dart';

class HomeScreenOpd extends StatefulWidget {
  @override
  _HomeScreenOpdState createState() => _HomeScreenOpdState();
}

class _HomeScreenOpdState extends State<HomeScreenOpd> {
  // GET DATA SHARED PREFERENCES
  Future<SharedPreferences> _shared = SharedPreferences.getInstance();

  // FOR DATA
  String _username;
  String _firstname;
  String _lastname;
  String _idskpd;
  String _jabatanid;
  String _groupidskpd;
  // FOR WUDGET
  String _suratMasuk;
  String _suratKeluar;
  String _password;
  //////////////////////////

  Future _getData() async {
    final sha = await _shared;
    _username = sha.getString("username");
    _firstname = sha.getString("first_name");
    _lastname = sha.getString("last_name");
    _idskpd = sha.getString("id_skpd");
    _jabatanid = sha.getString("jabatan_id");
    _groupidskpd = sha.getString("group_id");
    _suratMasuk = sha.getString("widget_suratmasuk");
    _suratKeluar = sha.getString("widget_suratkeluar");
    _password = sha.getString("password");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

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
                      Text("$_firstname",
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
          Divider(),
          // SizedBox(height: 10.0),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(6.0),
          //     color: Colors.grey[200],
          //   ),
          //   height: 40.0,
          //   padding: EdgeInsets.symmetric(horizontal: 10.0),
          //   child: TextField(
          //     decoration: InputDecoration(
          //         prefixIcon: Icon(
          //           FontAwesomeIcons.search,
          //           size: 20.0,
          //         ),
          //         hintText: "Search...",
          //         border: InputBorder.none),
          //   ),
          // ),

          SizedBox(height: 14.0),

          InkWell(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return AllMailIn();
              }));
            },
            child: HomeComponents(
              icon: Icon(
                Icons.mail_outline,
                size: 60.0,
                color: Colors.white,
              ),
              primarycolor: Colors.amber,
              secondcolor: Colors.amber[600],
              count: "$_suratMasuk",
              title: "Surat Masuk",
            ),
          ),
          SizedBox(height: 10.0),
          InkWell(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return AllMailOut();
              }));
            },
            child: HomeComponents(
              icon: Icon(
                Icons.done_all,
                size: 60.0,
                color: Colors.white,
              ),
              primarycolor: Colors.green[400],
              secondcolor: Colors.green,
              count: "$_suratKeluar",
              title: "Surat Masuk Selesai",
            ),
          ),
          SizedBox(height: 10.0),
          InkWell(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return AllMailOut();
              }));
            },
            child: HomeComponents(
              icon: Icon(
                FontAwesomeIcons.mailBulk,
                size: 60.0,
                color: Colors.white,
              ),
              primarycolor: Colors.cyan[400],
              secondcolor: Colors.cyan,
              count: "$_suratKeluar",
              title: "Surat Keluar",
            ),
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
                Text("Surat Masuk Terbaru"),
                newsMail == false
                    ? Container()
                    : FlatButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(CupertinoPageRoute(builder: (context) {
                            return AllMailIn();
                          }));
                        },
                        color: Colors.grey[200],
                        child: Text("Lihat Semua"),
                      )
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),

          FutureBuilder(
            future: newsMailData(_username, _password),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == false) {
                  return Center(
                      child: Container(
                          padding: EdgeInsets.all(20.0),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey[100],
                          child: Center(child: Text("Surat Tidak Ada"))));
                } else {
                  if (snapshot.data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) {
                        return ListTileSuratMasukCard(
                          color: Colors.green[300],
                          date: snapshot.data[i]["suratmasuk_tanggalsurat"],
                          nosurat: snapshot.data[i]["suratmasuk_noagenda"],
                          idDisposisi: snapshot.data[i]["disposisi_id"],
                          title: snapshot.data[i]["skpd_pengirim"],
                        );
                      },
                    );
                  }
                }
              } else {
                return Container(child: ShimmerMailCard());
                // return Center(
                //   child: CircularProgressIndicator(),
                // );
              }
            },
          ),
        ],
      ),
    );
  }
}

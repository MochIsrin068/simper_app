import 'package:flutter/material.dart';
import 'SuratMasuk.dart';
import 'SuratMasukSelesai.dart';

class MailInScreen extends StatefulWidget {
  @override
  _MailInScreenState createState() => _MailInScreenState();
}

class _MailInScreenState extends State<MailInScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
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
                      Text("Surat Masuk",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18.0)),
                      SizedBox(height: 4.0),
                      Text("Lihat semua disposisi masuk dan masuk selesai",
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
            color: Colors.grey[100],
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.blueAccent,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: <Widget>[
                Tab(
                  text: "Surat Masuk",
                ),
                Tab(
                  text: "Surat Masuk Selesai",
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            height: MediaQuery.of(context).size.height - 100.0,
            child: 
            TabBarView(
              physics: ScrollPhysics(),
              controller: _tabController,
              children: <Widget>[
                SuratMasuk(),
                SuratMasukSelesai()
              ],
            ),
          )
        ],
      ),
    );
  }
}

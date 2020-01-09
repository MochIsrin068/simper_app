import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simper_app/ui/admin/report/reportIn.dart';
import 'package:simper_app/ui/admin/report/reportOut.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen>
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
                      Text("Laporan",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18.0)),
                      SizedBox(height: 4.0),
                      Text("Cetak semua laporan masuk dan keluar",
                          style: TextStyle(fontSize: 14.0))
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.bell),
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
                  text: "Surat Keluar",
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            height: MediaQuery.of(context).size.height - 100.0,
            child: TabBarView(
              physics: ScrollPhysics(),
              controller: _tabController,
              children: <Widget>[
                ReportIn(),
                ReportOut()
              ],
            ),
          )
        ],
      ),
    );
  }
}

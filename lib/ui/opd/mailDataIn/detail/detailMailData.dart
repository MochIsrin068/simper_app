import 'package:flutter/material.dart';
import 'package:simper_app/ui/admin/detailMail/datasurat/dataPengirim.dart';
import 'package:simper_app/ui/admin/detailMail/datasurat/infoSurat.dart';
import 'package:simper_app/ui/admin/detailMail/datasurat/kelengkapanSurat.dart';

class DetailMailData extends StatefulWidget {
  @override
  _DetailMailDataState createState() => _DetailMailDataState();
}

class _DetailMailDataState extends State<DetailMailData> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Divider(),
          Container(
            color: Colors.grey[100],
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.blueAccent,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              tabs: <Widget>[
                Tab(
                  text: "Info Surat",
                ),
                Tab(
                  text: "Data Pengirim",
                ),
                Tab(
                  text: "Kelengkapan Surat",
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
                InfoSurat(),
                DataPengirim(),
                KelengkapanSurat()
              ],
            ),
          )
        ],
      ),
    );
  }
}

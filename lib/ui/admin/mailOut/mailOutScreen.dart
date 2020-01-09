import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simper_app/ui/admin/mailOut/dataMailOutNonSkpd.dart';
import 'package:simper_app/ui/admin/mailOut/dataMailOutSkpd.dart';

class MailOutScreen extends StatefulWidget {
  @override
  _MailOutScreenState createState() => _MailOutScreenState();
}

class _MailOutScreenState extends State<MailOutScreen>
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
                      Text("Surat Keluar",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18.0)),
                      SizedBox(height: 4.0),
                      Text("Lihat semua surat keluar",
                          style: TextStyle(fontSize: 14.0))
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) => CupertinoActionSheet(
                              title: Text("Buat Surat Keluar"),
                              message: Text(
                                  "Buat Surat Keluar untuk SKPD ataupun Non SKPD"),
                              actions: <Widget>[
                                CupertinoActionSheetAction(
                                  onPressed: () {},
                                  isDefaultAction: true,
                                  child: Text("Buat Surat Masuk Keluar SKPD"),
                                ),
                                CupertinoActionSheetAction(
                                  onPressed: () {},
                                  isDefaultAction: true,
                                  child:
                                      Text("Buat Surat Masuk Keluar Non SKPD"),
                                )
                              ],
                              cancelButton: CupertinoActionSheetAction(
                                child: Text("Cancel", style: TextStyle(color: Colors.red)),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ));
                  },
                  icon: Icon(Icons.playlist_add),
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
                  text: "Data Surat SKPD",
                ),
                Tab(
                  text: "Data Surat Non SKPD",
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
              children: <Widget>[DataMailOutSkpd(), DataMailOutNonSkpd()],
            ),
          )
        ],
      ),
    );
  }
}

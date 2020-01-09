import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simper_app/ui/admin/mailIn/mailInScreen.dart';
import 'package:simper_app/ui/admin/mailOut/mailOutScreen.dart';
import 'package:simper_app/ui/admin/report/reportScreen.dart';
import 'package:simper_app/ui/general/account/AccountScreen.dart';

import 'homeScreen.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: <Widget>[
          HomeScreen(),
          MailInScreen(),
          MailOutScreen(),
          ReportScreen(),
          AccountScreen()
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 10.0,
        color: Colors.white,
        child: TabBar(
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.blueAccent,
          controller: _tabController,
          tabs: <Widget>[
            Tab(icon: Icon(FontAwesomeIcons.home)),
            Tab(icon: Icon(FontAwesomeIcons.mailBulk)),
            Tab(icon: Icon(FontAwesomeIcons.checkSquare)),
            Tab(icon: Icon(FontAwesomeIcons.file)),
            Tab(icon: Icon(FontAwesomeIcons.user)),
          ],
        ),
      ),
    );
  }
}

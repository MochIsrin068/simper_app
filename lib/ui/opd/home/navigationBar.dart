import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simper_app/ui/general/account/AccountScreen.dart';
import 'package:simper_app/ui/opd/mailDataIn/mailDataInScreen.dart';
import 'package:simper_app/ui/opd/mailDispositioned.dart/mailDispositionedScreen.dart';
import 'package:simper_app/ui/opd/mailIn/mailInScreen.dart';

import 'homeScreen.dart';

class NavigationBarOpd extends StatefulWidget {
  final String username;
  final String password;

  NavigationBarOpd({this.username, this.password});

  @override
  _NavigationBarOpdState createState() => _NavigationBarOpdState();
}

class _NavigationBarOpdState extends State<NavigationBarOpd>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
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
          HomeScreenOpd(
            username: widget.username,
            password: widget.password,
          ),
          MailInScreen(),
          MailDispositioned(),
          // MailDataInScreen(),
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
            // Tab(icon: Icon(FontAwesomeIcons.file)),
            Tab(icon: Icon(FontAwesomeIcons.user)),
          ],
        ),
      ),
    );
  }
}

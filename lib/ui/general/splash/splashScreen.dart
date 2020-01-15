import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simper_app/ui/admin/home/navigationBar.dart';
import 'package:simper_app/ui/general/login/loginScreen.dart';
import 'package:simper_app/ui/opd/home/navigationBar.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // GET DATA SHARED PREFERENCES
  Future<SharedPreferences> _shared = SharedPreferences.getInstance();
  String _username;
  String _groupID;

  Future _getData() async {
    final sha = await _shared;
    _username = sha.getString("username");
    _groupID = sha.getString("group_id");
    setState(() {});
  }

  startTime() async {
    var _duration = Duration(seconds: 4);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if (_username == null) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (context) => LoginScreen()));
    } else {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
          builder: (context) =>
              _groupID == "4" ? NavigationBar() : NavigationBarOpd()));
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/simper.png',
          width: 110.0,
          height: 110.0,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:simper_app/ui/admin/detailMail/detailMail.dart';
import 'package:simper_app/ui/admin/home/homeScreen.dart';
import 'package:simper_app/ui/admin/home/navigationBar.dart';
import 'package:simper_app/ui/general/login/loginScreen.dart';
import 'package:simper_app/ui/opd/home/homeScreen.dart';
import 'package:simper_app/ui/opd/home/navigationBar.dart';
import 'package:simper_app/ui/opd/mailDataIn/detail/detailMail.dart';
import 'package:simper_app/ui/opd/mailDispositioned.dart/addMailDisposisi.dart';

myRoutes(BuildContext context){
  return {
    "/home" : (context) => HomeScreen(),
    "/navbar" : (context) => NavigationBar(),
    "/login" : (context) => LoginScreen(),
    "/detailMail" : (context) => DetailMail(),

    // OPD
    "/homeopd" : (context) => HomeScreenOpd(),
    "/navbaropd" : (context) => NavigationBarOpd(),
    "/detailMailopd" : (context) => DetailMailOpd(),
    "/addDisposisi" : (context) => AddMailDisposition(),
  };
}
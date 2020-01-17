import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simper_app/model/profile.dart';
import 'package:simper_app/ui/general/account/editAccountScreen.dart';
import 'package:simper_app/ui/general/shimmer/shimmerProfile.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // GET DATA SHARED PREFERENCES
  Future<SharedPreferences> _shared = SharedPreferences.getInstance();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  String _idUser;
  String _username;
  String _firstname;
  String _lastname;
  String _idskpd;
  String _jabatanid;
  String _groupidskpd;
  String _id;
  //////////////////////////

  Future _getData() async {
    final sha = await _shared;
    _idUser = sha.getString("id");
    _username = sha.getString("username");
    _firstname = sha.getString("first_name");
    _lastname = sha.getString("last_name");
    _idskpd = sha.getString("id_skpd");
    _jabatanid = sha.getString("jabatan_id");
    _groupidskpd = sha.getString("group_id");
    _id = sha.getString("id");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  // Logout
  Future _logout() async {
    final sha = await _shared;
    sha.clear();
  }

  refreshToken() {
    print("Refresh Token");
    // _firebaseMessaging.onTokenRefresh.listen(sendTokenToServer);
    // _firebaseMessaging.getToken();

    _firebaseMessaging.unsubscribeFromTopic(_id);
    print("UNSubscripe : $_id");


    // _firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     print("onMessage: $message");
    //   },
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print("onLaunch: $message");
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     print("onResume: $message");
    //   },
    // );

    // _firebaseMessaging.requestNotificationPermissions(
    //     const IosNotificationSettings(sound: true, badge: true, alert: true));
    // _firebaseMessaging.onIosSettingsRegistered
    //     .listen((IosNotificationSettings settings) {
    //   print("Settings registered: $settings");
    // });

    // _firebaseMessaging.getToken().then((String token) {
    //   assert(token != null);
    //   print(token);
    // });
  }

  // SEND TOKEN
  // void sendTokenToServer(String fcmToken) {
  //   print('Token: $fcmToken');
  //   // send key to your server to allow server to use
  //   // this token to send push notifications
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[100],
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.help,
                      color: Colors.black54,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text("My Account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            fontSize: 18.0)),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 46.0,
                      child: CircleAvatar(
                        radius: 44.0,
                        backgroundImage: AssetImage("assets/images/person.png"),
                      ),
                    ),
                  ),
                  Container(
                      child: FutureBuilder(
                    future: profileData(_idUser),
                    builder: (context, snap) {
                      if (snap.hasData) {
                        return Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10.0,
                            ),
                            Center(
                                child: Text(
                              "${snap.data["username"]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54,
                                  fontSize: 14.0),
                            )),
                            SizedBox(height: 2.0),
                            Chip(
                                backgroundColor: Colors.amber,
                                label: Text(
                                    "${snap.data["first_name"]} ${snap.data["last_name"]}",
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.white))),
                            SizedBox(height: 4.0),
                            Center(
                                child: Text("${snap.data["email"]}",
                                    style: TextStyle(fontSize: 14.0))),
                            SizedBox(height: 4.0),
                            Center(
                                child: Text(
                                    snap.data["phone"] == null
                                        ? ""
                                        : "${snap.data["phone"]}",
                                    style: TextStyle(fontSize: 14.0))),
                            SizedBox(height: 10.0)
                          ],
                        );
                      } else {
                        return Container(
                          child: ShimmerProfile(),
                        );
                      }
                    },
                  ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Card(
                  child: Column(
                children: <Widget>[
                  Container(
                      child: FutureBuilder(
                    future: profileData(_idUser),
                    builder: (context, snap) {
                      if (snap.hasData) {
                        return ListTile(
                          onTap: () {
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) => EditAccountScreen(
                                      id: _idUser,
                                      email: snap.data["email"],
                                      firstname: snap.data["first_name"],
                                      lastname: snap.data["last_name"],
                                      username: snap.data["username"],
                                      nohp: snap.data["phone"],
                                    )));
                          },
                          leading: Icon(FontAwesomeIcons.edit,
                              color: Color(0xffbcecb0)),
                          title: Text("Edit Profile"),
                          trailing: Text(">"),
                        );
                      } else {
                        return ListTile(
                          leading: Icon(FontAwesomeIcons.edit,
                              color: Color(0xffbcecb0)),
                          title: Text("Edit Profile"),
                          trailing: Text(">"),
                        );
                      }
                    },
                  )),
                  Divider(),
                  Container(
                    child: ListTile(
                      onTap: () {
                        _logout();
                        refreshToken();
                        Navigator.of(context).pushReplacementNamed("/login");
                      },
                      leading: Icon(Icons.power_settings_new,
                          color: Colors.redAccent),
                      title: Text("Logout"),
                      trailing: Text(">"),
                    ),
                  ),
                ],
              )),
            )
          ],
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simper_app/model/editProfile.dart';

class EditAccountScreen extends StatefulWidget {
  final String id, username, firstname, lastname, email, nohp;

  EditAccountScreen({
    this.id,
    this.username,
    this.firstname,
    this.lastname,
    this.email,
    this.nohp,
  });

  @override
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  Future<SharedPreferences> _sharedPref = SharedPreferences.getInstance();

  updateName(String newFirstName, String newLastname) async {
    final sha = await _sharedPref;
    sha.setString("first_name", newFirstName);
    sha.setString("last_name", newLastname);
  }

  bool _isObscure = true;

  TextEditingController _controllerUsername;
  TextEditingController _controllerFirstname;
  TextEditingController _controllerLastname;
  TextEditingController _controlleremail;
  TextEditingController _controllerNoHp;
  TextEditingController _controllerPassword;

  @override
  void initState() {
    super.initState();
    _controllerUsername = TextEditingController(text: widget.username);
    _controllerFirstname = TextEditingController(text: widget.firstname);
    _controllerLastname = TextEditingController(text: widget.lastname);
    _controlleremail = TextEditingController(text: widget.email);
    _controllerNoHp = TextEditingController(text: widget.nohp);
    _controllerPassword = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerUsername.clear();
    _controllerFirstname.clear();
    _controllerLastname.clear();
    _controlleremail.clear();
    _controllerNoHp.clear();
    _controllerPassword.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Edit Akun",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Card(
              margin: EdgeInsets.only(bottom: 10.0),
              color: Colors.grey[100],
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: _controllerUsername,
                  decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.user, size: 14.0),
                      border: InputBorder.none,
                      hintText: "Username..."),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.only(bottom: 10.0),
              color: Colors.grey[100],
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: _controllerFirstname,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.short_text, size: 14.0),
                      border: InputBorder.none,
                      hintText: "Nama Depan..."),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.only(bottom: 10.0),
              color: Colors.grey[100],
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: _controllerLastname,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.short_text, size: 14.0),
                      border: InputBorder.none,
                      hintText: "Nama Belakang..."),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.only(bottom: 10.0),
              color: Colors.grey[100],
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: _controlleremail,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, size: 14.0),
                      border: InputBorder.none,
                      hintText: "Email..."),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.only(bottom: 10.0),
              color: Colors.grey[100],
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: _controllerNoHp,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone, size: 14.0),
                      border: InputBorder.none,
                      hintText: "No Hp..."),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.only(bottom: 10.0),
              color: Colors.grey[100],
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  obscureText: _isObscure,
                  controller: _controllerPassword,
                  decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.lock, size: 14.0),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = _isObscure ? false : true;
                          });
                        },
                        icon: Icon(
                            _isObscure
                                ? FontAwesomeIcons.eyeSlash
                                : FontAwesomeIcons.eye,
                            size: 14.0),
                      ),
                      hintText: "Password..."),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.only(right: 4.0),
              alignment: Alignment.topRight,
              child: MaterialButton(
                color: Colors.amber[600],
                onPressed: () {
                  showCupertinoDialog(
                      context: context,
                      builder: (contex) {
                        return FutureBuilder(
                          future: editProfiledata(
                              widget.id,
                              _controllerUsername.text,
                              _controllerFirstname.text,
                              _controllerLastname.text,
                              _controlleremail.text,
                              _controllerNoHp.text,
                              _controllerPassword.text),
                          builder: (contex, snap) {
                            if (snap.hasData) {
                              return CupertinoAlertDialog(
                                title: Text("Status Edit"),
                                content: Container(
                                  padding: EdgeInsets.all(20.0),
                                  child:
                                      Center(child: Text(snap.data["message"])),
                                ),
                                actions: <Widget>[
                                  MaterialButton(
                                    onPressed: () {
                                      updateName(_controllerFirstname.text,
                                          _controllerLastname.text);
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                    color: Colors.amber[600],
                                    child: Text("Close",
                                        style: TextStyle(color: Colors.white)),
                                  )
                                ],
                              );
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        );
                      });
                },
                child: Text("Update", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 14.0),
          ],
        ),
      ),
    );
  }
}

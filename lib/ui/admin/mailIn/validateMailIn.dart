import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simper_app/ui/admin/mailIn/listTileValidateCard.dart';

class ValidateMailIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.grey[200],
                  ),
                  height: 40.0,
                  width: MediaQuery.of(context).size.width - 70,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          FontAwesomeIcons.search,
                          size: 20.0,
                        ),
                        hintText: "Search...",
                        border: InputBorder.none),
                  ),
                ),
                IconButton(
                  color: Colors.grey,
                  icon: Icon(FontAwesomeIcons.sort),
                  onPressed: () {},
                )
              ],
            ),
          ),
          ListTileValidateCard(date: "22 Desember 2019", title: "Dinas Kesahatan", nosurat: "123",),
          ListTileValidateCard(date: "30 Desember 2019", title: "Dinas Kominfo", nosurat: "467",),
        ],
      ),
    );
  }
}

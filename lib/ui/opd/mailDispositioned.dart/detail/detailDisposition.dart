import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:simper_app/model/detailDispositionIn.dart';
import 'package:simper_app/ui/opd/mailDispositioned.dart/detail/historyDisposition.dart';

class DetailDispositionSelesai extends StatefulWidget {
  final String disposisiId;
  final String url;

  DetailDispositionSelesai({this.disposisiId, this.url});
  // HANDLE LOAD PDF
  @override
  _DetailDispositionState createState() => _DetailDispositionState();
}

class _DetailDispositionState extends State<DetailDispositionSelesai> {
  PDFDocument doc;

  bool _isLoading = true;
  bool _isDocument = true;

  bool _isImage = false;

  String fileBase = "http://simper.technos-studio.com/upload/suratmasuk/";

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    var getExtenstion = widget.url.split(".");
    String fileExtenstion = getExtenstion[1];
    print(fileExtenstion);

    switch (fileExtenstion) {
      case "pdf":
        doc = await PDFDocument.fromURL("$fileBase${widget.url}");
        setState(() {
          _isLoading = false;
        });
        break;

      case "png":
        setState(() {
          _isImage = true;
          _isLoading = false;
        });
        break;

      case "jpg":
        setState(() {
          _isImage = true;
          _isLoading = false;
        });
        break;

      case "jpeg":
        setState(() {
          _isImage = true;
          _isLoading = false;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedContainer(
            curve: Curves.easeIn,
            duration: Duration(seconds: 2),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(10.0),
            child: FutureBuilder(
              future: detailDisposisiMasukData(widget.disposisiId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.arrow_back_ios),
                            ),
                            Center(
                              child: Text("Detail Surat",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.0)),
                            ),
                            IconButton(
                              icon: Icon(_isDocument
                                  ? FontAwesomeIcons.history
                                  : FontAwesomeIcons.file),
                              onPressed: () {
                                setState(() {
                                  _isDocument = _isDocument ? false : true;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Text(_isDocument
                          ? snapshot.data["data"][0]["suratmasuk_nosurat"]
                          : "Riwayat Disposisi"),
                      SizedBox(height: 4.0),
                      _isDocument
                          ? Text(snapshot.data["data"][0]["skpd_pengirim"])
                          : Divider(),
                      _isLoading
                          ? Center(child: CircularProgressIndicator())
                          : Container(
                              height: MediaQuery.of(context).size.height - 158,
                              child: _isDocument
                                  ? Container(
                                      child: _isImage
                                          ? CachedNetworkImage(
                                              // width: 80.0,
                                              // height: 110.0,
                                              // fit: BoxFit.cover,
                                              imageUrl:
                                                  "$fileBase${widget.url}",
                                              placeholder: (context, url) =>
                                                  Image.asset(
                                                      "assets/images/loading2.gif"),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            )
                                          : PDFViewer(
                                              showPicker: false,
                                              document: doc,
                                            ),
                                    )
                                  : HistoryDisposisiSelesai(
                                      treePosition: snapshot.data["tree"],
                                      instruksi: snapshot.data["data"][0]
                                          ["disposisi_instruksi"],
                                      disposisiId: snapshot.data["data"][0]
                                          ["disposisi_id"],
                                    ),
                            )
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )));
  }
}

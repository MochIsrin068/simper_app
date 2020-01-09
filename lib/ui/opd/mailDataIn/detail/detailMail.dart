import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:provider/provider.dart';
import 'package:simper_app/bloc/detailMailBloc.dart';
import 'package:simper_app/ui/admin/detailMail/detailMailData.dart';


class DetailMailOpd extends StatefulWidget {
  // HANDLE LOAD PDF
  @override
  _DetailMailOpdState createState() => _DetailMailOpdState();
}

class _DetailMailOpdState extends State<DetailMailOpd> {
  PDFDocument doc;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    doc = await PDFDocument.fromURL(
        'http://eoffice.technos-studio.com/upload/surat/1-test4.pdf');

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailMailBloc>(
      builder: (context, detailDispositionBloc, _) => Scaffold(
          appBar: AppBar(
            title: Text("Detail"),
            actions: <Widget>[
              IconButton(
                icon: Icon(detailDispositionBloc.pdfPage ? FontAwesomeIcons.history : FontAwesomeIcons.file),
                onPressed: () {
                  detailDispositionBloc.pdfPage ? detailDispositionBloc.pdfPage = false : detailDispositionBloc.pdfPage = true;
                },
              )
            ],
          ),
          body: AnimatedContainer(
              curve: Curves.easeIn,
              duration: Duration(seconds: 2),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(10.0),
              child: ListView(
                children: <Widget>[
                  Text(detailDispositionBloc.pdfPage
                      ? "14/SW/34/WER/2019/15/SW/32/Wop/2019"
                      : "Data Surat"),
                  SizedBox(height: 4.0),
                  detailDispositionBloc.pdfPage
                      ? Text("Dinas Komunikasi dan Informatika")
                      : Text("Lihat secara detail informasi surat"),
                  _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Container(
                          height: MediaQuery.of(context).size.height - 100,
                          child: detailDispositionBloc.pdfPage ? PDFViewer(
                            showPicker: false,
                            document: doc,
                          ) : DetailMailData(),
                        )
                ],
              ))),
    );
  }
}

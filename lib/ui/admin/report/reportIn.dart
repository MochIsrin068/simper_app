import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';
import 'package:simper_app/bloc/addDispositionBloc.dart';

class ReportIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.green[300],
                    child: Text(
                      "Filter berdasarkan kebutuhan laporan mu. Jika ingin mencetak semua surat masuk silahkan mengosongkan form dan mengklik tombol cetak !",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Klasifikasi Surat",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.insert_drive_file),
                          hintText: "Pilih...."),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Tanggal Masuk Surat",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Consumer<AddDispositionBloc>(
                      builder: (context, addDisposition, _) {
                        return TextField(
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime(2017, 1, 1),
                                      maxTime: DateTime(2020, 1, 1),
                                      onChanged: (date) {
                                    print('change $date');
                                  }, onConfirm: (date) {
                                    print('confirm $date');
                                    String newDate = date.day.toString() +
                                        "-" +
                                        date.month.toString() +
                                        "-" +
                                        date.year.toString();

                                    addDisposition.value = newDate;
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.id);
                                },
                                icon: Icon(Icons.date_range),
                              ),
                              hintText: "Pilih...."),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: MaterialButton(
                      color: Colors.blueAccent,
                      onPressed: () {},
                      child: Text(
                        "Cetak",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

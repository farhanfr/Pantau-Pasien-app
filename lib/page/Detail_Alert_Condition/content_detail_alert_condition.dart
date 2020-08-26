import 'package:flutter/material.dart';

class ContentDetailAlertCondition extends StatelessWidget {
  final String namePatient,datePost,titlePost,descPost,nameNurse;
  ContentDetailAlertCondition({this.namePatient, this.datePost, this.titlePost, this.descPost, this.nameNurse});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Nama Pasien",
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              alignment: Alignment.topLeft,
              child: Text(
                namePatient,
                style: TextStyle(fontSize: 18.0),
              )),
          SizedBox(
            height: 25.0,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Waktu & Tgl Pemberitahuan",
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              alignment: Alignment.topLeft,
              child: Text(
                datePost,
                style: TextStyle(fontSize: 18.0),
              )),
              SizedBox(
            height: 25.0,
          ),
           Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Perawat",
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              alignment: Alignment.topLeft,
              child: Text(
                nameNurse,
                style: TextStyle(fontSize: 18.0),
              )),
          SizedBox(
            height: 25.0,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Perihal",
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              alignment: Alignment.topLeft,
              child: Text(
                titlePost,
                style: TextStyle(fontSize: 18.0),
              )),
          SizedBox(
            height: 25.0,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Isi",
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              alignment: Alignment.topLeft,
              child: Text(
                descPost,
                style: TextStyle(fontSize: 18.0),
              )),
        ],
      ),
    );
  }
}

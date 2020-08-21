import 'package:flutter/material.dart';
import 'package:pantau_pasien/page/pasien/content_patient.dart';
import 'package:pantau_pasien/page/pasien/header_patient.dart';

class MainPatientPage extends StatelessWidget {
  final Function next;

  MainPatientPage({this.next});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HeaderPatient(),
          ContentPatient(next: next),
        ],
      ),
    );
  }
}

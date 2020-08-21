import 'package:flutter/material.dart';
import 'package:pantau_pasien/const/color.dart';
import 'package:pantau_pasien/page/pasien/detail_pasien/detail_announce_condition_patient.dart';
import 'package:pantau_pasien/page/pasien/detail_pasien/header_detail_patinet.dart';
import 'package:pantau_pasien/page/pasien/detail_pasien/info_patient.dart';

class MainDetailPatient extends StatefulWidget {
  final String name,hospital;
  final int idPatient,age;

  const MainDetailPatient({this.name, this.hospital, this.idPatient, this.age});

  @override
  _MainDetailPatientState createState() => _MainDetailPatientState();
}

class _MainDetailPatientState extends State<MainDetailPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderDetailPatient(name: widget.name),
          InfoPatient(hospital: widget.hospital,age: widget.age),
          Padding(
            padding: const EdgeInsets.only(left: 26.0, top: 5.0, right: 26.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Pemberitahuan",
                      style: TextStyle(color: primaryColor, fontSize: 20.0)),
                  Icon(
                    Icons.arrow_forward,
                    size: 25.0,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          DetailAnnounceConditionPatient(idPatient: widget.idPatient),
        ],
      ),
    ));
  }
}

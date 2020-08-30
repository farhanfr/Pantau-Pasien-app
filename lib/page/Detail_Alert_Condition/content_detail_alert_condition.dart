import 'package:flutter/material.dart';
import 'package:pantau_pasien/model/alert_condition/AlertConditionPatient.dart';
import 'package:pantau_pasien/model/alert_condition/AlertConditionPatientDetail.dart';
import 'package:pantau_pasien/service/alert_condition_patient_services.dart';

class ContentDetailAlertCondition extends StatefulWidget {
  final String id;

  const ContentDetailAlertCondition({this.id});
  

  @override
  _ContentDetailAlertConditionState createState() => _ContentDetailAlertConditionState();
}

class _ContentDetailAlertConditionState extends State<ContentDetailAlertCondition> {
  AlertConditionPatientServices alertConditionPatientServices;
  @override
  void initState() {
    super.initState();
    alertConditionPatientServices = AlertConditionPatientServices();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
      child: FutureBuilder(
      future: alertConditionPatientServices.getAlertConditionById(widget.id),
      builder: (context,snapshot){
        if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "Something wrong with message: ${snapshot.error.toString()}"),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                List<AlertConditionPatient> alert = snapshot.data;
                print("DATANEE : ${snapshot.data}");
                return buildColumn(alert);
              } else {
                return Center(child: CircularProgressIndicator());
              }
    })
      
      
    );
  }

  Column buildColumn(List<AlertConditionPatient> alert) {
    return Column(
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
              alert[0].patient.name,
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
              alert[0].datepost,
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
              alert[0].nurse.name,
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
              alert[0].title,
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
              alert[0].message,
              style: TextStyle(fontSize: 18.0),
            )),
      ],
    );
  }
}

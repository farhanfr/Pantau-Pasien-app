import 'package:flutter/material.dart';
import 'package:pantau_pasien/service/patient_services.dart';

class CardMonitoringPatient extends StatefulWidget {
  @override
  _CardMonitoringPatientState createState() => _CardMonitoringPatientState();
}

class _CardMonitoringPatientState extends State<CardMonitoringPatient> {
  PatientServices patientServices;

  @override
  void initState() {
    super.initState();
    patientServices = PatientServices();
  }

  @override
  Widget build(BuildContext context) {
    return monitorPatient();
  }

  Padding monitorPatient() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23.0),
      child: Card(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 45.0, left: 36.0, bottom: 45.0),
              child: Image.asset("assets/img/dashboard.png"),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    "Jumlah pasien yang dimonitor :",
                    style: TextStyle(fontSize: 14.0),
                  ),
                  FutureBuilder(
                      future: patientServices.getCountPatient(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                                "Something wrong with message: ${snapshot.error.toString()}"),
                          );
                        } else if (snapshot.connectionState == ConnectionState.done) {
                          int patient = snapshot.data;
                          print("DATANEE : ${snapshot.data}");
                          return countTextPatient(patient);
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Text countTextPatient(int patient) {
    return Text(
      patient.toString(),
      style: TextStyle(fontSize: 36.0),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pantau_pasien/model/PatientFamily.dart';
import 'package:pantau_pasien/service/patient_family_services.dart';

class InfoProfile extends StatefulWidget {
  @override
  _InfoProfileState createState() => _InfoProfileState();
}

class _InfoProfileState extends State<InfoProfile> {
  PatientFamilyServices patientFamilyServices;

  @override
  void initState() {
    super.initState();
    patientFamilyServices = PatientFamilyServices();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: const EdgeInsets.all(25.0),
        // padding: EdgeInsets.symmetric(vertical: 30.0),
        // height: 260,
        child: Card(
            child: Container(
          padding: EdgeInsets.all(20.0),
          child: FutureBuilder(
            future: patientFamilyServices.getPatientFamilyData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "Something wrong with message: ${snapshot.error.toString()}"),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                List<PatientFamily> dataProfile = snapshot.data;
                print("DATANEE : ${snapshot.data}");
                return buildColumn(dataProfile);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            })
        )),
      ),
    );
  }

  Column buildColumn(List<PatientFamily> dataProfile) {
    return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("No.Telp"),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 60.0),
                        child: Text(dataProfile[0].numberPhone)))
              ],
            ),
            SizedBox(
              height: 21.0,
            ),
            Row(
              children: <Widget>[
                Text("NIK"),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 87.0),
                        child: Text(dataProfile[0].nik)))
              ],
            ),
            SizedBox(
              height: 21.0,
            ),
            Row(
              children: <Widget>[
                Text("Alamat"),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 60.0),
                        child: Text(dataProfile[0].address)))
              ],
            ),
          ],
        );
  }
}

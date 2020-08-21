import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantau_pasien/model/Patient.dart';
import 'package:pantau_pasien/page/pasien/detail_pasien/main_detail_patient.dart';
import 'package:pantau_pasien/service/patient_services.dart';

class ContentPatient extends StatefulWidget {
  final Function next;

  ContentPatient({this.next});
  

  @override
  _ContentPatientState createState() => _ContentPatientState();
}

class _ContentPatientState extends State<ContentPatient> {
  PatientServices patientServices;

  @override
  void initState() {
    super.initState();
    patientServices=PatientServices();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: patientServices.getPatientByNik(),
      builder: (context,snapshot){
        if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "Something wrong with message: ${snapshot.error.toString()}"),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                List<Patient> patient = snapshot.data;
                print("DATANEE : ${snapshot.data}");
                return buildExpanded(patient);
              } else {
                return Center(child: CircularProgressIndicator());
              }
    });
    }

  Expanded buildExpanded(List<Patient> patient) {
    return Expanded(
    child: ListView.builder(
      padding: EdgeInsets.zero,
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: patient.length,
      itemBuilder: (BuildContext contex, int index) {
        return InkWell(
          onTap: (){
            Get.to(MainDetailPatient(
              idPatient: patient[index].id,
              name: patient[index].name,
              hospital: patient[index].hospital.name,
              age: patient[index].age,
              ));
          },
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircleAvatar(
                    maxRadius: 40.0,
                    backgroundImage: NetworkImage(
                        'https://images8.alphacoders.com/104/1040682.jpg')),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(patient[index].name),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(patient[index].hospital.name),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Divider(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
  }
}
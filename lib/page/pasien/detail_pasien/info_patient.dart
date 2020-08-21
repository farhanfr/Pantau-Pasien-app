import 'package:flutter/material.dart';

class InfoPatient extends StatelessWidget {
  final String hospital;
  final int age;
  InfoPatient({this.hospital, this.age});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Container(
        margin: const EdgeInsets.all(25.0),
        // padding: EdgeInsets.symmetric(vertical: 30.0),
        // height: 260,
        child: Card(
            child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Usia"),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 60.0),
                          child: Text("$age Tahun")))
                ],
              ),
              SizedBox(
                height: 21.0,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.local_hospital),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 65.0),
                          child: Text("$hospital")))
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
